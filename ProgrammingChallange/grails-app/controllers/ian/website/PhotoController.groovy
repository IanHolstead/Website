package ian.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException


class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [photoInstanceList: Photo.list(params), photoInstanceTotal: Photo.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [photoInstance: new Photo(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def photoInstance = new Photo(params)
		def uploadedPhoto = request.getFile('photoPayload')
		photoInstance.photoPayload = uploadedPhoto.getBytes()
		photoInstance.photoOriginalName = uploadedPhoto.originalFilename
		if (!photoInstance.save(flush: true)) {
			render(view: "create", model: [photoInstance: photoInstance])
			return
		}
		flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def show() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }
        [photoInstance: photoInstance]
    }
	
	def showPayload(){
		def uploadInstance = Upload.get(params.id)
		response.outputStream<<uploadInstance.filePayload
		response.outputStream.flush()
	}

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoInstance.version > version) {
                photoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photo.label', default: 'Photo')] as Object[],
                          "Another user has updated this Photo while you were editing")
                render(view: "edit", model: [photoInstance: photoInstance])
                return
            }
        }
		def uploadedPhoto = request.getFile('photoPayload')
        photoInstance.properties = params
		
        if (!photoInstance.save(flush: true)) {
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            photoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
