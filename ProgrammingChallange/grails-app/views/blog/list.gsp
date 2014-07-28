<%@ page import="com.ianholstead.website.Blog" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'default.archive.label', args:[message(code: 'blog.label')])}" />
	<title>${entityName}</title>
</head>

<body>
	
<section id="list-blog" class="first">
	<g:each in="${blogInstanceList}" status="i" var="blogInstance">
		<div class="list-no-photo ${(i % 2) == 0 ? 'odd' : 'even'}${blogInstance.authenticationLevel.id <= 2?' admin':''}">
			<div class="list-text">
				<div class="title">
					<h1><g:link action="show" id="${blogInstance.id}">${blogInstance.blogTitle}</g:link></h1>
				</div>
				<div class="list-summary">
					<p>${blogInstance.blogSummary}</p>
				</div>
			</div>
		</div>
	</g:each>
	<g:if test="${blogInstanceTotal > (params.max?:10) }">
		<div class="pagination">
			<bs:paginate total="${blogInstanceTotal}" />
		</div>
	</g:if>
</section>

</body>

</html>
