
<%@ page import="com.atimbo.meal.Recipe" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header" >
				<h1>Recipe</h1>
			</div>
			<div data-role="content">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list recipe">
				
					<g:if test="${recipeInstance?.title}">
					<li class="fieldcontain">
						<span id="title-label" class="property-label"><g:message code="recipe.title.label" default="Title" /></span>
						
							<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${recipeInstance}" field="title"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${recipeInstance?.description}">
					<li class="fieldcontain">
						<span id="description-label" class="property-label"><g:message code="recipe.description.label" default="Description" /></span>
						
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${recipeInstance}" field="description"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${recipeInstance?.notes}">
					<li class="fieldcontain">
						<span id="notes-label" class="property-label"><g:message code="recipe.notes.label" default="Notes" /></span>
						
							<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${recipeInstance}" field="notes"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${recipeInstance?.ingredients}">
					<li class="fieldcontain">
						<span id="ingredients-label" class="property-label"><g:message code="recipe.ingredients.label" default="Ingredients" /></span>
						
							<g:each in="${recipeInstance.ingredients}" var="i">
							<span class="property-value" aria-labelledby="ingredients-label"><g:link controller="ingredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</li>
					</g:if>
				
					<g:if test="${recipeInstance?.instructions}">
					<li class="fieldcontain">
						<span id="instructions-label" class="property-label"><g:message code="recipe.instructions.label" default="Instructions" /></span>
						
							<g:each in="${recipeInstance.instructions}" var="i">
							<span class="property-value" aria-labelledby="instructions-label"><g:link controller="instruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</li>
					</g:if>
				
				</ol>
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${recipeInstance?.id}" />
						<g:link class="edit" action="editMobile" id="${recipeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
