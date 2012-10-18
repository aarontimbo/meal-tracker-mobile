
<%@ page import="com.atimbo.meal.RecipeIngredient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeIngredient.label', default: 'RecipeIngredient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipeIngredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipeIngredient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipeIngredient">
			
				<g:if test="${recipeIngredientInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="recipeIngredient.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${recipeIngredientInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeIngredientInstance?.foodWeight}">
				<li class="fieldcontain">
					<span id="foodWeight-label" class="property-label"><g:message code="recipeIngredient.foodWeight.label" default="Food Weight" /></span>
					
						<span class="property-value" aria-labelledby="foodWeight-label"><g:link controller="weight" action="show" id="${recipeIngredientInstance?.foodWeight?.id}">${recipeIngredientInstance?.foodWeight?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeIngredientInstance?.ingredient}">
				<li class="fieldcontain">
					<span id="ingredient-label" class="property-label"><g:message code="recipeIngredient.ingredient.label" default="Ingredient" /></span>
					
						<span class="property-value" aria-labelledby="ingredient-label"><g:link controller="ingredient" action="show" id="${recipeIngredientInstance?.ingredient?.id}">${recipeIngredientInstance?.ingredient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeIngredientInstance?.recipe}">
				<li class="fieldcontain">
					<span id="recipe-label" class="property-label"><g:message code="recipeIngredient.recipe.label" default="Recipe" /></span>
					
						<span class="property-value" aria-labelledby="recipe-label"><g:link controller="recipe" action="show" id="${recipeIngredientInstance?.recipe?.id}">${recipeIngredientInstance?.recipe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeIngredientInstance?.servings}">
				<li class="fieldcontain">
					<span id="servings-label" class="property-label"><g:message code="recipeIngredient.servings.label" default="Servings" /></span>
					
						<span class="property-value" aria-labelledby="servings-label"><g:fieldValue bean="${recipeIngredientInstance}" field="servings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeIngredientInstance?.sortOrder}">
				<li class="fieldcontain">
					<span id="sortOrder-label" class="property-label"><g:message code="recipeIngredient.sortOrder.label" default="Sort Order" /></span>
					
						<span class="property-value" aria-labelledby="sortOrder-label"><g:fieldValue bean="${recipeIngredientInstance}" field="sortOrder"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recipeIngredientInstance?.id}" />
					<g:link class="edit" action="edit" id="${recipeIngredientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
