package com.atimbo.meal

class RecipeInstruction {
	/**
	Sort order for instruction
	in context of a recipe
	*/
	Integer sortOrder = 1
	Instruction instruction
	
	static belongsTo = [ recipe: Recipe ]
	
	String toString() { "${sortOrder}. $instruction" }
	
    static constraints = {
    }
}
