
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
			<div data-role="header" >
				<h1>Ingredients</h1>
			</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div data-role="content">
				<div>
					<g:link data-role="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
				<div class="page-list">
					<ul data-role="listview" data-theme="g">
						<g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
							<li>${ingredientInstance}</li>
						</g:each>
					</ul>
				</div>
			
			</div>
		</div>
	</body>
</html>
