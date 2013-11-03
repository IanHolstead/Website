package programmingchallange



import org.junit.*

import programmingchallenge.ChallengesController;
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
        assert "/challanges/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.challangesInstanceList.size() == 0
        assert model.challangesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.challangesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.challangesInstance != null
        assert view == '/challanges/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/challanges/show/1'
        assert controller.flash.message != null
        assert Challenges.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/challanges/list'

        populateValidParams(params)
        def challanges = new Challenges(params)

        assert challanges.save() != null

        params.id = challanges.id

        def model = controller.show()

        assert model.challangesInstance == challanges
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/challanges/list'

        populateValidParams(params)
        def challanges = new Challenges(params)

        assert challanges.save() != null

        params.id = challanges.id

        def model = controller.edit()

        assert model.challangesInstance == challanges
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/challanges/list'

        response.reset()

        populateValidParams(params)
        def challanges = new Challenges(params)

        assert challanges.save() != null

        // test invalid parameters in update
        params.id = challanges.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/challanges/edit"
        assert model.challangesInstance != null

        challanges.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/challanges/show/$challanges.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        challanges.clearErrors()

        populateValidParams(params)
        params.id = challanges.id
        params.version = -1
        controller.update()

        assert view == "/challanges/edit"
        assert model.challangesInstance != null
        assert model.challangesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/challanges/list'

        response.reset()

        populateValidParams(params)
        def challanges = new Challenges(params)

        assert challanges.save() != null
        assert Challenges.count() == 1

        params.id = challanges.id

        controller.delete()

        assert Challenges.count() == 0
        assert Challenges.get(challanges.id) == null
        assert response.redirectedUrl == '/challanges/list'
    }
}
