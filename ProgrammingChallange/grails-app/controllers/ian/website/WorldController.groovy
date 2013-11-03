package ian.website

import org.springframework.dao.DataIntegrityViolationException

class WorldController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [worldInstanceList: World.list(params), worldInstanceTotal: World.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[worldInstance: new World(params)]
			break
		case 'POST':
	        def worldInstance = new World(params)
	        if (!worldInstance.save(flush: true)) {
	            render view: 'create', model: [worldInstance: worldInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
	        redirect action: 'show', id: worldInstance.id
			break
		}
    }

    def show() {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect action: 'list'
            return
        }

        [worldInstance: worldInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def worldInstance = World.get(params.id)
	        if (!worldInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [worldInstance: worldInstance]
			break
		case 'POST':
	        def worldInstance = World.get(params.id)
	        if (!worldInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (worldInstance.version > version) {
	                worldInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'world.label', default: 'World')] as Object[],
	                          "Another user has updated this World while you were editing")
	                render view: 'edit', model: [worldInstance: worldInstance]
	                return
	            }
	        }

	        worldInstance.properties = params

	        if (!worldInstance.save(flush: true)) {
	            render view: 'edit', model: [worldInstance: worldInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
	        redirect action: 'show', id: worldInstance.id
			break
		}
    }

    def delete() {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect action: 'list'
            return
        }

        try {
            worldInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
