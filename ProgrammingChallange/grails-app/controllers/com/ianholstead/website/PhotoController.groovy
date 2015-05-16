package com.ianholstead.website

import grails.plugins.springsecurity.Secured

import java.awt.image.BufferedImage

import javax.imageio.ImageIO

import org.apache.commons.lang.RandomStringUtils
import org.grails.plugins.imagetools.*
import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.security.*

class PhotoController {
	
	def hdImageService
	def springSecurityService
	def grailsApplicaiton
	private static def validExtensions = ['png', 'jpg', 'jpeg', 'tiff', 'bmp', 'gif', 'svg']
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(controller: "photoAlbum", action: "list", params: params)
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
		params.album = PhotoAlbum.findByName(params.album)
		params.authenticationLevel = params.album.authenticationLevel
		
		String randomString = null
		while (params.secureUrl && (!randomString || randomString == Photo.findBySecureUrl(randomString))) {
			randomString = RandomStringUtils.random(10, ((('A'..'Z') + ('0'..'9')).join()).toCharArray())
		}
		params.secureUrl = randomString
		
        Photo photoInstance = new Photo(params)
		
		def uploadedPhoto = request.getFile('photoPayload')
		if(!uploadedPhoto.empty){
			photoInstance.photoOriginalName = uploadedPhoto.originalFilename
			
			def extension = photoInstance.photoOriginalName.toLowerCase().split('\\.')
			photoInstance.photoExtension = extension[-1]
		}
		
		if (!photoInstance.save(flush: true)) {
			render(view: "create", model: [photoInstance: photoInstance])
			return
		}
		
		if(!uploadedPhoto.empty) {
			File photo = new File(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoInstance.getUrl())
			photo.createNewFile()
			
			uploadedPhoto.transferTo(photo)
			
			BufferedImage thumb = hdImageService.scale(ImageIO.read(photo), 300, null)
			
			File thumbFile = new File(grailsApplication.config.baseFilePath + grailsApplication.config.thumbsPath + photoInstance.getUrl())
			thumbFile.createNewFile()
			ImageIO.write(thumb, photoInstance.photoExtension, thumbFile)
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label')])
        redirect(action: "show", id: photoInstance.getPageUrl())
    }

    def show() {
        def photoInstance = Photo.get(getId(params.id))
		if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label')])
			redirect(controller: "photoAlbum", action: "list")
			return
		}
		
		if (photoInstance.authenticationLevel.id < getRole().id) {
			redirect(uri:'/accessdenied')
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
	
	def showPastSecurity() {
		def photoInstance = Photo.findBySecureUrl(params.id)
		if (!photoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label')])
			redirect(action: "list")
			return
		}
		
		render(view: 'show', model:[photoInstance: photoInstance, noNav: true])
	}
	
	def showPayload(){
		try {
			def path = grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + "${params.id}"
			File photo = new File(path)
			response.outputStream << photo.getBytes()
			response.outputStream.flush()
		} 
		catch(FileNotFoundException e) {
			
		}
	}
	
	def showThumb(){
		try {
			def path = grailsApplication.config.baseFilePath + grailsApplication.config.thumbsPath + "${params.id}"
			File thumb = new File(path)
			response.outputStream << thumb.getBytes()
			response.outputStream.flush()
		} 
		catch(FileNotFoundException e) {
			
		}
	}

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def photoInstance = Photo.get(getId(params.id))
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label')])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def photoInstance = Photo.read(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label')])
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
		
		def photoChangeName = photoInstance.photoName != params.photoName
		def photoOldName = photoInstance.getUrl()
		
		params.album = PhotoAlbum.findWhere(name:params.album)
		params.authenticationLevel = params.album.authenticationLevel
		
		String randomString = null
		if(params.secureUrl){
			if(!photoInstance.secureUrl){ 
				while (!randomString || randomString == Photo.findBySecureUrl(randomString)) {
					randomString = RandomStringUtils.random(10, ((('A'..'Z') + ('0'..'9')).join()).toCharArray())
				}
			}
			else{
				randomString = photoInstance.secureUrl
			}
		}
		
		params.secureUrl = randomString
		
		photoInstance.properties = params
		
		def uploadedPhoto = request.getFile('photoPayload')
		if(!uploadedPhoto.empty){
			photoInstance.photoOriginalName = uploadedPhoto.originalFilename
			
			def extension = photoInstance.photoOriginalName.toLowerCase().split('\\.')
			photoInstance.photoExtension = extension[-1]
		}
		
		
        if (!photoInstance.save(flush: true)) {
			photoInstance.secureUrl = photoInstance.secureUrl?true:false
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }
		
		File photo
		File thumbFile
		if (photoChangeName) {
			photo = new File(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoOldName)
			thumbFile = new File(grailsApplication.config.baseFilePath + grailsApplication.config.thumbsPath + photoOldName)
			photo.renameTo(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoInstance.getUrl())
			thumbFile.renameTo(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoInstance.getUrl())
		}
		else {
			photo = new File(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoInstance.getUrl())
			thumbFile = new File(grailsApplication.config.baseFilePath + grailsApplication.config.thumbsPath + photoInstance.getUrl())
		}
		
		if(!uploadedPhoto.empty) {
			photo.createNewFile()
			uploadedPhoto.transferTo(photo)
			
			BufferedImage thumb = hdImageService.scale(ImageIO.read(photo), 300, null)
			
			
			thumbFile.createNewFile()
			ImageIO.write(thumb, photoInstance.photoExtension, thumbFile)
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label')])
        redirect(action: "show", id: photoInstance.getPageUrl())
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def photoInstance = Photo.get(getId(params.id))
		File photo = new File(grailsApplication.config.baseFilePath + grailsApplication.config.photoPath + photoInstance.getUrl())
		File thumbFile = new File(grailsApplication.config.baseFilePath + grailsApplication.config.thumbsPath + photoInstance.getUrl())

        try {
            photoInstance.delete(flush: true)
			photo.delete()
			thumbFile.delete()
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label')])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photo.label')])
            redirect(action: "show", id: params.id)
        }
    }
	
	protected def getRole(){
		if(springSecurityService.getPrincipal() != 'anonymousUser'){
			def temp = springSecurityService.getPrincipal().getAuthorities().toArray()
			return Role.findByAuthority(temp[0].toString())
		}
		else{
			return Role.findByAuthority('ROLE_NONE')
		}
	}
	
	protected getId(String name){
		def id = Photo.findByPhotoName(name.replace('-', ' '))?.id
		id = id?:-1
	}
}
