
<%@ page import="com.atimbo.meal.Ingredient" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ingredient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ingredient">
			
				<g:if test="${ingredientInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="ingredient.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${ingredientInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientInstance?.foodWeight}">
				<li class="fieldcontain">
					<span id="foodWeight-label" class="property-label"><g:message code="ingredient.foodWeight.label" default="Food Weight" /></span>
					
						<span class="property-value" aria-labelledby="foodWeight-label"><g:link controller="weight" action="show" id="${ingredientInstance?.foodWeight?.id}">${ingredientInstance?.foodWeight?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientInstance?.servings}">
				<li class="fieldcontain">
					<span id="servings-label" class="property-label"><g:message code="ingredient.servings.label" default="Servings" /></span>
					
						<span class="property-value" aria-labelledby="servings-label"><g:fieldValue bean="${ingredientInstance}" field="servings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ingredientInstance?.sortOrder}">
				<li class="fieldcontain">
					<span id="sortOrder-label" class="property-label"><g:message code="ingredient.sortOrder.label" default="Sort Order" /></span>
					
						<span class="property-value" aria-labelledby="sortOrder-label"><g:fieldValue bean="${ingredientInstance}" field="sortOrder"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ingredientInstance?.id}" />
					<g:link class="edit" action="edit" id="${ingredientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
