<%@ page import="com.atimbo.meal.RecipeIngredient" %>

<g:if test="${result?.success}">
	<ul>
		<g:each in="${result?.recipe.ingredients}" var="ingredientInstance">
			<li>${ingredientInstance}</li>		
		</g:each>
	</ul>	
</g:if>
<g:else>
	${result.msg}
</g:else>	
