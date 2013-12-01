<%@ page import="ian.programming.challenge.UserProfile" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userProfileInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="userProfile.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${userProfileInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: userProfileInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userProfileInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="userProfile.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${userProfileInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userProfileInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userProfileInstance, field: 'points', 'error')} ">
				<label for="points" class="control-label"><g:message code="userProfile.points.label" default="Points" /></label>
				<div class="controls">
					<g:field type="number" name="points" value="${userProfileInstance.points}"/>
					<span class="help-inline">${hasErrors(bean: userProfileInstance, field: 'points', 'error')}</span>
				</div>
			</div>

