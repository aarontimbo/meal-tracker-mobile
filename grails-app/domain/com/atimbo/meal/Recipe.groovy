package com.atimbo.meal

class Recipe {
	String title
	String description
	String notes
	
	static hasMany = [ ingredients: RecipeIngredient, instructions: RecipeInstruction ]
	
	String toString() { title }
	
    static constraints = {
		title unique: true
		description nullable: true
		notes nullable: true
    }
	
	static mapping = {
		notes type: 'text'
	}
	
	static transients = [ 'sortedIngredients', 'sortedInstructions']
	
	def getSortedIngredients = {
		ingredients.sort { sortOrder }	
    }

	def getSortedInstructions = {
		instructions.sort { sortOrder }
	}

}
