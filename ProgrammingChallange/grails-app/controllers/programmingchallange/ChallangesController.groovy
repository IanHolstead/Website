package programmingchallange

import org.springframework.dao.DataIntegrityViolationException

class ChallangesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [challangesInstanceList: Challanges.list(params), challangesInstanceTotal: Challanges.count()]
    }

    def create() {
        [challangesInstance: new Challanges(params)]
    }

    def save() {
        def challangesInstance = new Challanges(params)
        if (!challangesInstance.save(flush: true)) {
            render(view: "create", model: [challangesInstance: challangesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'challanges.label', default: 'Challanges'), challangesInstance.id])
        redirect(action: "show", id: challangesInstance.id)
    }

    def show(Long id) {
        def challangesInstance = Challanges.get(id)
        if (!challangesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "list")
            return
        }

        [challangesInstance: challangesInstance]
    }

    def edit(Long id) {
        def challangesInstance = Challanges.get(id)
        if (!challangesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "list")
            return
        }

        [challangesInstance: challangesInstance]
    }

    def update(Long id, Long version) {
        def challangesInstance = Challanges.get(id)
        if (!challangesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (challangesInstance.version > version) {
                challangesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'challanges.label', default: 'Challanges')] as Object[],
                          "Another user has updated this Challanges while you were editing")
                render(view: "edit", model: [challangesInstance: challangesInstance])
                return
            }
        }

        challangesInstance.properties = params

        if (!challangesInstance.save(flush: true)) {
            render(view: "edit", model: [challangesInstance: challangesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'challanges.label', default: 'Challanges'), challangesInstance.id])
        redirect(action: "show", id: challangesInstance.id)
    }

    def delete(Long id) {
        def challangesInstance = Challanges.get(id)
        if (!challangesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "list")
            return
        }

        try {
            challangesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'challanges.label', default: 'Challanges'), id])
            redirect(action: "show", id: id)
        }
    }
}
