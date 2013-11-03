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
        [worldInstance: new World(params)]
    }

    def save() {
        def worldInstance = new World(params)
        if (!worldInstance.save(flush: true)) {
            render(view: "create", model: [worldInstance: worldInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'world.label', default: 'World'), worldInstance.id])
        redirect(action: "show", id: worldInstance.id)
    }

    def show() {
        def worldInstance = World.get(params.id)
        if (!worldInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'world.label', default: 'World'), params.id])
            redirect(action: "list")
            return
        }

        [worldInstance: worldInstance]
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
