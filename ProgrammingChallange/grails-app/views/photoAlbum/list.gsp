<%@ page import="ian.website.Photo" %>
<%@ page import="ian.website.PhotoAlbum" %>
<%@ page import="java.util.Random" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photoAlbum.label', default: 'Photo Albums')}" />
	<title>${entityName}</title>
</head>

<body>
	
<section id="list-photoAlbum" class="first">

	<g:each in="${photoAlbumInstanceList}" status="i" var="photoAlbumInstance">
		<div class="list-with-photo ${(i % 2) == 0 ? 'odd' : 'even'}${photoAlbumInstance.authenticationLevel.id <= 2?' admin':''}">
			<div class="list-text">
				<div class="title">
					<h1><g:link action="show" id="${photoAlbumInstance.id}">${photoAlbumInstance.name}</g:link></h1>
				</div>
				
				<div class="list-summary">
					<p>${photoAlbumInstance.summary}</p>
				</div>
			</div>	
			
			<g:set var="rand" value="${new Random()}"/>
			<g:set var="p" value="${Photo.findAllByAlbum(photoAlbumInstance)}"/>
			<g:if test="${p.size()>1}">
				<g:set var="rand" value="${rand.nextInt(p.size()-1)}"/>
			</g:if>
			<div class="list-thumb">
				<g:if test="${p.size()>1}">
					<img class="list-image" src="/showThumb/${p[rand].id}/${p[rand].photoName}.png" alt="${p[rand].photoCaption}"/>
				</g:if>
				<g:elseif test="${p.size()==1}">
					<img class="list-image" src="/showThumb/${p[0].id}/${p[0].photoName}.png" alt="${p[0].photoCaption}"/>
				</g:elseif>
			</div>
			
			<div class="list-thumb">
				<g:if test="${p.size()>1}">
					<img class="list-image" src="/showThumb/${p[rand-1].id}/${p[rand-1].photoName}.png" alt="${p[rand-1].photoCaption}"/>
				</g:if>
			</div>
		</div>
	</g:each>
	<g:if test="${ photoAlbumInstanceTotal > (params.max?:10) }">
		<div class="pagination">
			<bs:paginate total="${photoAlbumInstanceTotal}" />
		</div>
	</g:if>
</section>

</body>

</html>
