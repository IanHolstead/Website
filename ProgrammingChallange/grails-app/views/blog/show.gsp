
<%@ page import="ian.website.Blog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-blog" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogTitle.label" default="Blog Title" /></td>
				
				<td valign="top" class="value">${blogInstance.blogTitle}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogSummary.label" default="Blog Summary" /></td>
				<td valign="top" class="value">${blogInstance.blogSummary}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogContent.label" default="Blog Content" /></td>
				
				<td valign="top" class="value">${blogInstance.blogContent}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
