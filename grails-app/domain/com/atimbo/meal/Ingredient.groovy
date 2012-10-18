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
		
	String toString() { foodWeight ? "$foodWeight $foodWeight.food" : description }
	
	/**
	This is a custom validator that requires that either a food
	description or food weight be specified for the ingredient. 
	 */
	static requireDescriptionOrFoodWeightValidator = { val, obj ->
		return ( obj.properties['description'] || obj.properties['foodWeight'] )
	}
	
    static constraints = {
		description nullable: true, validator: requireDescriptionOrFoodWeightValidator
		foodWeight nullable: true, validator: requireDescriptionOrFoodWeightValidator		
    }
}
