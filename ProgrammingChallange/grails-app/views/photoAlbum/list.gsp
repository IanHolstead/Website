
<%@ page import="ian.website.PhotoAlbum" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photoAlbum.label', default: 'PhotoAlbum')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-photoAlbum" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="name" title="${message(code: 'photoAlbum.name.label', default: 'Name')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${photoAlbumInstanceList}" status="i" var="photoAlbumInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${photoAlbumInstance.id}">${fieldValue(bean: photoAlbumInstance, field: "name")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${photoAlbumInstanceTotal}" />
	</div>
</section>

</body>

</html>
