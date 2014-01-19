package ian.security

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

class UserController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	
	@Secured(['ROLE_SUPER_USER'])
    def index() {
        redirect(action: "show", params: params)
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
	
	@Secured(['ROLE_SUPER_ADMIN'])
    def create() {
        [userInstance: new User(params), userRoleInstance: new UserRole()]
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def save() {
        def userInstance = new User(params)
		def userRoleInstance = new UserRole(params)
        if (!userInstance.save(flush: true, failOnError:true) && userRoleInstance.save(flush:true, failOnError:true)) {
            render(view: "create", model: [userInstance: userInstance, userRoleInstance:userRoleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

	@Secured(['ROLE_SUPER_USER'])
    def show() {
        def userInstance = springSecurityService.currentUser
		def userRoleInstance = UserRole.findByUser(userInstance)
		if(userRoleInstance.role == Role.findByAuthority('ROLE_SUPER_ADMIN')){
			if(params.id){
				userInstance = User.get(params.id)
				userRoleInstance = UserRole.findByUser(userInstance)
			}
		}
        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance, userRoleInstance:userRoleInstance]
    }
	
	@Secured(['ROLE_SUPER_USER'])
    def edit() {
        def userInstance = springSecurityService.currentUser
		def userRoleInstance = UserRole.findByUser(userInstance)
		if(userRoleInstance.role == Role.findByAuthority('ROLE_SUPER_ADMIN')){
			if(params.id){
				userInstance = User.get(params.id)
				userRoleInstance = UserRole.findByUser(userInstance)
			}
		}
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance, userRoleInstance:userRoleInstance]
    }
	
	@Secured(['ROLE_SUPER_USER'])
    def update() {
		def userInstance = springSecurityService.currentUser
		def userRoleInstance = UserRole.findByUser(userInstance)
		if(userRoleInstance.role == Role.findByAuthority('ROLE_SUPER_ADMIN')){
			if(params.id){
				userInstance = User.get(params.id)
				userRoleInstance = UserRole.findByUser(userInstance)
			}
		}
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def delete() {
        def userInstance = User.get(params.id)
		def userRoleInstance = UserRole.findByUser(userInstance)
        if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
			userRoleInstance.delete(flush:true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
