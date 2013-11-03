<%@ page import="ian.website.Upload" %>



			<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'isLink', 'error')} ">
				<label for="isLink" class="control-label"><g:message code="upload.isLink.label" default="Is Link" /></label>
				<div class="controls">
					<bs:checkBox name="isLink" value="${uploadInstance?.isLink}" />
					<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'isLink', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: uploadInstance, field: 'link', 'error')} ">
				<label for="link" class="control-label"><g:message code="upload.link.label" default="Link" /></label>
				<div class="controls">
					<g:textField name="link" value="${uploadInstance?.link}"/>
					<span class="help-inline">${hasErrors(bean: uploadInstance, field: 'link', 'error')}</span>
				</div>
			</div>

