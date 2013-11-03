package ian.website



import org.junit.*
import grails.test.mixin.*

@TestFor(WorldController)
@Mock(World)
class WorldControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/world/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.worldInstanceList.size() == 0
        assert model.worldInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.worldInstance != null
    }

    void testSave() {
        controller.save()

        assert model.worldInstance != null
        assert view == '/world/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/world/show/1'
        assert controller.flash.message != null
        assert World.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/world/list'

        populateValidParams(params)
        def world = new World(params)

        assert world.save() != null

        params.id = world.id

        def model = controller.show()

        assert model.worldInstance == world
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/world/list'

        populateValidParams(params)
        def world = new World(params)

        assert world.save() != null

        params.id = world.id

        def model = controller.edit()

        assert model.worldInstance == world
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/world/list'

        response.reset()

        populateValidParams(params)
        def world = new World(params)

        assert world.save() != null

        // test invalid parameters in update
        params.id = world.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/world/edit"
        assert model.worldInstance != null

        world.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/world/show/$world.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        world.clearErrors()

        populateValidParams(params)
        params.id = world.id
        params.version = -1
        controller.update()

        assert view == "/world/edit"
        assert model.worldInstance != null
        assert model.worldInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/world/list'

        response.reset()

        populateValidParams(params)
        def world = new World(params)

        assert world.save() != null
        assert World.count() == 1

        params.id = world.id

        controller.delete()

        assert World.count() == 0
        assert World.get(world.id) == null
        assert response.redirectedUrl == '/world/list'
    }
}
