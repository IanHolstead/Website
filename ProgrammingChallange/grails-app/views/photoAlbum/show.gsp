
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

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photoAlbum.name.label" default="Name" /></td>
				<td valign="top" class="value">${fieldValue(bean: photoAlbumInstance, field: "name")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photoAlbum.photos.label" default="Photos" /></td>
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${photoAlbumInstance.photos}" var="p">
						<li><g:link controller="photo" action="show" id="${p.id}">
							<img  src="${createLink(controller:'photo', action:'showPayload', id:"${p.id}")}" width='300' />
						</g:link></li>
					</g:each>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>
