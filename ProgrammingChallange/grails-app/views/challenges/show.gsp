
<%@ page import="programmingchallenge.web.Challenges" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'challenges.label', default: 'Challenges')}" />
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
				
					<g:if test="${challengesInstance?.name}">
						<dt><g:message code="challenges.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.description}">
						<dt><g:message code="challenges.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.completionPoints}">
						<dt><g:message code="challenges.completionPoints.label" default="Completion Points" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="completionPoints"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.winningPoints}">
						<dt><g:message code="challenges.winningPoints.label" default="Winning Points" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="winningPoints"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.languageBonus}">
						<dt><g:message code="challenges.languageBonus.label" default="Language Bonus" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="languageBonus"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.bonusPoints}">
						<dt><g:message code="challenges.bonusPoints.label" default="Bonus Points" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="bonusPoints"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.bonusPointsDescription}">
						<dt><g:message code="challenges.bonusPointsDescription.label" default="Bonus Points Description" /></dt>
						
							<dd><g:fieldValue bean="${challengesInstance}" field="bonusPointsDescription"/></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.startDate}">
						<dt><g:message code="challenges.startDate.label" default="Start Date" /></dt>
						
							<dd><g:formatDate date="${challengesInstance?.startDate}" /></dd>
						
					</g:if>
				
					<g:if test="${challengesInstance?.endDate}">
						<dt><g:message code="challenges.endDate.label" default="End Date" /></dt>
						
							<dd><g:formatDate date="${challengesInstance?.endDate}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${challengesInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${challengesInstance?.id}">
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
