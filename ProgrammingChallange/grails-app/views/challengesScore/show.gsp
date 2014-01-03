
<%@ page import="ian.programming.challenge.ChallengesScore" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-challengesScore" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.bonus.label" default="Bonus" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${challengesScoreInstance?.bonus}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.challenge.label" default="Challenge" /></td>
				
				<td valign="top" class="value"><g:link controller="challenges" action="show" id="${challengesScoreInstance?.challenge?.id}">${challengesScoreInstance?.challenge?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.completed.label" default="Completed" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${challengesScoreInstance?.completed}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.languageBonus.label" default="Language Bonus" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${challengesScoreInstance?.languageBonus}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.points.label" default="Points" /></td>
				
				<td valign="top" class="value">${challengesScoreInstance.points}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.profile.label" default="Profile" /></td>
				
				<td valign="top" class="value"><g:link controller="userProfile" action="show" id="${challengesScoreInstance?.profile?.id}">${challengesScoreInstance?.profile?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="challengesScore.winning.label" default="Winning" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${challengesScoreInstance?.winning}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
