package ian.programming.challenge

import org.springframework.dao.DataIntegrityViolationException

/**
 * ChallengesScoreController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ChallengesScoreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [challengesScoreInstanceList: ChallengesScore.list(params), challengesScoreInstanceTotal: ChallengesScore.count()]
    }

    def create() {
        [challengesScoreInstance: new ChallengesScore(params)]
    }

    def save() {
        def challengesScoreInstance = new ChallengesScore(params)
        if (!challengesScoreInstance.save(flush: true)) {
            render(view: "create", model: [challengesScoreInstance: challengesScoreInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), challengesScoreInstance.id])
        redirect(action: "show", id: challengesScoreInstance.id)
    }

    def show() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "list")
            return
        }

        [challengesScoreInstance: challengesScoreInstance]
    }

    def edit() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "list")
            return
        }

        [challengesScoreInstance: challengesScoreInstance]
    }

    def update() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (challengesScoreInstance.version > version) {
                challengesScoreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'challengesScore.label', default: 'ChallengesScore')] as Object[],
                          "Another user has updated this ChallengesScore while you were editing")
                render(view: "edit", model: [challengesScoreInstance: challengesScoreInstance])
                return
            }
        }

        challengesScoreInstance.properties = params

        if (!challengesScoreInstance.save(flush: true)) {
            render(view: "edit", model: [challengesScoreInstance: challengesScoreInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), challengesScoreInstance.id])
        redirect(action: "show", id: challengesScoreInstance.id)
    }

    def delete() {
        def challengesScoreInstance = ChallengesScore.get(params.id)
        if (!challengesScoreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "list")
            return
        }

        try {
            challengesScoreInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
