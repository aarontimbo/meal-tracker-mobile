package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class RecipeSpec extends UnitSpec {

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
}
