<%@ page import="ian.website.Upload" %>



<div class="fieldcontain ${hasErrors(bean: uploadInstance, field: 'isLink', 'error')} ">
	<label for="isLink">
		<g:message code="upload.isLink.label" default="Is Link" />
		
	</label>
	<g:checkBox name="isLink" value="${uploadInstance?.isLink}" />
</div>

<div class="fieldcontain ${hasErrors(bean: uploadInstance, field: 'link', 'error')} ">
	<label for="link">
		<g:message code="upload.link.label" default="Link" />
		
	</label>
	<g:textField name="link" value="${uploadInstance?.link}"/>
</div>

