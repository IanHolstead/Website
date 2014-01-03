
<%@ page import="ian.website.Blog" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-blog" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="blogTitle" title="${message(code: 'blog.blogTitle.label', default: 'Blog Title')}" />
			
				<g:sortableColumn property="blogSummary" title="${message(code: 'blog.blogSummary.label', default: 'Blog Summary')}" />
			
				<g:sortableColumn property="blogContent" title="${message(code: 'blog.blogContent.label', default: 'Blog Content')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${blogInstanceList}" status="i" var="blogInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${blogInstance.id}">${blogInstance.blogTitle}</g:link></td>
			
				<td>${blogInstance.blogSummary}</td>
			
				<td>${blogInstance.blogContent}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${blogInstanceTotal}" />
	</div>
</section>

</body>

</html>
