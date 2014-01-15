<%@ page import="ian.website.PhotoAlbum" %>

<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message code="photoAlbum.name.label" default="Name" /></label>
	<div class="controls">
		<g:textField name="name" value="${photoAlbumInstance?.name}"/>
		<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')}</span>
	</div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'summary', 'error')} ">
	<label for="summary" class="control-label"><g:message code="photoAlbum.summary.label" default="Summary" /></label>
	<div class="controls">
		<g:textArea name="summary" value="${photoAlbumInstance?.summary}"/>
		<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'summary', 'error')}</span>
	</div>
</div>