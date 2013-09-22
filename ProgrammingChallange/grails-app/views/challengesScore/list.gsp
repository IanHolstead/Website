
<%@ page import="programmingchallange.ChallengesScore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-challengesScore" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-challengesScore" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="challengesScore.challange.label" default="Challange" /></th>
					
						<g:sortableColumn property="points" title="${message(code: 'challengesScore.points.label', default: 'Points')}" />
					
						<th><g:message code="challengesScore.profile.label" default="Profile" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${challengesScoreInstanceList}" status="i" var="challengesScoreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${challengesScoreInstance.id}">${fieldValue(bean: challengesScoreInstance, field: "challange")}</g:link></td>
					
						<td>${fieldValue(bean: challengesScoreInstance, field: "points")}</td>
					
						<td>${fieldValue(bean: challengesScoreInstance, field: "profile")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${challengesScoreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
