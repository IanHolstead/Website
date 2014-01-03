
<%@ page import="ian.website.PhotoAlbum" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photoAlbum.label', default: 'PhotoAlbum')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-photoAlbum" class="first">
	
	<center>
	<div>
		<g:each in="${photoAlbumInstance.photos}" var="p">
			<div class="photoTile">
				<div class="photoThumb"> 
					<center>
					<g:link controller="photo" action="show" id="${p.id}">
					<img style="max-width:400px; max-height:400px" src="${createLink(controller:'photo', action:'showPayload', id:"${p.id}")}" alt="${p.photoCaption}"/>
					</g:link>
					</center>
				</div>
				<div class="photoDescription">
					<center><h3>${p.photoName}</h3></center>
				</div>
			</div>
		</g:each>
	</div>
	</center>
</section>

</body>

</html>
