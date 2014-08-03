<%@ page import="com.ianholstead.website.World" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'world.label')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-world" class="first">

	<g:hasErrors bean="${worldInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${worldInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal"  enctype="multipart/form-data">
		<g:hiddenField name="id" value="${worldInstance?.id}" />
		<g:hiddenField name="version" value="${worldInstance?.version}" />
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
