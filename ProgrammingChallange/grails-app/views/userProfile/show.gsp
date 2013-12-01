
<%@ page import="ian.programming.challenge.UserProfile" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userProfile" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userProfile.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userProfile.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userProfile.points.label" default="Points" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "points")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
