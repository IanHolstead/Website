
<%@ page import="com.ianholstead.website.PhotoAlbum" %>
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
	<div class="cont-nav">
		<div class="left">
			<g:link controller="photoAlbum" action="show" id="${prev.getUrl()}">
				<span class="icon-chevron-left"></span> <g:message code="default.paginate.prev"/>
			</g:link>
		</div>
		
		<div class="center">
			<g:link controller="photoAlbum" action="list">
				<span class="icon-th-list"></span> <g:message code="photoAlbums.label"/>
			</g:link>
		</div>
		
		<div class="right">
			<g:link controller="photoAlbum" action="show" id="${next.getUrl()}">
				<g:message code="default.paginate.next"/> <span class="icon-chevron-right"></span>
			</g:link>
		</div>
	</div>
	<div class="center">
		<g:each in="${photos}" var="p">
			<div class="photoTile">
				<div class="center">
					<div class="photoThumb">
					<g:link controller="photo" action="show" id="${p.getPageUrl()}">
						<img class="photo" src="/showThumb/${p.getUrl()}" title="${p.photoCaption}" alt="${p.photoName}"/>
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
