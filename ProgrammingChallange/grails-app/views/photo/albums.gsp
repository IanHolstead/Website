
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
			
				<g:sortableColumn property="album" title="${message(code: 'photo.album.label', default: 'Album')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:if test="${albums[0]}">
		<g:each in="${albums}" status="i" var="album">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${album.id}">${album.album}</g:link></td>
			
			</tr>
		</g:each>
		</g:if>
		</tbody>
	</table>
<%--	<div class="pagination">--%>
<%--		<bs:paginate total="${photoInstanceTotal}" />--%>
<%--	</div>--%>
</section>

</body>

</html>
