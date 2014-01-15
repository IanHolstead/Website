
<%@ page import="ian.website.Photo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${photoInstance.photoName}"/>
	<title>${entityName}</title>
</head>

<body>

<section id="show-photo" class="first">
	<div class="center">
		<img src="/showPhoto/${photoInstance.id}/${photoInstance.photoName}.png"/>
		<div class="caption">${photoInstance.photoCaption}</div>
	</div>
</section>

</body>

</html>
