
<%@ page import="com.atimbo.meal.RecipeIngredient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipeIngredient.label', default: 'RecipeIngredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipeIngredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipeIngredient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'recipeIngredient.description.label', default: 'Description')}" />
					
						<th><g:message code="recipeIngredient.foodWeight.label" default="Food Weight" /></th>
					
						<th><g:message code="recipeIngredient.ingredient.label" default="Ingredient" /></th>
					
						<th><g:message code="recipeIngredient.recipe.label" default="Recipe" /></th>
					
						<g:sortableColumn property="servings" title="${message(code: 'recipeIngredient.servings.label', default: 'Servings')}" />
					
						<g:sortableColumn property="sortOrder" title="${message(code: 'recipeIngredient.sortOrder.label', default: 'Sort Order')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeIngredientInstanceList}" status="i" var="recipeIngredientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeIngredientInstance.id}">${fieldValue(bean: recipeIngredientInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "foodWeight")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "ingredient")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "recipe")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "servings")}</td>
					
						<td>${fieldValue(bean: recipeIngredientInstance, field: "sortOrder")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeIngredientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
