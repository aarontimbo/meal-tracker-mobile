<%@ page import="com.atimbo.meal.Recipe" %>
<%@ page import="com.atimbo.meal.Ingredient" %>


<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="recipe.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${recipeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="recipe.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${recipeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="recipe.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${recipeInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="recipe.ingredients.label" default="Ingredients" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${recipeInstance?.ingredients?.sort{ sortOrder }}" var="i">
    <li><g:link controller="ingredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:if test="${Ingredient.list()}" >
	<g:select name="ingredient" from="${Ingredient.list()}" optionKey="id" />
</g:if>
<g:link controller="ingredient" action="create" params="['recipe.id': recipeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ingredient.label', default: 'Ingredient')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'instructions', 'error')} ">
	<label for="instructions">
		<g:message code="recipe.instructions.label" default="Instructions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${recipeInstance?.instructions?}" var="i">
    <li><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="instruction" action="create" params="['recipe.id': recipeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'instruction.label', default: 'Instruction')])}</g:link>
</li>
</ul>

</div>

