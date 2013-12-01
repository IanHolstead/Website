
<%@ page import="ian.programming.challenge.Challenges" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'challenges.label', default: 'Challenges')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-challenges" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'challenges.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'challenges.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="completionPoints" title="${message(code: 'challenges.completionPoints.label', default: 'Completion Points')}" />
			
				<g:sortableColumn property="winningPoints" title="${message(code: 'challenges.winningPoints.label', default: 'Winning Points')}" />
			
				<g:sortableColumn property="languageBonus" title="${message(code: 'challenges.languageBonus.label', default: 'Language Bonus')}" />
			
				<g:sortableColumn property="bonusPoints" title="${message(code: 'challenges.bonusPoints.label', default: 'Bonus Points')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${challengesInstanceList}" status="i" var="challengesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${challengesInstance.id}">${fieldValue(bean: challengesInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: challengesInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: challengesInstance, field: "completionPoints")}</td>
			
				<td>${fieldValue(bean: challengesInstance, field: "winningPoints")}</td>
			
				<td>${fieldValue(bean: challengesInstance, field: "languageBonus")}</td>
			
				<td>${fieldValue(bean: challengesInstance, field: "bonusPoints")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${challengesInstanceTotal}" />
	</div>
</section>

</body>

</html>
