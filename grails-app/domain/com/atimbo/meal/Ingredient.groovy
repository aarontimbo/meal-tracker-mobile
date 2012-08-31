package com.atimbo.meal

import gov.usda.sr23.Weight;

class Ingredient {
		/**
		This optional field
	 	is intended for describing
	 	use in a recipe and/or
	 	for ingredients not in the
	 	nutrient database
	 	(e.g. spices). 
	 	*/
	String description
		/** 
		This optional field
		is linked to food weight
		items in the nutrient
		database.
		 */
	Weight foodWeight
		/**
		Number of servings as it
		relates to the food weight
		item.
		 */
	Float servings = 1
		/** 
		Used to display ingredient
		in proper order on a recipe
		ingredients list. 
		 */
	Integer sortOrder = 1
	
	static belongsTo = [ recipe: Recipe ]
	
	String toString() { foodWeight ? "$servings x $foodWeight $foodWeight.food" : description }
	
    static constraints = {
		description nullable: true
		foodWeight nullable: true		
    }
}
