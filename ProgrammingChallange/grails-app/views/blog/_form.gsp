<%@ page import="ian.website.Blog" %>



			<div class="control-group fieldcontain ${hasErrors(bean: blogInstance, field: 'blogTitle', 'error')} required">
				<label for="blogTitle" class="control-label"><g:message code="blog.blogTitle.label" default="Blog Title" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="blogTitle" maxlength="100" required="" value="${blogInstance?.blogTitle}"/>
					<span class="help-inline">${hasErrors(bean: blogInstance, field: 'blogTitle', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: blogInstance, field: 'blogSummary', 'error')} ">
				<label for="blogSummary" class="control-label"><g:message code="blog.blogSummary.label" default="Blog Summary" /></label>
				<div class="controls">
					<g:textArea name="blogSummary" maxlength="250" value="${blogInstance?.blogSummary}"/>
					<span class="help-inline">${hasErrors(bean: blogInstance, field: 'blogSummary', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: blogInstance, field: 'blogContent', 'error')} ">
				<label for="blogContent" class="control-label"><g:message code="blog.blogContent.label" default="Blog Content" /></label>
				<div class="controls">
					<g:textArea name="blogContent" value="${blogInstance?.blogContent}"/>
					<span class="help-inline">${hasErrors(bean: blogInstance, field: 'blogContent', 'error')}</span>
				</div>
			</div>

