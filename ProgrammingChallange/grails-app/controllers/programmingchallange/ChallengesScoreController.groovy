package programmingchallange

import org.springframework.dao.DataIntegrityViolationException

class ChallengesScoreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
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

    def show(Long id) {
        def challengesScoreInstance = ChallengesScore.get(id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "list")
            return
        }

        [challengesScoreInstance: challengesScoreInstance]
    }

    def edit(Long id) {
        def challengesScoreInstance = ChallengesScore.get(id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "list")
            return
        }

        [challengesScoreInstance: challengesScoreInstance]
    }

    def update(Long id, Long version) {
        def challengesScoreInstance = ChallengesScore.get(id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
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

    def delete(Long id) {
        def challengesScoreInstance = ChallengesScore.get(id)
        if (!challengesScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "list")
            return
        }

        try {
            challengesScoreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'challengesScore.label', default: 'ChallengesScore'), id])
            redirect(action: "show", id: id)
        }
    }
}
