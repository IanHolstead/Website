<%@ page import="com.ianholstead.website.PhotoAlbum" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photoAlbum.label')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-photoAlbum" class="first">

	<g:hasErrors bean="${photoAlbumInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${photoAlbumInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label')}" />
			<button class="btn" type="reset"><g:message code="default.button.reset.label"/></button>
            <g:link class="btn" action="list"><g:message code="default.button.cancel.label"/></g:link>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
