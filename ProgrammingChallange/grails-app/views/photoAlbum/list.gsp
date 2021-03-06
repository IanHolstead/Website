<%@ page import="com.ianholstead.website.Photo" %>
<%@ page import="com.ianholstead.website.PhotoAlbum" %>
<%@ page import="java.util.Random" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photoAlbums.label')}" />
	<title>${entityName}</title>
</head>

<body>
	
<section id="list-photoAlbum" class="first">
	<g:if test="${photoAlbumInstanceList.empty}">
		<h3><g:message code="default.no.items.message" args="${[message(code: 'photoAlbums.label')]}"/></h3>
	</g:if>
	<g:each in="${photoAlbumInstanceList}" status="i" var="photoAlbumInstance">
		<div class="list-with-photo ${(i % 2) == 0 ? 'odd' : 'even'}${photoAlbumInstance.authenticationLevel.id <= 2?' admin':''}">
			<div class="list-text">
				<div class="title">
					<h1><g:link action="show" id="${photoAlbumInstance.getUrl()}">${photoAlbumInstance.name}</g:link></h1>
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
					<img class="list-image" src="/showThumb/${p[rand].getUrl()}" alt="${p[rand].photoName}"/>
				</g:if>
				<g:elseif test="${p.size()==1}">
					<img class="list-image" src="/showThumb/${p[0].getUrl()}" alt="${p[0].photoName}"/>
				</g:elseif>
			</div>
			
			<div class="list-thumb">
				<g:if test="${p.size()>1}">
					<img class="list-image" src="/showThumb/${p[rand-1].getUrl()}" alt="${p[rand-1].photoName}"/>
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
