<%@ page import="com.atimbo.meal.RecipeIngredient" %>

<g:if test="${result?.success}">

	<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'ingredient', 'error')} required">
		<label for="ingredient">
			<g:message code="recipeIngredient.ingredient.label" default="Ingredient" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField id="ingredient" name="ingredient.id" required="" value="${result?.ingredient?.description}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'recipe', 'error')} required">
		<label for="recipe">
			<g:message code="recipeIngredient.recipe.label" default="Recipe" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="recipe" name="recipe.id" from="${com.atimbo.meal.Recipe.list()}" optionKey="id" required="" value="${recipeIngredientInstance?.recipe?.id}" class="many-to-one"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'sortOrder', 'error')} required">
		<label for="sortOrder">
			<g:message code="recipeIngredient.sortOrder.label" default="Sort Order" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="number" name="sortOrder" required="" value="${result.sortOrder}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: recipeIngredientInstance, field: 'servings', 'error')} required">
		<label for="servings">
			<g:message code="recipeIngredient.servings.label" default="Servings" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="number" name="servings" step="any" required="" value="${result.servings}"/>
	</div>
	
</g:if>
<g:else>
	${result.msg}
</g:else>	
