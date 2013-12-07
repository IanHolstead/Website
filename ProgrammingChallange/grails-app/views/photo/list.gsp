
<%@ page import="ian.website.Photo" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-photo" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="photoPayload" title="${message(code: 'photo.photoPayload.label', default: 'Photo Payload')}" />
				<g:sortableColumn property="photoName" title="${message(code: 'photo.photoName.label', default: 'Photo Name')}" />
				<g:sortableColumn property="photoCaption" title="${message(code: 'photo.photoCaption.label', default: 'Photo Caption')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${photoInstanceList}" status="i" var="photoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${photoInstance.id}"><img  src="${createLink(controller:'photo', action:'showPayload', id:"${photoInstance.id}")}" width='300' /></g:link></td>
				<td>${fieldValue(bean: photoInstance, field: "photoName")}</td>
				<td>${fieldValue(bean: photoInstance, field: "photoCaption")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${photoInstanceTotal}" />
	</div>
</section>

</body>

</html>
