
<%@ page import="ian.website.World" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'world.label', default: 'World')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-world" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="title" title="${message(code: 'world.title.label', default: 'Title')}" />
			
				<g:sortableColumn property="videoCaption" title="${message(code: 'world.videoCaption.label', default: 'Video Caption')}" />
			
				<g:sortableColumn property="xkcd" title="${message(code: 'world.xkcd.label', default: 'Xkcd')}" />
			
				<g:sortableColumn property="xkcdCaption" title="${message(code: 'world.xkcdCaption.label', default: 'Xkcd Caption')}" />
			
				<th><g:message code="world.blog.label" default="Blog" /></th>
			
				<th><g:message code="world.photo.label" default="Photo" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${worldInstanceList}" status="i" var="worldInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${worldInstance.id}">${fieldValue(bean: worldInstance, field: "title")}</g:link></td>
			
				<td>${fieldValue(bean: worldInstance, field: "videoCaption")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "xkcd")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "xkcdCaption")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "blog")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "photo")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${worldInstanceTotal}" />
	</div>
</section>

</body>

</html>
