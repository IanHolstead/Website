
<%@ page import="programmingchallenge.web.ChallengesScore" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
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
				
					<g:if test="${challengesScoreInstance?.bonus}">
						<dt><g:message code="challengesScore.bonus.label" default="Bonus" /></dt>
						
							<dd><g:formatBoolean boolean="${challengesScoreInstance?.bonus}" /></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.challange}">
						<dt><g:message code="challengesScore.challange.label" default="Challange" /></dt>
						
							<dd><g:link controller="challenges" action="show" id="${challengesScoreInstance?.challange?.id}">${challengesScoreInstance?.challange?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.completed}">
						<dt><g:message code="challengesScore.completed.label" default="Completed" /></dt>
						
							<dd><g:formatBoolean boolean="${challengesScoreInstance?.completed}" /></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.languageBonus}">
						<dt><g:message code="challengesScore.languageBonus.label" default="Language Bonus" /></dt>
						
							<dd><g:formatBoolean boolean="${challengesScoreInstance?.languageBonus}" /></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.points}">
						<dt><g:message code="challengesScore.points.label" default="Points" /></dt>
						
							<dd><g:fieldValue bean="${challengesScoreInstance}" field="points"/></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.profile}">
						<dt><g:message code="challengesScore.profile.label" default="Profile" /></dt>
						
							<dd><g:link controller="userProfile" action="show" id="${challengesScoreInstance?.profile?.id}">${challengesScoreInstance?.profile?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${challengesScoreInstance?.winning}">
						<dt><g:message code="challengesScore.winning.label" default="Winning" /></dt>
						
							<dd><g:formatBoolean boolean="${challengesScoreInstance?.winning}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${challengesScoreInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${challengesScoreInstance?.id}">
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
