package ian.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException


class WorldController {
	
	def hdImageService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def worldInstanceList = World.findAllByStatus(1)
		worldInstanceList.addAll(World.findAllByStatus(2))
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [worldInstanceList: worldInstanceList, worldInstanceTotal: World.count()]
    }
	
	

	@Secured(['ROLE_ADMIN'])
    def create() {
        [worldInstance: new World(params), blogInstance: new Blog(params), photoInstance: new Photo(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def worldInstance = new World(params)
		def blogInstance = new Blog(params)
		def blogContent = params.blogContent
		blogContent = blogContent.replaceAll("\n", "<br/>")
		blogInstance.blogContent = blogContent
		def photoInstance = new Photo(params)
		def thumbInstance = new Thumb()
		def uploadedPhoto = request.getFile('photoPayload')
		photoInstance.photoPayload = uploadedPhoto.getBytes()
		photoInstance.photoOriginalName = uploadedPhoto.originalFilename
		photoInstance.album = PhotoAlbum.findByName("World")
		
		byte[] thumb = hdImageService.scale(uploadedPhoto.getInputStream(), 300, null)
		thumbInstance.thumbPayload = thumb
		
		photoInstance.thumb = thumbInstance
		
		if (!thumbInstance.save(flush: true)) {
			render(view: "create", model: [photoInstance: photoInstance])
			return
		}
		
		blogInstance.save()
		if(!photoInstance.save(flush:true)){
			render(view: "create", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
//			println("")
			return
		}
//		else{
//			println("")
//		}
		
//		println("Photo Instance:"+photoInstance?.id)
		worldInstance.photo = photoInstance
//		println("Blog Instance"+blogInstance?.id)
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
		
		if(currentWorld.size()>1){
			currentWorld[0].status = 2
			currentWorld[0].save(flash:true)
			
			for(int i = 2; i<currentWorld.size(); i++){
				currentWorld[i].status = 0
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
					tempWorld.each{it.save(flush:true)}
				}
			}
		}
		
		redirect(action: "list")
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
		if (worldInstance.status !=1 && worldInstance.status !=2) {
			flash.message = "That World is not yet ready!"
			redirect(action: "list")
			return
		}
        
		[worldInstance: worldInstance, photoInstance: photoInstance, blogInstance: blogInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance?.photo
		def blogInstance = worldInstance?.blog
        
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
		
//		photoInstance.album = PhotoAlbum.findByName("World")
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
			tempPayload = photoInstance.photoPayload
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
        if (!worldInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }

        try {
            worldInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
