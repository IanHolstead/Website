
<%@ page import="ian.website.Upload" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'upload.label', default: 'Upload')}" />
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
						
							<g:sortableColumn property="isLink" title="${message(code: 'upload.isLink.label', default: 'Is Link')}" />
						
							<g:sortableColumn property="link" title="${message(code: 'upload.link.label', default: 'Link')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${uploadInstanceList}" var="uploadInstance">
						<tr>
						
							<td><g:formatBoolean boolean="${uploadInstance.isLink}" /></td>
						
							<td>${fieldValue(bean: uploadInstance, field: "link")}</td>
						
							<td class="link">
								<g:link action="show" id="${uploadInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${uploadInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
