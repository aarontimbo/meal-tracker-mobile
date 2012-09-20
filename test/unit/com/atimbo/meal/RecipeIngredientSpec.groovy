package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*
import gov.usda.sr23.*

class RecipeIngredientSpec extends UnitSpec {
	def debug = true
	
	def "Create recipe ingredient"() {
		setup:
		mockDomain(RecipeIngredient)
		def foodGroup = new FoodGroupDescription(description: group)
		mockDomain(FoodGroupDescription, [foodGroup])
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description)
		mockDomain(Food, [food])
		def foodWeight = new Weight(food: food, sequenceNumber: 1, amount: 1.0, description: unit, gramWeight: 133.0)
		mockDomain(Weight, [foodWeight])
		def ingredient = new Ingredient(foodWeight: foodWeight)
		mockDomain(Ingredient, [ingredient])
		def recipe = new Recipe(title: title)
		mockDomain(Recipe, [recipe])
		
		when:
		def recipeIngredient = new RecipeIngredient(recipe:recipe, ingredient: ingredient)
		
		then:
		assert recipeIngredient
		if (debug) { println "Created recipe ingredient '$recipeIngredient' for $recipe recipe" }
		
		where:
		description = "parsnip"
		group = "vegetable"
		unit = "cup"
		title = "Best Chicken You Have Ever Had"

	}
	
	// TODO: Add test for multiple ingredients to see how sorting works
	
}
