<%@ page import="ian.website.Upload" %>

<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'link', 'error')} ">
	<label for="link" class="control-label"><g:message code="upload.link.label" default="Link" /></label>
	<div class="controls">
		<g:textField name="link" value="${uploadInstance?.link}"/>
		<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'link', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload" class="control-label"><g:message code="upload.filePayload.label" default="Photo Payload" /></label>
	<div class="controls">
		<input type="file" id="filePayload" name="filePayload" />
		<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'filePayload', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'fileName', 'error')} ">
	<label for="fileName" class="control-label"><g:message code="upload.fileName.label" default="File Name" /></label>
	<div class="controls">
		<g:textField name="fileName" value="${uploadInstance?.fileName}"/>
		<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'fileName', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'isLink', 'error')} ">
	<label for="isPicture" class="control-label"><g:message code="upload.isPicture.label" default="Is Picture" /></label>
	<div class="controls">
		<bs:checkBox name="isPicture" value="${uploadInstance?.isPicture}" />
		<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'isPicture', 'error')}</span>
	</div>
</div>