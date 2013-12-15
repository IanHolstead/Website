package ian.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException


class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }
	
//	def albumList(){
//		def albums = []
//		List temp 
//		
//		temp = Photo.findAll {
//			it.album	
//		}
//		
//		temp.each{
//			albums.add([album:it.album,id:it.id])
//		}
//		
//		albums = albums.collect {
//			if(it.album == 'world')
//				return
//			else
//				return it
//		}
//		
//		albums.removeAll([null])
//		
//		render(view:'albums', model:[albums:albums])
//	}

//    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//		
//		def photoInstance
//		
//		if (!params.album) {
//			redirect(action:"albumList", params:params)
//			return
//		}
//		
//		photoInstance = Photo.findAllByAlbum(params.album)
//		
//		render(view:'albums', model:[photoInstanceList: photoInstance, photoInstanceTotal: photoInstance.count()])
//    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [photoInstance: new Photo(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
		params.album = PhotoAlbum.findWhere(name:params.album)
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
		def photoInstance = Photo.get(params.id)
		response.outputStream<<photoInstance.photoPayload
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
