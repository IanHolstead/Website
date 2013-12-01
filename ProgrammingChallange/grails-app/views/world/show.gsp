
<%@ page import="ian.website.World" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'world.label', default: 'World')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-world" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.title.label" default="Title" /></td>
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "title")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.summary.label" default="Summary" /></td>
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "summary")}</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.xkcd.label" default="Xkcd" /></td>
				<td valign="top" class="value">
					<img  src="${fieldValue(bean: worldInstance, field: "xkcd")}" width='300' />
				</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.xkcdCaption.label" default="Xkcd Caption" /></td>
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "xkcdCaption")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogTitle.label" default="Blog Title" /></td>
				<td valign="top" class="value">${fieldValue(bean: blogInstance, field: "blogTitle")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogSummary.label" default="Blog Summary" /></td>
				<td valign="top" class="value">${fieldValue(bean: blogInstance, field: "blogSummary")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="blog.blogContent.label" default="Blog Content" /></td>
				<td valign="top" class="value">${fieldValue(bean: blogInstance, field: "blogContent")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.photo.label" default="Photo" /></td>
				<td valign="top" class="name">
					<img  src="${createLink(controller:'photo', action:'showPayload', id:"${photoInstance.id}")}" width='300' />
				</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.photoName.label" default="Photo Name" /></td>
				<td valign="top" class="value">${fieldValue(bean: photoInstance, field: "photoName")}</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.photoCaption.label" default="Photo Caption" /></td>
				<td valign="top" class="value">${fieldValue(bean: photoInstance, field: "photoCaption")}</td>
			</tr>
			
			<g:if test="${fieldValue(bean: worldInstance, field: "video")}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="world.videoCaption.label" default="Video Caption" /></td>
					<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "videoCaption")}</td>
				</tr>
			
				<tr class="prop">
					<td valign="top" class="name"><g:message code="world.video.label" default="Video" /></td>
					<td valign="top" class="value">
						<iframe width="853" height="480" src="${fieldValue(bean: worldInstance, field: "video")}" frameborder="0" allowfullscreen></iframe>
					</td>
				</tr>
			</g:if>
		
		</tbody>
	</table>
</section>

</body>

</html>
