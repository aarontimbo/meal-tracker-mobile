
<%@ page import="com.atimbo.meal.Ingredient" %>
<!doctype html>
<html>
	<head>
		<r:require modules="jquery-mobile" />
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header">Ingredients</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div data-role="content">
				<g:link data-role="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				<ul data-role="listview" data-theme="b">
					<g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
						<li>${ingredientInstance}</li>
					</g:each>
				</ul>
			
			</div>
		</div>
	</body>
</html>
