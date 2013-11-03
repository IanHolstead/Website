
<%@ page import="ian.website.World" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'world.label', default: 'World')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="blogTitle" title="${message(code: 'world.blogTitle.label', default: 'Blog Title')}" />
						
							<g:sortableColumn property="blogRestriction" title="${message(code: 'world.blogRestriction.label', default: 'Blog Restriction')}" />
						
							<g:sortableColumn property="videoCaption" title="${message(code: 'world.videoCaption.label', default: 'Video Caption')}" />
						
							<g:sortableColumn property="xkcd" title="${message(code: 'world.xkcd.label', default: 'Xkcd')}" />
						
							<g:sortableColumn property="xkcdCaption" title="${message(code: 'world.xkcdCaption.label', default: 'Xkcd Caption')}" />
						
							<g:sortableColumn property="imgTitle" title="${message(code: 'world.imgTitle.label', default: 'Img Title')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${worldInstanceList}" var="worldInstance">
						<tr>
						
							<td>${fieldValue(bean: worldInstance, field: "blogTitle")}</td>
						
							<td>${fieldValue(bean: worldInstance, field: "blogRestriction")}</td>
						
							<td>${fieldValue(bean: worldInstance, field: "videoCaption")}</td>
						
							<td>${fieldValue(bean: worldInstance, field: "xkcd")}</td>
						
							<td>${fieldValue(bean: worldInstance, field: "xkcdCaption")}</td>
						
							<td>${fieldValue(bean: worldInstance, field: "imgTitle")}</td>
						
							<td class="link">
								<g:link action="show" id="${worldInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${worldInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
