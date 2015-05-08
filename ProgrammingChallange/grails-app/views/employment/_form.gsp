<%@ page import="com.ianholstead.website.Employment" %>

<div class="control-group fieldcontain ${hasErrors(bean: employmentInstance, field: 'about', 'error')} required">
	<label for="about" class="control-label"><g:message code="employ.about.label"/><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="about" maxlength="25" required="" value="${employmentInstance?.about}"/>
		<span class="help-inline">${hasErrors(bean: employmentInstance, field: 'about', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: employmentInstance, field: 'email', 'error')} ">
	<label for="email" class="control-label"><g:message code="employ.email.label" /></label>
	<div class="controls">
		<bs:checkBox name="email" value="${employmentInstance?.email}" checked="${true}"/>
		<span class="help-inline">${hasErrors(bean: employmentInstance, field: 'email', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: employmentInstance, field: 'phone', 'error')} ">
	<label for="phone" class="control-label"><g:message code="employ.phone.label"/></label>
	<div class="controls">
		<bs:checkBox name="phone" value="${employmentInstance?.phone}" />
		<span class="help-inline">${hasErrors(bean: employmentInstance, field: 'phone', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: employmentInstance, field: 'resume', 'error')} ">
	<label for="resume" class="control-label"><g:message code="employ.resume.label"/></label>
	<div class="controls">
		<bs:checkBox name="resume" value="${employmentInstance?.resume}" />
		<span class="help-inline">${hasErrors(bean: employmentInstance, field: 'resume', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: employmentInstance, field: 'games', 'error')} ">
	<label for="resume" class="control-label"><g:message code="employ.games.label"/></label>
	<div class="controls">
		<bs:checkBox name="games" value="${employmentInstance?.games}" />
		<span class="help-inline">${hasErrors(bean: employmentInstance, field: 'games', 'error')}</span>
	</div>
</div>

