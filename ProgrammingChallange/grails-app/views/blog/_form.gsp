<%@ page import="com.ianholstead.website.Blog" %>
<%@ page import="com.ianholstead.security.Role" %>

<g:set var="roleList" value="${Role.list()}"/>
<g:set var="roleNumber" value="${(int)blogInstance?.authenticationLevel? blogInstance.authenticationLevel.id-1 : 6}"/>
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
<div class="control-group fieldcontain ${hasErrors(bean: blogInstance, field: 'blogAuthentication', 'error')} ">
	<label for="authenticationLevel" class="control-label"><g:message code="authenticationLevel.label" default="Authenticaion Level" /></label>
	<div class="controls">
		<g:select name="authenticationLevel" from="${roleList.reverse()}" value="${roleList[roleNumber]}"/>
		<span class="help-inline">${hasErrors(bean: blogInstance, field: 'authenticationLevel', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: blogInstance, field: 'secureUrl', 'error')} ">
	<label for="secureUrl" class="control-label"><g:message code="blog.secureUrl.label" default="Bypass security?" /></label>
	<div class="controls">
		<bs:checkBox name="secureUrl" value="${blogInstance?.secureUrl}" />
		<span class="help-inline">${hasErrors(bean: blogInstance, field: 'secureUrl', 'error')}</span>
	</div>
</div>

