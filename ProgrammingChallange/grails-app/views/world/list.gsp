<%@ page import="ian.website.World" %>
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
		<div class="${(i % 2) == 0 ? 'odd' : 'even'}">
			<div class="text">
				<div class="title">
					<h1><g:link action="show" id="${worldInstance.id}">${worldInstance.title}</g:link></h1>
				</div>
				
				<div class="summary">
					<p>${worldInstance.summary}</p>
				</div>
			</div>	
			
			<div class="thumb">
				<img src="/showThumb/${worldInstance.photo.id}/${worldInstance.photo.photoName}.png" alt="${worldInstance.photo.photoCaption}"/>
<%--				<img class="image" src="${createLink(controller:'photo', action:'showPayload', id:"${worldInstance.photo.id}")}" />--%>
			</div>
		</div>	
	</g:each>
	
	<g:if test="${worldInstanceTotal >= (params.max?:10)}">
		<div class="pagination">
			<bs:paginate total="${worldInstanceTotal}" />
		</div>
	</g:if>
</section>

</body>

</html>
