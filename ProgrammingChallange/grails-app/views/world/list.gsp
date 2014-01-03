
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

	
	<div>
		<g:each in="${worldInstanceList}" status="i" var="worldInstance">
			<div class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<div style="width: 70%; float:left;">
					<div class="title">
						<h1><g:link action="show" id="${worldInstance.id}">${worldInstance.title}</g:link></h1>
					</div>
					
					<div class="summary">
						<p>${worldInstance.summary}</p>
					</div>
				</div>	
				
				<div class="floater">
					<div class="thumb">
						<img class="image" src="${createLink(controller:'photo', action:'showPayload', id:"${worldInstance.photo.id}")}" />
					</div>
				</div>
			</div>	
		</g:each>		
	</div>
	
	
	
	<div class="pagination">
		<bs:paginate total="${worldInstanceTotal}" />
	</div>
</section>

</body>

</html>
