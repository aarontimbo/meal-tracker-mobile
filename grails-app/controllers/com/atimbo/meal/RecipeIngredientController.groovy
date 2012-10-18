package com.atimbo.meal

import org.springframework.dao.DataIntegrityViolationException

class RecipeIngredientController {
	def debug = true
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recipeIngredientInstanceList: RecipeIngredient.list(params), recipeIngredientInstanceTotal: RecipeIngredient.count()]
    }

    def create() {
        [recipeIngredientInstance: new RecipeIngredient(params)]
    }

    def save() {
        def recipeIngredientInstance = new RecipeIngredient(params)
        if (!recipeIngredientInstance.save(flush: true)) {
            render(view: "create", model: [recipeIngredientInstance: recipeIngredientInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), recipeIngredientInstance.id])
        redirect(action: "show", id: recipeIngredientInstance.id)
    }

    def show() {
        def recipeIngredientInstance = RecipeIngredient.get(params.id)
        if (!recipeIngredientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "list")
            return
        }

        [recipeIngredientInstance: recipeIngredientInstance]
    }

    def edit() {
        def recipeIngredientInstance = RecipeIngredient.get(params.id)
        if (!recipeIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "list")
            return
        }

        [recipeIngredientInstance: recipeIngredientInstance]
    }

    def update() {
        def recipeIngredientInstance = RecipeIngredient.get(params.id)
        if (!recipeIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (recipeIngredientInstance.version > version) {
                recipeIngredientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'recipeIngredient.label', default: 'RecipeIngredient')] as Object[],
                          "Another user has updated this RecipeIngredient while you were editing")
                render(view: "edit", model: [recipeIngredientInstance: recipeIngredientInstance])
                return
            }
        }

        recipeIngredientInstance.properties = params

        if (!recipeIngredientInstance.save(flush: true)) {
            render(view: "edit", model: [recipeIngredientInstance: recipeIngredientInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), recipeIngredientInstance.id])
        redirect(action: "show", id: recipeIngredientInstance.id)
    }

    def delete() {
        def recipeIngredientInstance = RecipeIngredient.get(params.id)
        if (!recipeIngredientInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "list")
            return
        }

        try {
            recipeIngredientInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'recipeIngredient.label', default: 'RecipeIngredient'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def addIngredient() {
		// Create result object
		def result = [
			success: false,
			msg:"Error adding ingredient: ${params.ingredient}",
			recipe: null
			]
		// Search for recipe
		def recipeInstance = Recipe.get(params.id)
		if (recipeInstance) {
			// Search for existing ingredient description
			def ingredientInstance = Ingredient.findByDescription(params.ingredient)
			// Add ingredient if not found
			if (! ingredientInstance) {
				ingredientInstance = new Ingredient(description:params.ingredient)
				if (ingredientInstance.save(flush:true)) {
					if (debug) {
						println "Ingredient created successfully!"
					}
				} else {
					println "Unable to create ingredient::${params.ingredient}"
				}
			}
			// Create recipe ingredient
			params.recipe = recipeInstance
			params.ingredient = ingredientInstance
			def recipeIngredientInstance = new RecipeIngredient(params)
			if (recipeIngredientInstance.save(flush:true)) {
				recipeInstance.addToIngredients(recipeIngredientInstance)
				result.success = true
				result.recipe = recipeInstance
			} else {
				println "Unable to create recipe ingredient::${recipeIngredientInstance}"
			}
			
		}
		
		if (debug) {
			println "result::$result"			
		}
		[ result: result]
	}
}
