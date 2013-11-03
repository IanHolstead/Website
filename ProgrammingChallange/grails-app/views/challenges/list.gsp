
<%@ page import="programmingchallenge.web.Challenges" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'challenges.label', default: 'Challenges')}" />
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
						
							<g:sortableColumn property="name" title="${message(code: 'challenges.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'challenges.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="completionPoints" title="${message(code: 'challenges.completionPoints.label', default: 'Completion Points')}" />
						
							<g:sortableColumn property="winningPoints" title="${message(code: 'challenges.winningPoints.label', default: 'Winning Points')}" />
						
							<g:sortableColumn property="languageBonus" title="${message(code: 'challenges.languageBonus.label', default: 'Language Bonus')}" />
						
							<g:sortableColumn property="bonusPoints" title="${message(code: 'challenges.bonusPoints.label', default: 'Bonus Points')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${challengesInstanceList}" var="challengesInstance">
						<tr>
						
							<td>${fieldValue(bean: challengesInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: challengesInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: challengesInstance, field: "completionPoints")}</td>
						
							<td>${fieldValue(bean: challengesInstance, field: "winningPoints")}</td>
						
							<td>${fieldValue(bean: challengesInstance, field: "languageBonus")}</td>
						
							<td>${fieldValue(bean: challengesInstance, field: "bonusPoints")}</td>
						
							<td class="link">
								<g:link action="show" id="${challengesInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${challengesInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
