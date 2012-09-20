package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class RecipeInstructionSpec extends UnitSpec {
	def debug = true
	
	def "Create a recipe instruction"() {
		setup:
		def recipe = new Recipe(title: title)
		mockDomain(Recipe, [recipe])
		def instruction = new Instruction(description: description)
		mockDomain(Instruction, [instruction])
		mockDomain(RecipeInstruction)
		
		when:
		def recipeInstruction = new RecipeInstruction(recipe:recipe, instruction: instruction)
		
		then:
		assert recipeInstruction
		if (debug) { println "Created recipe instruction '$recipeInstruction' for $recipe recipe" }
		
		where:	
		title = "Best Chicken You Have Ever Had"
		description = "Add chicken to brine"
		
	}
	
	// TODO: Add test for multiple instructions to see how sorting works
}
