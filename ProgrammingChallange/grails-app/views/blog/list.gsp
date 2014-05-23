<%@ page import="ian.website.Blog" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog Archive')}" />
	<title>${entityName}</title>
</head>

<body>
	
<section id="list-blog" class="first">
	<g:each in="${blogInstanceList}" status="i" var="blogInstance">
		<div class="${(i % 2) == 0 ? 'odd' : 'even'}${blogInstance.authenticationLevel.id <= 2?' admin':''}">
			<div class="text">
				<div class="title">
					<h1><g:link action="show" id="${blogInstance.id}">${blogInstance.blogTitle}</g:link></h1>
				</div>
				<div class="summary">
					<p>${blogInstance.blogSummary}</p>
				</div>
			</div>
		</div>
	</g:each>
	<div class="pagination">
		<bs:paginate total="${blogInstanceTotal}" />
	</div>
</section>

</body>

</html>
