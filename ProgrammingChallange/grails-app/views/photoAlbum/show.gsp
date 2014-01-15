
<%@ page import="ian.website.PhotoAlbum" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${photoAlbumInstance.name}" />
	<title>${entityName}</title>
</head>

<body>

<section id="show-photoAlbum" class="first">
	
	<div class="center">
		<g:each in="${photoAlbumInstance.photos}" var="p">
			<div class="photoTile">
				<div class="photoThumb"> 
					<div class="center">
					<g:link controller="photo" action="show" id="${p.id}">
					<img src="/showThumb/${p.id}/${p.photoName}.png" alt="${p.photoCaption}"/>
<%--					<img class="photo" src="${createLink(controller:'photo', action:'showThumb', id:"${p.id}")}" alt="${p.photoCaption}"/>--%>
					</g:link>
					</div>
				</div>
				<div class="photoDescription">
					<div class="center"><h3>${p.photoName?:p.photoOriginalName}</h3></div>
				</div>
			</div>
		</g:each>
	</div>
</section>

</body>

</html>
