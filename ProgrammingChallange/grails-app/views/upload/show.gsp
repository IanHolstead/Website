<%@ page import="com.ianholstead.website.Upload" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<g:set var="entityName" value="${message(code: 'upload.label', default: 'Upload')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${uploadInstance.isPicture}">
		<img src="${createLink(controller:'upload', action:'showPayload', id:"${uploadInstance.id}")}"/>
	</g:if>
	<g:else>
		
	</g:else>
</body>
</html>
