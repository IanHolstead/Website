
<%@ page import="com.ianholstead.security.User" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

	<ul id="Menu" class="nav nav-pills">
		<div class="row-fluid">
			<div class="span12">
				<g:if test="${ params.action == 'show' || params.action == 'edit' }">
					<!-- the item is an object (not a list) -->
					<li class="${ params.action == "edit" ? 'active' : '' }">
						<g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
					</li>
				</g:if>
			</div>
		</div>
		</ul>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				<td valign="top" class="value">${userInstance.username}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.displayName.label" default="Display Name" /></td>
				<td valign="top" class="value">${userInstance.displayName}</td>
			</tr>
		
		<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountExpired.label" default="Account Expired" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
			</tr>
		</sec:ifAnyGranted>
		
		</tbody>
	</table>
</section>

</body>

</html>
