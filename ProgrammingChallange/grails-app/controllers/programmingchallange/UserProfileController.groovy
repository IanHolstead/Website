package programmingchallange

import org.springframework.dao.DataIntegrityViolationException

class UserProfileController {

	def scaffold = UserProfile
	
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index() {
//        redirect(action: "list", params: params)
//    }
//
//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        [userProfileInstanceList: UserProfile.list(params), userProfileInstanceTotal: UserProfile.count()]
//    }
//
//    def create() {
//        [userProfileInstance: new UserProfile(params)]
//    }
//
//    def save() {
//        def userProfileInstance = new UserProfile(params)
//        if (!userProfileInstance.save(flush: true)) {
//            render(view: "create", model: [userProfileInstance: userProfileInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
//        redirect(action: "show", id: userProfileInstance.id)
//    }
//
//    def show(Long id) {
//        def userProfileInstance = UserProfile.get(id)
//        if (!userProfileInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [userProfileInstance: userProfileInstance]
//    }
//
//    def edit(Long id) {
//        def userProfileInstance = UserProfile.get(id)
//        if (!userProfileInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [userProfileInstance: userProfileInstance]
//    }
//
//    def update(Long id, Long version) {
//        def userProfileInstance = UserProfile.get(id)
//        if (!userProfileInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "list")
//            return
//        }
//
//        if (version != null) {
//            if (userProfileInstance.version > version) {
//                userProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'userProfile.label', default: 'UserProfile')] as Object[],
//                          "Another user has updated this UserProfile while you were editing")
//                render(view: "edit", model: [userProfileInstance: userProfileInstance])
//                return
//            }
//        }
//
//        userProfileInstance.properties = params
//
//        if (!userProfileInstance.save(flush: true)) {
//            render(view: "edit", model: [userProfileInstance: userProfileInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.updated.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])
//        redirect(action: "show", id: userProfileInstance.id)
//    }
//
//    def delete(Long id) {
//        def userProfileInstance = UserProfile.get(id)
//        if (!userProfileInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            userProfileInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), id])
//            redirect(action: "show", id: id)
//        }
//    }
}
