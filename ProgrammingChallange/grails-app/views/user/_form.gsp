<%@ page import="com.ianholstead.security.User" %>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /></label>
	<div class="controls">
		<g:textField name="username" value="${userInstance?.username}"/>
		<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'displayName', 'error')} ">
	<label for="displayName" class="control-label"><g:message code="user.displayName.label" default="Display Name" /></label>
	<div class="controls">
		<g:textField name="displayName" value="${userInstance?.displayName}"/>
		<span class="help-inline">${hasErrors(bean: userInstance, field: 'displayName', 'error')}</span>
	</div>
</div>
	
<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">

	<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	
		<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /></label>
		<div class="controls">
			<g:textField name="password" value="${userInstance?.password}"/>
			<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
		</div>
	</div>
	
	<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
		<label for="accountExpired" class="control-label"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
		<div class="controls">
			<bs:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
			<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}</span>
		</div>
	</div>

	<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
		<label for="accountLocked" class="control-label"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
		<div class="controls">
			<bs:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
			<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}</span>
		</div>
	</div>

	<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
		<label for="enabled" class="control-label"><g:message code="user.enabled.label" default="Enabled" /></label>
		<div class="controls">
			<bs:checkBox name="enabled" value="${userInstance?.enabled}" />
			<span class="help-inline">${hasErrors(bean: userInstance, field: 'enabled', 'error')}</span>
		</div>
	</div>

	<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
		<label for="passwordExpired" class="control-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
		<div class="controls">
			<bs:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
			<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}</span>
		</div>
	</div>
	
</sec:ifAnyGranted>
