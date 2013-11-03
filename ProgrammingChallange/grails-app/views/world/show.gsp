
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
				<td valign="top" class="name"><g:message code="world.blogTitle.label" default="Blog Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "blogTitle")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.blogRestriction.label" default="Blog Restriction" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "blogRestriction")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.videoCaption.label" default="Video Caption" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "videoCaption")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.xkcd.label" default="Xkcd" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "xkcd")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.xkcdCaption.label" default="Xkcd Caption" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "xkcdCaption")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.imgTitle.label" default="Img Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "imgTitle")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.imgCaption.label" default="Img Caption" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "imgCaption")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.blog.label" default="Blog" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "blog")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="world.video.label" default="Video" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: worldInstance, field: "video")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
