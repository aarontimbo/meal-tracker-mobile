package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class InstructionSpec extends UnitSpec {

	def debug = true
	
	def "Add instruction"() {
		setup:
		mockDomain(Instruction)
		mockDomain(Recipe)
		def recipe = new Recipe(title: title).save()
		
		when:
		def instructionInstance = new Instruction(recipe: recipe, description: description).save()
		
		then:
		assert instructionInstance
		if (debug) { println "Recipe: $recipe | Instruction created: $instructionInstance" }

		where:
		description = "Add chicken to brine"
		title = "Best Chicken You Have Ever Had"
		
	}

}