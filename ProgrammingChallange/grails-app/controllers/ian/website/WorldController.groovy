package ian.website

import org.springframework.dao.DataIntegrityViolationException

/**
 * WorldController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WorldController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [worldInstanceList: World.list(params), worldInstanceTotal: World.count()]
    }

    def create() {
        [worldInstance: new World(params), blogInstance: new Blog(params), photoInstance: new Photo(params)]
    }

    def save() {
        def worldInstance = new World(params)
		def blogInstance = new Blog(params)
		def photoInstance = new Photo(params)
		def uploadedPhoto = request.getFile('photoPayload')
		photoInstance.photoPayload = uploadedPhoto.getBytes()
		photoInstance.photoOriginalName = uploadedPhoto.originalFilename
		blogInstance.save(failOnError:true)
		if(!photoInstance.save(flush:true, failOnError:true)){
			render(view: "create", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
			println("WTF!")
			return
		}
		else{
			println("WHYYYYYY")
		}
		
		println("Photo Instance:"+photoInstance?.id)
		worldInstance.photo = photoInstance
		println("Blog Instance"+blogInstance?.id)
		worldInstance.blog = blogInstance
        if (!worldInstance.save()) {
            render(view: "create", model: [worldInstance: worldInstance, blogInstance:blogInstance, photoInstance:photoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
        redirect(action: "show", id: worldInstance.id)
    }
	
	def currentWeek(long id){
		params.id = id
		if(!params.id){
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(uri:'/')
			return	
		}
		World current = World.findAll {status == 1}
		redirect(action:"show", id:current.id)
	}

    def show() {
        def worldInstance = World.get(params.id)
		def photoInstance = worldInstance.photo
		def blogInstance = worldInstance.blog
        if (!worldInstance && !photoInstance && blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }
        [worldInstance: worldInstance, photoInstance: photoInstance, blogInstance: blogInstance]
    }
	
	def showPayload(){
		def photoInstance = Photo.get(params.id)
		response.outputStream<<photoInstance.photoPayload
		response.outputStream.flush()
	}

    def edit() {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }

        [worldInstance: worldInstance]
    }

    def update() {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
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
                render(view: "edit", model: [worldInstance: worldInstance])
                return
            }
        }

        worldInstance.properties = params

        if (!worldInstance.save(flush: true)) {
            render(view: "edit", model: [worldInstance: worldInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
        redirect(action: "show", id: worldInstance.id)
    }

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
