<%@ page import="com.atimbo.meal.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="ingredient.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${ingredientInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'foodWeight', 'error')} ">
	<label for="foodWeight">
		<g:message code="ingredient.foodWeight.label" default="Food Weight" />
		
	</label>
	<g:select id="foodWeight" name="foodWeight.id" from="${gov.usda.sr23.Weight.list()}" optionKey="id" value="${ingredientInstance?.foodWeight?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'servings', 'error')} required">
	<label for="servings">
		<g:message code="ingredient.servings.label" default="Servings" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="servings" step="any" required="" value="${ingredientInstance.servings}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'sortOrder', 'error')} required">
	<label for="sortOrder">
		<g:message code="ingredient.sortOrder.label" default="Sort Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sortOrder" required="" value="${ingredientInstance.sortOrder}"/>
</div>

