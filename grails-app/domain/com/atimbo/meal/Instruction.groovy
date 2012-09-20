package com.atimbo.meal

class Instruction {
	String description
	Integer sortOrder = 1
			
	String toString() { description }
	
    static constraints = {
    	description unique: true, maxSize: 1000
	}
	
}
