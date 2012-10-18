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


