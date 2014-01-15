
<%@ page import="ian.website.Blog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${blogInstance.blogTitle}" />
	<title>${entityName}</title>
</head>

<body>

<section id="show-blog" class="first">
	<div class="content">${blogInstance.blogContent}</div>
</section>

</body>

</html>
