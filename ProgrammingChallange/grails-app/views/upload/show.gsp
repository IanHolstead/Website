
<%@ page import="ian.website.Upload" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'upload.label', default: 'Upload')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-upload" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="upload.isLink.label" default="Is Link" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${uploadInstance?.isLink}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="upload.link.label" default="Link" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: uploadInstance, field: "link")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
