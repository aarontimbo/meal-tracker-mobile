package com.atimbo.meal

class RecipeIngredient {
	/**
	Sort order for instruction
	in context of a recipe
	*/
	Integer sortOrder = 1
	Ingredient ingredient
	Float servings = 1.0
 
	static belongsTo = [ recipe: Recipe ]
	
	String toString() { "$ingredient" }
	
    static constraints = {
    }
}
