
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
			
				<g:sortableColumn property="blogTitle" title="${message(code: 'world.blogTitle.label', default: 'Blog Title')}" />
			
				<g:sortableColumn property="blogRestriction" title="${message(code: 'world.blogRestriction.label', default: 'Blog Restriction')}" />
			
				<g:sortableColumn property="videoCaption" title="${message(code: 'world.videoCaption.label', default: 'Video Caption')}" />
			
				<g:sortableColumn property="xkcd" title="${message(code: 'world.xkcd.label', default: 'Xkcd')}" />
			
				<g:sortableColumn property="xkcdCaption" title="${message(code: 'world.xkcdCaption.label', default: 'Xkcd Caption')}" />
			
				<g:sortableColumn property="imgTitle" title="${message(code: 'world.imgTitle.label', default: 'Img Title')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${worldInstanceList}" status="i" var="worldInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${worldInstance.id}">${fieldValue(bean: worldInstance, field: "blogTitle")}</g:link></td>
			
				<td>${fieldValue(bean: worldInstance, field: "blogRestriction")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "videoCaption")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "xkcd")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "xkcdCaption")}</td>
			
				<td>${fieldValue(bean: worldInstance, field: "imgTitle")}</td>
			
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
