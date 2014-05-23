<%@ page import="ian.website.World" %>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'title', 'error')} ">
	<label for="title" class="control-label"><g:message code="world.title.label" default="Title" /></label>
	<div class="controls">
		<g:textField name="title" maxlength="100" value="${worldInstance?.title}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'title', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'summary', 'error')} ">
	<label for="summary" class="control-label"><g:message code="world.summary.label" default="Summary" /></label>
	<div class="controls">
		<g:textArea name="summary" value="${worldInstance?.summary}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'summary', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message code="world.status.label" default="Status" /></label>
	<div class="controls">
		<input type="number" name="status" value="${worldInstance?.status}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'status', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'video', 'error')} ">
	<label for="video" class="control-label"><g:message code="world.video.label" default="Video" /></label>
	<div class="controls">
		<g:textField name="video" value="${worldInstance?.video}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'video', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'videoCaption', 'error')} ">
	<label for="videoCaption" class="control-label"><g:message code="world.videoCaption.label" default="Video Caption" /></label>
	<div class="controls">
		<g:textArea name="videoCaption" cols="40" rows="5" value="${worldInstance?.videoCaption}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'videoCaption', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'xkcd', 'error')} ">
	<label for="xkcd" class="control-label"><g:message code="world.xkcd.label" default="Xkcd" /></label>
	<div class="controls">
		<g:field type="url" name="xkcd" value="${worldInstance?.xkcd}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'xkcd', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'xkcdCaption', 'error')} ">
	<label for="xkcdCaption" class="control-label"><g:message code="world.xkcdCaption.label" default="Xkcd Caption" /></label>
	<div class="controls">
		<g:textArea name="xkcdCaption" cols="40" rows="5" value="${worldInstance?.xkcdCaption}"/>
		<span class="help-inline">${hasErrors(bean: worldInstance, field: 'xkcdCaption', 'error')}</span>
	</div>
</div>

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
		<g:textArea name="blogSummary" value="${blogInstance?.blogSummary}"/>
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

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'photoPayload', 'error')} ">
	<label for="photoPayload" class="control-label"><g:message code="photo.photoPayload.label" default="Photo Payload" /></label>
	<div class="controls">
		<input type="file" id="photoPayload" name="photoPayload" />
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'photoPayload', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'photoName', 'error')} ">
	<label for="photoName" class="control-label"><g:message code="photo.photoName.label" default="Photo Name" /></label>
	<div class="controls">
		<g:textField name="photoName" value="${photoInstance?.photoName}"/>
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'photoName', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'photoCaption', 'error')} ">
	<label for="photoCaption" class="control-label"><g:message code="photo.photoCaption.label" default="Photo Caption" /></label>
	<div class="controls">
		<g:textArea name="photoCaption" value="${photoInstance?.photoCaption}"/>
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'photoCaption', 'error')}</span>
	</div>
</div>

