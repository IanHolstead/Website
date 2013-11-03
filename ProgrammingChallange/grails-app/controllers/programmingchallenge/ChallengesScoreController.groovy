package programmingchallenge

import org.springframework.dao.DataIntegrityViolationException

import programmingchallenge.web.ChallengesScore;

class ChallengesScoreController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [challengesScoreInstanceList: ChallengesScore.list(params), challengesScoreInstanceTotal: ChallengesScore.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[challengesScoreInstance: new ChallengesScore(params)]
			break
		case 'POST':
	        def challengesScoreInstance = new ChallengesScore(params)
	        if (!challengesScoreInstance.save(flush: true)) {
	            render view: 'create', model: [challengesScoreInstance: challengesScoreInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), challengesScoreInstance.id])
	        redirect action: 'show', id: challengesScoreInstance.id
			break
		}
    }

    def show() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect action: 'list'
            return
        }

        [challengesScoreInstance: challengesScoreInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def challengesScoreInstance = ChallengesScore.get(params.id)
	        if (!challengesScoreInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [challengesScoreInstance: challengesScoreInstance]
			break
		case 'POST':
	        def challengesScoreInstance = ChallengesScore.get(params.id)
	        if (!challengesScoreInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (challengesScoreInstance.version > version) {
	                challengesScoreInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'challengesScore.label', default: 'ChallengesScore')] as Object[],
	                          "Another user has updated this ChallengesScore while you were editing")
	                render view: 'edit', model: [challengesScoreInstance: challengesScoreInstance]
	                return
	            }
	        }

	        challengesScoreInstance.properties = params

	        if (!challengesScoreInstance.save(flush: true)) {
	            render view: 'edit', model: [challengesScoreInstance: challengesScoreInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), challengesScoreInstance.id])
	        redirect action: 'show', id: challengesScoreInstance.id
			break
		}
    }

    def delete() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect action: 'list'
            return
        }

        try {
            challengesScoreInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
