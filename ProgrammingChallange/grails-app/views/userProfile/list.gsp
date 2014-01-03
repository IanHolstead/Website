
<%@ page import="ian.programming.challenge.UserProfile" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-userProfile" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'userProfile.email.label', default: 'Email')}" />
			
				<g:sortableColumn property="points" title="${message(code: 'userProfile.points.label', default: 'Points')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userProfileInstance.id}">${userProfileInstance.name}</g:link></td>
			
				<td>${userProfileInstance.email}</td>
			
				<td>${userProfileInstance.points}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userProfileInstanceTotal}" />
	</div>
</section>

</body>

</html>
