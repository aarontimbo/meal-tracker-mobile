package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class RecipeSpec extends UnitSpec {
	def debug = true
	
	def "Create a recipe"() {
		setup:
		mockDomain(Recipe)
		
		when:
		def recipe = new Recipe(title: title)
		
		then:
		assert recipe
		
		where:
		title = "Best Chicken You Have Ever Had"
	}
	
	def "Add ingredient to recipe"() {
		setup:
		mockDomain(Recipe)
		mockDomain(Ingredient)
		mockDomain(RecipeIngredient)
		def ingredient = new Ingredient(description: description).save()
		def recipe = new Recipe(title: title).save()
		def recipeIngredient = new RecipeIngredient(recipe:recipe, ingredient: ingredient).save()
		
		when:
		recipe.addToIngredients(ingredient)
		
		then:
		assert recipe.ingredients.size() == 1
		if (debug) { println "Added ingredient, $recipeIngredient, to $recipe recipe." }
		
		where:
		title = "Best Chicken You Have Ever Had"
		description = "1.5 tsp cumin"

	}	
}
