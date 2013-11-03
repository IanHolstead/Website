
<%@ page import="programmingchallenge.web.ChallengesScore" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
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
						
							<g:sortableColumn property="bonus" title="${message(code: 'challengesScore.bonus.label', default: 'Bonus')}" />
						
							<th class="header"><g:message code="challengesScore.challange.label" default="Challange" /></th>
						
							<g:sortableColumn property="completed" title="${message(code: 'challengesScore.completed.label', default: 'Completed')}" />
						
							<g:sortableColumn property="languageBonus" title="${message(code: 'challengesScore.languageBonus.label', default: 'Language Bonus')}" />
						
							<g:sortableColumn property="points" title="${message(code: 'challengesScore.points.label', default: 'Points')}" />
						
							<th class="header"><g:message code="challengesScore.profile.label" default="Profile" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${challengesScoreInstanceList}" var="challengesScoreInstance">
						<tr>
						
							<td><g:formatBoolean boolean="${challengesScoreInstance.bonus}" /></td>
						
							<td>${fieldValue(bean: challengesScoreInstance, field: "challange")}</td>
						
							<td><g:formatBoolean boolean="${challengesScoreInstance.completed}" /></td>
						
							<td><g:formatBoolean boolean="${challengesScoreInstance.languageBonus}" /></td>
						
							<td>${fieldValue(bean: challengesScoreInstance, field: "points")}</td>
						
							<td>${fieldValue(bean: challengesScoreInstance, field: "profile")}</td>
						
							<td class="link">
								<g:link action="show" id="${challengesScoreInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${challengesScoreInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
