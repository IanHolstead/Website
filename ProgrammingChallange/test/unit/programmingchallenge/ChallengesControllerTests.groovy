package programmingchallenge



import org.junit.*

import programmingchallenge.web.Challenges;
import grails.test.mixin.*

@TestFor(ChallengesController)
@Mock(Challenges)
class ChallengesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/challenges/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.challengesInstanceList.size() == 0
        assert model.challengesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.challengesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.challengesInstance != null
        assert view == '/challenges/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/challenges/show/1'
        assert controller.flash.message != null
        assert Challenges.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/challenges/list'

        populateValidParams(params)
        def challenges = new Challenges(params)

        assert challenges.save() != null

        params.id = challenges.id

        def model = controller.show()

        assert model.challengesInstance == challenges
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/challenges/list'

        populateValidParams(params)
        def challenges = new Challenges(params)

        assert challenges.save() != null

        params.id = challenges.id

        def model = controller.edit()

        assert model.challengesInstance == challenges
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/challenges/list'

        response.reset()

        populateValidParams(params)
        def challenges = new Challenges(params)

        assert challenges.save() != null

        // test invalid parameters in update
        params.id = challenges.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/challenges/edit"
        assert model.challengesInstance != null

        challenges.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/challenges/show/$challenges.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        challenges.clearErrors()

        populateValidParams(params)
        params.id = challenges.id
        params.version = -1
        controller.update()

        assert view == "/challenges/edit"
        assert model.challengesInstance != null
        assert model.challengesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/challenges/list'

        response.reset()

        populateValidParams(params)
        def challenges = new Challenges(params)

        assert challenges.save() != null
        assert Challenges.count() == 1

        params.id = challenges.id

        controller.delete()

        assert Challenges.count() == 0
        assert Challenges.get(challenges.id) == null
        assert response.redirectedUrl == '/challenges/list'
    }
}
