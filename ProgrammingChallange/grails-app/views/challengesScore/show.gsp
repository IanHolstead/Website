
<%@ page import="programmingchallange.ChallengesScore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'challengesScore.label', default: 'ChallengesScore')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-challengesScore" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-challengesScore" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list challengesScore">
			
				<g:if test="${challengesScoreInstance?.challange}">
				<li class="fieldcontain">
					<span id="challange-label" class="property-label"><g:message code="challengesScore.challange.label" default="Challange" /></span>
					
						<span class="property-value" aria-labelledby="challange-label"><g:link controller="challanges" action="show" id="${challengesScoreInstance?.challange?.id}">${challengesScoreInstance?.challange?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${challengesScoreInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="challengesScore.points.label" default="Points" /></span>
					
						<span class="property-value" aria-labelledby="points-label"><g:fieldValue bean="${challengesScoreInstance}" field="points"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challengesScoreInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="challengesScore.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="userProfile" action="show" id="${challengesScoreInstance?.profile?.id}">${challengesScoreInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${challengesScoreInstance?.id}" />
					<g:link class="edit" action="edit" id="${challengesScoreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
