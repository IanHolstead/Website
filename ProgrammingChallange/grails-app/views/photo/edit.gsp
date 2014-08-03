<%@ page import="com.ianholstead.website.Photo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photo.label')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-photo" class="first">

	<g:hasErrors bean="${photoInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${photoInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal"  enctype="multipart/form-data">
		<g:hiddenField name="id" value="${photoInstance?.id}" />
		<g:hiddenField name="version" value="${photoInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
