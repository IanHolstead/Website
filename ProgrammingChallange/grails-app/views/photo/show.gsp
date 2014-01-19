
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
	<div class="photo-nav">
		<div class="left">
			<g:link controller="photo" action="show" id="${photoPrev.id}">
				<span class="icon-chevron-left"></span> Previous
			</g:link>
		</div>
		
		<div class="center">
			<g:link controller="photoAlbum" action="show" id="${photoInstance.album.id}">
				<span class="icon-th-list"></span> ${photoInstance.album}
			</g:link>
		</div>
		
		<div class="right">
			<g:link controller="photo" action="show" id="${photoNext.id}">
				Next <span class="icon-chevron-right"></span>
			</g:link>
		</div>
	</div>
	<div class="center">
		<img src="/showPhoto/${photoInstance.id}/${photoInstance.photoName}.png"/>
		<div class="caption">${photoInstance.photoCaption}</div>
	</div>
	<div class="photo-nav">
		<div class="left">
			<g:link controller="photo" action="show" id="${photoPrev.id}">
				<span class="icon-chevron-left"></span> Previous
			</g:link>
		</div>
		
		<div class="center">
			<g:link controller="photoAlbum" action="show" id="${photoInstance.album.id}">
				<span class="icon-th-list"></span> ${photoInstance.album}
			</g:link>
		</div>
		
		<div class="right">
			<g:link controller="photo" action="show" id="${photoNext.id}">
				Next <span class="icon-chevron-right"></span>
			</g:link>
		</div>
	</div>
</section>

</body>

</html>
