
<%@ page import="programmingchallange.Challanges" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'challanges.label', default: 'Challanges')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-challanges" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-challanges" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list challanges">
			
				<g:if test="${challangesInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="challanges.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${challangesInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="challanges.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${challangesInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.completionPoints}">
				<li class="fieldcontain">
					<span id="completionPoints-label" class="property-label"><g:message code="challanges.completionPoints.label" default="Completion Points" /></span>
					
						<span class="property-value" aria-labelledby="completionPoints-label"><g:fieldValue bean="${challangesInstance}" field="completionPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.winningPoints}">
				<li class="fieldcontain">
					<span id="winningPoints-label" class="property-label"><g:message code="challanges.winningPoints.label" default="Winning Points" /></span>
					
						<span class="property-value" aria-labelledby="winningPoints-label"><g:fieldValue bean="${challangesInstance}" field="winningPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.languageBonus}">
				<li class="fieldcontain">
					<span id="languageBonus-label" class="property-label"><g:message code="challanges.languageBonus.label" default="Language Bonus" /></span>
					
						<span class="property-value" aria-labelledby="languageBonus-label"><g:fieldValue bean="${challangesInstance}" field="languageBonus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.bonusPoints}">
				<li class="fieldcontain">
					<span id="bonusPoints-label" class="property-label"><g:message code="challanges.bonusPoints.label" default="Bonus Points" /></span>
					
						<span class="property-value" aria-labelledby="bonusPoints-label"><g:fieldValue bean="${challangesInstance}" field="bonusPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.bonusPointsDescription}">
				<li class="fieldcontain">
					<span id="bonusPointsDescription-label" class="property-label"><g:message code="challanges.bonusPointsDescription.label" default="Bonus Points Description" /></span>
					
						<span class="property-value" aria-labelledby="bonusPointsDescription-label"><g:fieldValue bean="${challangesInstance}" field="bonusPointsDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="challanges.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${challangesInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${challangesInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="challanges.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${challangesInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${challangesInstance?.id}" />
					<g:link class="edit" action="edit" id="${challangesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
