<%@ page import="com.ianholstead.website.World" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'world.label', default: 'World Archive')}" />
	<title>${entityName}</title>
</head>

<body>
	
<section id="list-world" class="first">

	<g:each in="${worldInstanceList}" status="i" var="worldInstance">
		<div class="list-with-photo ${(i % 2) == 0 ? 'odd' : 'even'}${worldInstance.status != 2 && worldInstance.status != 1?' admin':''}">
			<div class="list-text">
				<div class="title">
					<h1><g:link action="show" id="${worldInstance.id}">${worldInstance.title}</g:link></h1>
				</div>
				
				<div class="list-summary">
					<p>${worldInstance.summary}</p>
				</div>
			</div>	
			
			<div class="list-thumb">
				<img class="list-image" src="/showThumb/${worldInstance.photo.id}/${worldInstance.photo.photoName}.png" alt="${worldInstance.photo.photoCaption}"/>
			</div>
		</div>	
	</g:each>
	
	<g:if test="${worldInstanceTotal > (params.max?:10)}">
		<div class="pagination">
			<bs:paginate total="${worldInstanceTotal}" />
		</div>
	</g:if>
</section>

</body>

</html>
