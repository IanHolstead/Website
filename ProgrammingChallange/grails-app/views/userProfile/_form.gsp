<%@ page import="programmingchallange.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userProfile.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userProfileInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="userProfile.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userProfileInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="userProfile.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" value="${userProfileInstance.points}" required=""/>
</div>

