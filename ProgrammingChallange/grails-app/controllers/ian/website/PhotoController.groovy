package ian.website

import grails.plugins.springsecurity.Secured
import java.awt.image.BufferedImage
import org.grails.plugins.imagetools.*
import javax.imageio.ImageIO
import org.springframework.dao.DataIntegrityViolationException


class PhotoController {
	
	def hdImageService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list() {
		redirect(controller: "photoAlbum", action: "list", params: params)
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [photoInstance: new Photo(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
		params.album = PhotoAlbum.findWhere(name:params.album)
        def photoInstance = new Photo(params)
		def thumbInstance = new Thumb()
		def uploadedPhoto = request.getFile('photoPayload')
		photoInstance.photoPayload = uploadedPhoto.getBytes()
		photoInstance.photoOriginalName = uploadedPhoto.originalFilename
		
		byte[] thumb = hdImageService.scale(uploadedPhoto.getInputStream(), 300, null)
		thumbInstance.thumbPayload = thumb
		
		photoInstance.thumb = thumbInstance
		
		if (!thumbInstance.save(flush: true)) {
			render(view: "create", model: [photoInstance: photoInstance])
			return
		}
		
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
		List photos = Photo.findAllByAlbum(photoInstance.album)
		photos.sort(true) { a, b ->
			a.id <=> b.id
		}
		
		def photoNext
		def photoPrev
		for(int i = 0; i<(photos.size()-1); i++){
			if(photos[i].id == photoInstance.id){
				photoNext = photos[i+1]
				photoPrev = photos[i-1]
			}
		}
		if(!photoNext)
			photoNext = photos[0]
		if(!photoPrev){
			if(photos.size()>2)
				photoPrev = photos[-2]
			else
				photoPrev = photos[0]
		}
		
        [photoInstance: photoInstance, photoNext: photoNext, photoPrev: photoPrev]
    }
	
	def showPayload(){
		def id = (params.id).split("\\.")
		id = id[0]
		def photoInstance = Photo.get(id)
		response.outputStream<<photoInstance.photoPayload
		response.outputStream.flush()
	}
	
	def showThumb(){
		def id = (params.id).split("\\.")
		id = id[0]
		def thumbInstance = Thumb.get(Photo.get(id).thumb.id)
		response.outputStream<<thumbInstance.thumbPayload
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
		def thumbInstance = photoInstance.thumb
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
		params.album = PhotoAlbum.findWhere(name:params.album)
		def uploadedPhoto = request.getFile('photoPayload')
		def tempPayload = uploadedPhoto.getBytes()
		if(tempPayload){
			photoInstance.photoOriginalName = uploadedPhoto.originalFilename
			byte[] thumb = hdImageService.scale(uploadedPhoto.getInputStream(), 300, null)
			thumbInstance.thumbPayload = thumb
			
			thumbInstance.save(flash:true)
		}
		else{
			tempPayload = photoInstance.photoPayload 
		}
        photoInstance.properties = params
		photoInstance.photoPayload = tempPayload
		
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
