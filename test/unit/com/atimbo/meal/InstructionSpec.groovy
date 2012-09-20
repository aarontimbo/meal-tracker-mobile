package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class InstructionSpec extends UnitSpec {

	def debug = true
	
	def "Add instruction"() {
		setup:
		mockDomain(Instruction)
		
		when:
		def instructionInstance = new Instruction(description: description).save()
		
		then:
		assert instructionInstance
		if (debug) { println "Instruction created: $instructionInstance" }

		where:
		description = "Add chicken to brine"
		
	}

}