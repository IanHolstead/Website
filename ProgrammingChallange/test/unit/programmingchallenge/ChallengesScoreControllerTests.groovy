package programmingchallenge



import org.junit.*

import programmingchallenge.web.ChallengesScore;
import grails.test.mixin.*

@TestFor(ChallengesScoreController)
@Mock(ChallengesScore)
class ChallengesScoreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/challengesScore/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.challengesScoreInstanceList.size() == 0
        assert model.challengesScoreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.challengesScoreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.challengesScoreInstance != null
        assert view == '/challengesScore/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/challengesScore/show/1'
        assert controller.flash.message != null
        assert ChallengesScore.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/challengesScore/list'

        populateValidParams(params)
        def challengesScore = new ChallengesScore(params)

        assert challengesScore.save() != null

        params.id = challengesScore.id

        def model = controller.show()

        assert model.challengesScoreInstance == challengesScore
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/challengesScore/list'

        populateValidParams(params)
        def challengesScore = new ChallengesScore(params)

        assert challengesScore.save() != null

        params.id = challengesScore.id

        def model = controller.edit()

        assert model.challengesScoreInstance == challengesScore
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/challengesScore/list'

        response.reset()

        populateValidParams(params)
        def challengesScore = new ChallengesScore(params)

        assert challengesScore.save() != null

        // test invalid parameters in update
        params.id = challengesScore.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/challengesScore/edit"
        assert model.challengesScoreInstance != null

        challengesScore.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/challengesScore/show/$challengesScore.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        challengesScore.clearErrors()

        populateValidParams(params)
        params.id = challengesScore.id
        params.version = -1
        controller.update()

        assert view == "/challengesScore/edit"
        assert model.challengesScoreInstance != null
        assert model.challengesScoreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/challengesScore/list'

        response.reset()

        populateValidParams(params)
        def challengesScore = new ChallengesScore(params)

        assert challengesScore.save() != null
        assert ChallengesScore.count() == 1

        params.id = challengesScore.id

        controller.delete()

        assert ChallengesScore.count() == 0
        assert ChallengesScore.get(challengesScore.id) == null
        assert response.redirectedUrl == '/challengesScore/list'
    }
}
