<%@ page import="com.atimbo.meal.Recipe" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header" >
				<h1>Edit ${recipeInstance} Recipe</h1>
			</div>
			<div data-role="content">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${recipeInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${recipeInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form method="post" >
					<g:hiddenField name="id" value="${recipeInstance?.id}" />
					<g:hiddenField name="version" value="${recipeInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
				
				<div id="ingredients">
					<ul>
						<g:each in="${recipeInstance.ingredients}" var="ingredientInstance">
							<li>${ingredientInstance}</li>
						</g:each>
					</ul>						
				</div>
				
				<g:form>
					<div>
						<g:hiddenField name="id" value="${recipeInstance?.id}" />
						<div><label>Ingredient Description</label><g:textField name="ingredient" value="" /></div>
						<div><label>Sort Order</label><g:textField name="sortOrder" value="1" /></div>
						<div><label>Servings</label><g:textField name="servings" value="1.0" /></div>
					</div>
					<g:submitToRemote controller="recipeIngredient" action="addIngredient" update="ingredients" value="Add Ingredient" /> 
				</g:form>
			</div>
		</div>
	</body>
</html>
