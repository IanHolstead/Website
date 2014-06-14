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
<sec:ifAllGranted roles="ROLE_ADMIN">
	<g:if test="${blogInstance.secureUrl}">
		<g:link controller="blog" action="showPastSecurity" id="${blogInstance.secureUrl}">Link for sharing</g:link>
	</g:if>
</sec:ifAllGranted>
<section id="show-blog" class="first">
	<div class="content">${blogInstance.blogContent}</div>
</section>

</body>

</html>
