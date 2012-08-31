package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*
import gov.usda.sr23.*

class IngredientSpec extends UnitSpec {
	def debug = true
	
	def "Add ingredient"() {
		setup:
		mockDomain(Ingredient)
		mockDomain(Weight)
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		mockDomain(Recipe)
		def foodGroup = new FoodGroupDescription(description: group).save()
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()
		def foodWeight = new Weight(food: food, sequenceNumber: 1, amount: 1.0, description: unit, gramWeight: 133.0).save()
		def recipe = new Recipe(title: title).save()
		
		when:
		def ingredientInstance = new Ingredient(recipe: recipe, foodWeight: foodWeight).save()
		
		then:
		assert ingredientInstance
		if (debug) { println "Recipe: $recipe | Ingredient created: $ingredientInstance" }

		where:
		description = "parsnip"
		group = "vegetable"
		unit = "cup"
		title = "Best Chicken You Have Ever Had"
		
	}
}
