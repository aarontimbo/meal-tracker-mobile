package com.atimbo.meal



import org.junit.*
import grails.test.mixin.*

@TestFor(RecipeIngredientController)
@Mock(RecipeIngredient)
class RecipeIngredientControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/recipeIngredient/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.recipeIngredientInstanceList.size() == 0
        assert model.recipeIngredientInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.recipeIngredientInstance != null
    }

    void testSave() {
        controller.save()

        assert model.recipeIngredientInstance != null
        assert view == '/recipeIngredient/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/recipeIngredient/show/1'
        assert controller.flash.message != null
        assert RecipeIngredient.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/recipeIngredient/list'


        populateValidParams(params)
        def recipeIngredient = new RecipeIngredient(params)

        assert recipeIngredient.save() != null

        params.id = recipeIngredient.id

        def model = controller.show()

        assert model.recipeIngredientInstance == recipeIngredient
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/recipeIngredient/list'


        populateValidParams(params)
        def recipeIngredient = new RecipeIngredient(params)

        assert recipeIngredient.save() != null

        params.id = recipeIngredient.id

        def model = controller.edit()

        assert model.recipeIngredientInstance == recipeIngredient
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/recipeIngredient/list'

        response.reset()


        populateValidParams(params)
        def recipeIngredient = new RecipeIngredient(params)

        assert recipeIngredient.save() != null

        // test invalid parameters in update
        params.id = recipeIngredient.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/recipeIngredient/edit"
        assert model.recipeIngredientInstance != null

        recipeIngredient.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/recipeIngredient/show/$recipeIngredient.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        recipeIngredient.clearErrors()

        populateValidParams(params)
        params.id = recipeIngredient.id
        params.version = -1
        controller.update()

        assert view == "/recipeIngredient/edit"
        assert model.recipeIngredientInstance != null
        assert model.recipeIngredientInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/recipeIngredient/list'

        response.reset()

        populateValidParams(params)
        def recipeIngredient = new RecipeIngredient(params)

        assert recipeIngredient.save() != null
        assert RecipeIngredient.count() == 1

        params.id = recipeIngredient.id

        controller.delete()

        assert RecipeIngredient.count() == 0
        assert RecipeIngredient.get(recipeIngredient.id) == null
        assert response.redirectedUrl == '/recipeIngredient/list'
    }
}
