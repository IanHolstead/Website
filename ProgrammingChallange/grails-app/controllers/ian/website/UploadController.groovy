package ian.website

import org.springframework.dao.DataIntegrityViolationException

/**
 * UploadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UploadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [uploadInstanceList: Upload.list(params), uploadInstanceTotal: Upload.count()]
    }

    def create() {
        [uploadInstance: new Upload(params)]
    }

    def save() {
        def uploadInstance = new Upload(params)
        if (!uploadInstance.save(flush: true)) {
            render(view: "create", model: [uploadInstance: uploadInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'upload.label', default: 'Upload'), uploadInstance.id])
        redirect(action: "show", id: uploadInstance.id)
    }

    def show() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "list")
            return
        }

        [uploadInstance: uploadInstance]
    }

    def edit() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "list")
            return
        }

        [uploadInstance: uploadInstance]
    }

    def update() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (uploadInstance.version > version) {
                uploadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'upload.label', default: 'Upload')] as Object[],
                          "Another user has updated this Upload while you were editing")
                render(view: "edit", model: [uploadInstance: uploadInstance])
                return
            }
        }

        uploadInstance.properties = params

        if (!uploadInstance.save(flush: true)) {
            render(view: "edit", model: [uploadInstance: uploadInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'upload.label', default: 'Upload'), uploadInstance.id])
        redirect(action: "show", id: uploadInstance.id)
    }

    def delete() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "list")
            return
        }

        try {
            uploadInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'upload.label', default: 'Upload'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
