package com.ianholstead.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.website.Blog;
import com.ianholstead.website.Photo;
import com.ianholstead.website.PhotoAlbum;
import com.ianholstead.website.Thumb;
import com.ianholstead.website.World;

import ian.security.*


class WorldController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def hdImageService
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def worldInstanceList 
		def worldTotal
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		if (getRole().id <= 2) {
			worldInstanceList = World.list(params)
			worldTotal = World.count()
		}
		else {
			worldInstanceList = World.findAllByStatusBetween(1,2,params)
			worldTotal = World.countByStatusBetween(1,2)
		}
        [worldInstanceList: worldInstanceList, worldInstanceTotal: worldTotal]
    }
	
	

	@Secured(['ROLE_ADMIN'])
    def create() {
        [worldInstance: new World(params), blogInstance: new Blog(params), photoInstance: new Photo(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def worldInstance = new World(params)
		def blogInstance = new Blog(params)
		def photoInstance = new Photo(params)
		def thumbInstance = new Thumb()
		def uploadedPhoto = request.getFile('photoPayload')
		photoInstance.photoPayload = uploadedPhoto.getBytes()
		photoInstance.photoOriginalName = uploadedPhoto.originalFilename
		photoInstance.album = PhotoAlbum.findByName("World")
		
		if(uploadedPhoto.getBytes().size() != 0) {
			byte[] thumb = hdImageService.scale(uploadedPhoto.getInputStream(), 300, null)
			thumbInstance.thumbPayload = thumb
			photoInstance.thumb = thumbInstance
			
			if (!thumbInstance.save(flush: true)) {
				render(view: "create", model: [photoInstance: photoInstance])
				return
			}
		}
		
		if(!photoInstance.save(flush:true)){
			render(view: "create", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
			return
		}
		
		blogInstance.blogContent = parseBlog(params.blogContent)
		blogInstance.authenticationLevel = worldInstance.status == 1 || worldInstance.status == 2?
			Role.findByAuthority("ROLE_NONE") : Role.findByAuthority("ROLE_ADMIN")
		blogInstance.save()
		
		
		worldInstance.photo = photoInstance
		worldInstance.blog = blogInstance
        if (!worldInstance.save(flush:true)) {
			blogInstance.delete()
			photoInstance.delete(flush:true)
            render(view: "create", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
        redirect(action: "show", id: worldInstance.id)
    }
	
	def currentWeek(){
		
		World current = World.findByStatus(1)
		
		if(!current){
			redirect(action: "list")
			flash.message = "There currently is no world"
			return
		}
		
		redirect(action:"show", id:current.id)
	}
	
	@Secured(['ROLE_ADMIN'])
	def changeWorld(){
		def currentWorld = World.findAllByStatus(1)
		def nextWorld
		def tempWorld 
		
		//This removes duplicate current worlds
		if(currentWorld.size()>1){
			currentWorld[0].status = 2
			currentWorld[0].save()
			
			for(int i = 2; i<currentWorld.size(); i++){
				currentWorld[i].status = 0
				blogVisiblity(currentWorld[i].blog, false)
				currentWorld[i].save(flush:true)
			}
		}
		else{
			nextWorld = World.findByStatus(11)?:World.findByStatus(0)
			if(!nextWorld){
				if(currentWorld[0]){
					nextWorld = currentWorld[0]
					flash.message = 'No future worlds were found!'
				}
				else{
					flash.message = 'No current or future worlds were found!'
					return
				}
			}
			else{
				currentWorld[0]?.status= 2
				blogVisiblity(nextWorld.blog, true)
				nextWorld.status = 1
				nextWorld.save(flush:true)
			}
			if(!World.findByStatus(11)){
				for(int i = 12; World.findByStatus(i); i++){
					tempWorld = World.findAllByStatus(i)
					tempWorld.each{
						it.status = (i+1)
					}
					tempWorld[0].status = (i-1)
					tempWorld[0].save()
				}
			}
		}
		
		redirect(action: "list")
	}
	
	protected def blogVisiblity(Blog blog, boolean makeVisible){
		blog.authenticationLevel = makeVisible? Role.findByAuthority("ROLE_NONE") : Role.findByAuthority("ROLE_ADMIN")
		blog.save()
	}
	
    def show() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance?.photo
		def blogInstance = worldInstance?.blog
        
		if (!worldInstance || !photoInstance || !blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }
		if (getRole().id > 2) {
			if (worldInstance.status != 1 && worldInstance.status != 2) {
				flash.message = "That World is not yet ready!"
				redirect(action: "list")
				return
			}
		}
        
		[worldInstance: worldInstance, photoInstance: photoInstance, blogInstance: blogInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance?.photo
		def blogInstance = worldInstance?.blog
		blogInstance.blogContent = blogInstance.blogContent.replaceAll("<br/>", "\n")
        
		if (!worldInstance || !photoInstance || !blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }
		
        [worldInstance: worldInstance, photoInstance: photoInstance, blogInstance: blogInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance?.photo
		def blogInstance = worldInstance?.blog
		def thumbInstance = photoInstance?.thumb
		def tempPhoto = photoInstance?.photoPayload
        
		if (!worldInstance || !photoInstance || !blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (worldInstance.version > version) {
                worldInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'world.label', default: 'World')] as Object[],
                          "Another user has updated this World while you were editing")
                render(view: "edit", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
                return
            }
        }

        worldInstance.properties = params
		blogInstance.properties = params
		photoInstance.properties = params
		
		blogInstance.blogContent = parseBlog(params.blogContent)
		blogInstance.authenticationLevel = worldInstance.status == 1 || worldInstance.status == 2?
			Role.findByAuthority("ROLE_NONE") : Role.findByAuthority("ROLE_ADMIN")
		
		def uploadedPhoto = request.getFile('photoPayload')
		def tempPayload = uploadedPhoto.getBytes()
		if(tempPayload){
			photoInstance.photoOriginalName = uploadedPhoto.originalFilename
			
			byte[] thumb = hdImageService.scale(uploadedPhoto.getInputStream(), 300, null)
			thumbInstance.thumbPayload = thumb
			
			photoInstance.thumb = thumbInstance
			
			if (!thumbInstance.save(flush: true)) {
				render(view: "create", model: [photoInstance: photoInstance])
				return
			}
		}
		else{
			tempPayload = tempPhoto
		}
		
		photoInstance.photoPayload = tempPayload
		
		blogInstance.save()
		if(!photoInstance.save(flush:true)){
			render(view: "edit", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
			return
		}

        if (!worldInstance.save(flush: true)) {
            render(view: "edit", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
        redirect(action: "show", id: worldInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance?.photo
		def blogInstance = worldInstance?.blog
        
		if (!worldInstance || !photoInstance || !blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }

        try {
			worldInstance.delete(flush: true)
			photoInstance.delete(flush: true)
			blogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
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
	
	protected def parseBlog(def blogContent){
		def blogTemp = ""
		blogContent = blogContent.split("(?=<.?pre.*?>)")
		blogContent.eachWithIndex { it, i ->
			if(i%2 == 0){
				blogTemp = blogTemp + it.replaceAll("\n", "<br/>")
			}
			else{
				blogTemp = blogTemp + it
			}
		}
		return blogTemp
	}
}
