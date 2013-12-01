
<%@ page import="ian.programming.challenge.Challenges" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'challenges.label', default: 'Challenges')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-challenges" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.completionPoints.label" default="Completion Points" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "completionPoints")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.winningPoints.label" default="Winning Points" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "winningPoints")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.languageBonus.label" default="Language Bonus" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "languageBonus")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.bonusPoints.label" default="Bonus Points" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "bonusPoints")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.bonusPointsDescription.label" default="Bonus Points Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: challengesInstance, field: "bonusPointsDescription")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.startDate.label" default="Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${challengesInstance?.startDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challenges.endDate.label" default="End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${challengesInstance?.endDate}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
