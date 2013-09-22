
<%@ page import="programmingchallange.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'userProfile.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="points" title="${message(code: 'userProfile.points.label', default: 'Points')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "points")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userProfileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
