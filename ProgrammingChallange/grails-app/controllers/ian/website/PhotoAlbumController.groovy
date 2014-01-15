package ian.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException


class PhotoAlbumController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def photoAlbumInstanceList = PhotoAlbum.list()
		photoAlbumInstanceList.remove(PhotoAlbum.findByName("World"))
		def photoAlbumCount = photoAlbumInstanceList.size()
		
        [photoAlbumInstanceList: photoAlbumInstanceList, photoAlbumInstanceTotal: photoAlbumCount]
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        [photoAlbumInstance: new PhotoAlbum(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def photoAlbumInstance = new PhotoAlbum(params)
        photoAlbumInstance.dateCreated = new java.sql.Date((new Date()).getTime())
		if (!photoAlbumInstance.save(flush: true)) {
            render(view: "create", model: [photoAlbumInstance: photoAlbumInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), photoAlbumInstance.id])
        redirect(action: "list")
    }

    def show() {
        def photoAlbumInstance = PhotoAlbum.get(params.id)
		if (!photoAlbumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "list")
            return
        }

        [photoAlbumInstance: photoAlbumInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def photoAlbumInstance = PhotoAlbum.get(params.id)
        if (!photoAlbumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "list")
            return
        }

        [photoAlbumInstance: photoAlbumInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def photoAlbumInstance = PhotoAlbum.get(params.id)
        if (!photoAlbumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoAlbumInstance.version > version) {
                photoAlbumInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photoAlbum.label', default: 'PhotoAlbum')] as Object[],
                          "Another user has updated this PhotoAlbum while you were editing")
                render(view: "edit", model: [photoAlbumInstance: photoAlbumInstance])
                return
            }
        }

        photoAlbumInstance.properties = params

        if (!photoAlbumInstance.save(flush: true)) {
            render(view: "edit", model: [photoAlbumInstance: photoAlbumInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), photoAlbumInstance.id])
        redirect(action: "show", id: photoAlbumInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def photoAlbumInstance = PhotoAlbum.get(params.id)
        if (!photoAlbumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "list")
            return
        }

        try {
            photoAlbumInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photoAlbum.label', default: 'Photo Album'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
