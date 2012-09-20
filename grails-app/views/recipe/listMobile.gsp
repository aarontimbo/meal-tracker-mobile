
<%@ page import="com.atimbo.meal.Recipe" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header" >
				<h1>Ingredients</h1>
			</div>
			<div data-role="content">
				<div>
					<g:link data-role="button" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
				<div class="page-list">
					<ul data-role="listview" data-theme="g">
						<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
							<li>${recipeInstance}</li>
						</g:each>
					</ul>
				</div>
			</div>

		</div>
	</body>
</html>
