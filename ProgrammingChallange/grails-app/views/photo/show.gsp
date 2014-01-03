
<%@ page import="ian.website.Photo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-photo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name">
					<img  src="${createLink(controller:'photo', action:'showPayload', id:"${photoInstance.id}")}" width='300' />
				</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.photoName.label" default="Photo Name" /></td>
				<td valign="top" class="value">${photoInstance.photoName}</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.photoCaption.label" default="Photo Caption" /></td>
				<td valign="top" class="value">${photoInstance.photoCaption}</td>
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>
