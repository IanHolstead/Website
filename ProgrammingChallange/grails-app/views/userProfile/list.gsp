
<%@ page import="programmingchallenge.web.UserProfile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
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
						
							<g:sortableColumn property="name" title="${message(code: 'userProfile.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="email" title="${message(code: 'userProfile.email.label', default: 'Email')}" />
						
							<g:sortableColumn property="points" title="${message(code: 'userProfile.points.label', default: 'Points')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${userProfileInstanceList}" var="userProfileInstance">
						<tr>
						
							<td>${fieldValue(bean: userProfileInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "email")}</td>
						
							<td>${fieldValue(bean: userProfileInstance, field: "points")}</td>
						
							<td class="link">
								<g:link action="show" id="${userProfileInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${userProfileInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
