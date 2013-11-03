package programmingchallenge

import org.springframework.dao.DataIntegrityViolationException

import programmingchallenge.web.Challenges;

class ChallengesController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [challengesInstanceList: Challenges.list(params), challengesInstanceTotal: Challenges.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[challengesInstance: new Challenges(params)]
			break
		case 'POST':
	        def challengesInstance = new Challenges(params)
	        if (!challengesInstance.save(flush: true)) {
	            render view: 'create', model: [challengesInstance: challengesInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'challenges.label', default: 'Challenges'), challengesInstance.id])
	        redirect action: 'show', id: challengesInstance.id
			break
		}
    }

    def show() {
        def challengesInstance = Challenges.get(params.id)
        if (!challengesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
            redirect action: 'list'
            return
        }

        [challengesInstance: challengesInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def challengesInstance = Challenges.get(params.id)
	        if (!challengesInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [challengesInstance: challengesInstance]
			break
		case 'POST':
	        def challengesInstance = Challenges.get(params.id)
	        if (!challengesInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (challengesInstance.version > version) {
	                challengesInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'challenges.label', default: 'Challenges')] as Object[],
	                          "Another user has updated this Challenges while you were editing")
	                render view: 'edit', model: [challengesInstance: challengesInstance]
	                return
	            }
	        }

	        challengesInstance.properties = params

	        if (!challengesInstance.save(flush: true)) {
	            render view: 'edit', model: [challengesInstance: challengesInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'challenges.label', default: 'Challenges'), challengesInstance.id])
	        redirect action: 'show', id: challengesInstance.id
			break
		}
    }

    def delete() {
        def challengesInstance = Challenges.get(params.id)
        if (!challengesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
            redirect action: 'list'
            return
        }

        try {
            challengesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'challenges.label', default: 'Challenges'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
