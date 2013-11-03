package programmingchallenge

import org.springframework.dao.DataIntegrityViolationException

import programmingchallenge.web.UserProfile;

class UserProfileController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userProfileInstanceList: UserProfile.list(params), userProfileInstanceTotal: UserProfile.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[userProfileInstance: new UserProfile(params)]
			break
		case 'POST':
	        def userProfileInstance = new UserProfile(params)
	        if (!userProfileInstance.save(flush: true)) {
	            render view: 'create', model: [userProfileInstance: userProfileInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
	        redirect action: 'show', id: userProfileInstance.id
			break
		}
    }

    def show() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect action: 'list'
            return
        }

        [userProfileInstance: userProfileInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def userProfileInstance = UserProfile.get(params.id)
	        if (!userProfileInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [userProfileInstance: userProfileInstance]
			break
		case 'POST':
	        def userProfileInstance = UserProfile.get(params.id)
	        if (!userProfileInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (userProfileInstance.version > version) {
	                userProfileInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'userProfile.label', default: 'UserProfile')] as Object[],
	                          "Another user has updated this UserProfile while you were editing")
	                render view: 'edit', model: [userProfileInstance: userProfileInstance]
	                return
	            }
	        }

	        userProfileInstance.properties = params

	        if (!userProfileInstance.save(flush: true)) {
	            render view: 'edit', model: [userProfileInstance: userProfileInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
	        redirect action: 'show', id: userProfileInstance.id
			break
		}
    }

    def delete() {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect action: 'list'
            return
        }

        try {
            userProfileInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
