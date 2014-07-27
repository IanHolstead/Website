<%@ page import="com.ianholstead.website.Photo" %>
<%@ page import="java.util.Random" %>

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
	<g:if test="${!noNav}">
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
	</g:if>
	<div class="center">
		<img src="/showPhoto/${photoInstance.id}/${photoInstance.photoName}.png"/>
		<div class="caption">${photoInstance.photoCaption}</div>
		
		<sec:ifAllGranted roles="ROLE_ADMIN">
			<g:if test="${photoInstance.secureUrl}">
				<g:link controller="photo" action="showPastSecurity" id="${photoInstance.secureUrl}">Link for sharing</g:link>
			</g:if>
		</sec:ifAllGranted>
	</div>
	<g:if test="${!noNav}">
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
	</g:if>
</section>

</body>

</html>
