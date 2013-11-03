
<%@ page import="ian.website.World" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'world.label', default: 'World')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${worldInstance?.blogTitle}">
						<dt><g:message code="world.blogTitle.label" default="Blog Title" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="blogTitle"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.blogRestriction}">
						<dt><g:message code="world.blogRestriction.label" default="Blog Restriction" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="blogRestriction"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.videoCaption}">
						<dt><g:message code="world.videoCaption.label" default="Video Caption" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="videoCaption"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.xkcd}">
						<dt><g:message code="world.xkcd.label" default="Xkcd" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="xkcd"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.xkcdCaption}">
						<dt><g:message code="world.xkcdCaption.label" default="Xkcd Caption" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="xkcdCaption"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.imgTitle}">
						<dt><g:message code="world.imgTitle.label" default="Img Title" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="imgTitle"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.imgCaption}">
						<dt><g:message code="world.imgCaption.label" default="Img Caption" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="imgCaption"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.blog}">
						<dt><g:message code="world.blog.label" default="Blog" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="blog"/></dd>
						
					</g:if>
				
					<g:if test="${worldInstance?.video}">
						<dt><g:message code="world.video.label" default="Video" /></dt>
						
							<dd><g:fieldValue bean="${worldInstance}" field="video"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${worldInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${worldInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
