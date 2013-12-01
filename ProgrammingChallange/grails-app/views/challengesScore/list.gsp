
<%@ page import="ian.programming.challenge.ChallengesScore" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-challengesScore" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="bonus" title="${message(code: 'challengesScore.bonus.label', default: 'Bonus')}" />
			
				<th><g:message code="challengesScore.challenge.label" default="Challenge" /></th>
			
				<g:sortableColumn property="completed" title="${message(code: 'challengesScore.completed.label', default: 'Completed')}" />
			
				<g:sortableColumn property="languageBonus" title="${message(code: 'challengesScore.languageBonus.label', default: 'Language Bonus')}" />
			
				<g:sortableColumn property="points" title="${message(code: 'challengesScore.points.label', default: 'Points')}" />
			
				<th><g:message code="challengesScore.profile.label" default="Profile" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${challengesScoreInstanceList}" status="i" var="challengesScoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${challengesScoreInstance.id}">${fieldValue(bean: challengesScoreInstance, field: "bonus")}</g:link></td>
			
				<td>${fieldValue(bean: challengesScoreInstance, field: "challenge")}</td>
			
				<td><g:formatBoolean boolean="${challengesScoreInstance.completed}" /></td>
			
				<td><g:formatBoolean boolean="${challengesScoreInstance.languageBonus}" /></td>
			
				<td>${fieldValue(bean: challengesScoreInstance, field: "points")}</td>
			
				<td>${fieldValue(bean: challengesScoreInstance, field: "profile")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${challengesScoreInstanceTotal}" />
	</div>
</section>

</body>

</html>
