<%@ page import="com.ianholstead.website.Employment" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'employ.label')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-employ" class="first">

	<g:hasErrors bean="${employmentInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${employmentInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${employmentInstance?.id}" />
		<g:hiddenField name="version" value="${employmentInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label')}" 
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message')}');" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label"/></button>
            <g:link class="btn" action="list"><g:message code="default.button.cancel.label"/></g:link>
		</div>
	</g:form>

</section>
			
</body>

</html>
