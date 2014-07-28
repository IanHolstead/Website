<%@ page import="com.ianholstead.website.Config" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'config.label', default: 'Config')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-config" class="first">

	<g:hasErrors bean="${configInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${configInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal" >
		<g:hiddenField name="id" value="${configInstance?.id}" />
		<g:hiddenField name="version" value="${configInstance?.version}" />
		<fieldset class="form">
			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeTitle', 'error')} required">
				<label for="homeTitle" class="control-label"><g:message code="config.homeTitle.label" default="Home Title" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="homeTitle" maxlength="100" required="" value="${configInstance?.homeTitle}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeTitle', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeInfo', 'error')} required">
				<label for="homeInfo" class="control-label"><g:message code="config.homeInfo.label" default="Home Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="homeInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.homeInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeAboutInfo', 'error')} required">
				<label for="homeAboutInfo" class="control-label"><g:message code="config.homeAboutInfo.label" default="Home About Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="homeAboutInfo" maxlength="150" required="" value="${configInstance?.homeAboutInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeAboutInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homePhotoInfo', 'error')} required">
				<label for="homePhotoInfo" class="control-label"><g:message code="config.homePhotoInfo.label" default="Home Photo Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="homePhotoInfo" maxlength="150" required="" value="${configInstance?.homePhotoInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homePhotoInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeConnectInfo', 'error')} required">
				<label for="homeConnectInfo" class="control-label"><g:message code="config.homeConnectInfo.label" default="Home Connect Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="homeConnectInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.homeConnectInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeConnectInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeProgrammingInfo', 'error')} required">
				<label for="homeProgrammingInfo" class="control-label"><g:message code="config.homeProgrammingInfo.label" default="Home Programming Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="homeProgrammingInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.homeProgrammingInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeProgrammingInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'homeOtherInfo', 'error')} required">
				<label for="homeOtherInfo" class="control-label"><g:message code="config.homeOtherInfo.label" default="Home Other Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="homeOtherInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.homeOtherInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'homeOtherInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactInfo', 'error')} required">
				<label for="contactInfo" class="control-label"><g:message code="config.contactInfo.label" default="Contact Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="contactInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.contactInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactInfo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactCity', 'error')} required">
				<label for="contactCity" class="control-label"><g:message code="config.contactCity.label" default="Contact City" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contactCity" maxlength="150" required="" value="${configInstance?.contactCity}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactCity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactEmail', 'error')} required">
				<label for="contactEmail" class="control-label"><g:message code="config.contactEmail.label" default="Contact Email" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contactEmail" maxlength="150" required="" value="${configInstance?.contactEmail}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactEmail', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactFacebook', 'error')} required">
				<label for="contactFacebook" class="control-label"><g:message code="config.contactFacebook.label" default="Contact Facebook" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contactFacebook" maxlength="150" required="" value="${configInstance?.contactFacebook}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactFacebook', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactLinkedIn', 'error')} required">
				<label for="contactLinkedIn" class="control-label"><g:message code="config.contactLinkedIn.label" default="Contact Linked In" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contactLinkedIn" maxlength="150" required="" value="${configInstance?.contactLinkedIn}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactLinkedIn', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactSkype', 'error')} required">
				<label for="contactSkype" class="control-label"><g:message code="config.contactSkype.label" default="Contact Skype" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contactSkype" maxlength="150" required="" value="${configInstance?.contactSkype}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactSkype', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'contactMapUrl', 'error')} required">
				<label for="contactMapUrl" class="control-label"><g:message code="config.contactMapUrl.label" default="Contact Map Url" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="contactMapUrl" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.contactMapUrl}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'contactMapUrl', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configInstance, field: 'footerAboutInfo', 'error')} required">
				<label for="footerAboutInfo" class="control-label"><g:message code="config.footerAboutInfo.label" default="Footer About Info" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="footerAboutInfo" cols="40" rows="5" maxlength="35000" required="" value="${configInstance?.footerAboutInfo}"/>
					<span class="help-inline">${hasErrors(bean: configInstance, field: 'footerAboutInfo', 'error')}</span>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset">Cancel</button>
		</div>
	</g:form>

</section>
			
</body>

</html>
