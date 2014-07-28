<%@ page import="com.ianholstead.website.Blog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'blog.label')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-blog" class="first">

	<g:hasErrors bean="${blogInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${blogInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label')}" />
            <button class="btn" type="reset"><g:message code="default.button.cancel.label"/></button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
