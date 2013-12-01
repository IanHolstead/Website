package ian.programming.challenge

import org.springframework.dao.DataIntegrityViolationException

/**
 * UserProfileController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userProfileInstanceList: UserProfile.list(params), userProfileInstanceTotal: UserProfile.count()]
    }

    def create() {
        [userProfileInstance: new UserProfile(params)]
    }

    def save() {
        def userProfileInstance = new UserProfile(params)
        if (!userProfileInstance.save(flush: true)) {
            render(view: "create", model: [userProfileInstance: userProfileInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
        redirect(action: "show", id: userProfileInstance.id)
    }

    def show() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "list")
            return
        }

        [userProfileInstance: userProfileInstance]
    }

    def edit() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "list")
            return
        }

        [userProfileInstance: userProfileInstance]
    }

    def update() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userProfileInstance.version > version) {
                userProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userProfile.label', default: 'UserProfile')] as Object[],
                          "Another user has updated this UserProfile while you were editing")
                render(view: "edit", model: [userProfileInstance: userProfileInstance])
                return
            }
        }

        userProfileInstance.properties = params

        if (!userProfileInstance.save(flush: true)) {
            render(view: "edit", model: [userProfileInstance: userProfileInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
        redirect(action: "show", id: userProfileInstance.id)
    }

    def delete() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userProfileInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
