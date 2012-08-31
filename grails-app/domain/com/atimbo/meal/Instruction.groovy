package com.atimbo.meal

class Instruction {
	String description
	Integer sortOrder = 1
		
	static belongsTo = [ recipe: Recipe ]
	
	String toString() { description }
	
    static constraints = {
    	description unique: true, maxSize: 1000
	}
	
}
