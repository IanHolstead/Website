
<%@ page import="programmingchallange.Challanges" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'challanges.label', default: 'Challanges')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-challanges" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-challanges" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'challanges.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'challanges.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="completionPoints" title="${message(code: 'challanges.completionPoints.label', default: 'Completion Points')}" />
					
						<g:sortableColumn property="winningPoints" title="${message(code: 'challanges.winningPoints.label', default: 'Winning Points')}" />
					
						<g:sortableColumn property="languageBonus" title="${message(code: 'challanges.languageBonus.label', default: 'Language Bonus')}" />
					
						<g:sortableColumn property="bonusPoints" title="${message(code: 'challanges.bonusPoints.label', default: 'Bonus Points')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${challangesInstanceList}" status="i" var="challangesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${challangesInstance.id}">${fieldValue(bean: challangesInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: challangesInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: challangesInstance, field: "completionPoints")}</td>
					
						<td>${fieldValue(bean: challangesInstance, field: "winningPoints")}</td>
					
						<td>${fieldValue(bean: challangesInstance, field: "languageBonus")}</td>
					
						<td>${fieldValue(bean: challangesInstance, field: "bonusPoints")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${challangesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
