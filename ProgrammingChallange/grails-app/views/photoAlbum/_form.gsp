<%@ page import="com.ianholstead.website.PhotoAlbum" %>
<%@ page import="com.ianholstead.security.Role" %>

<g:set var="roleList" value="${Role.list()}"/>
<g:set var="roleNumber" value="${(int)photoAlbumInstance?.authenticationLevel ? photoAlbumInstance.authenticationLevel.id-1 : 6}"/>

<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message code="photoAlbum.name.label"/></label>
	<div class="controls">
		<g:textField name="name" value="${photoAlbumInstance?.name}"/>
		<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')}</span>
	</div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'summary', 'error')} ">
	<label for="summary" class="control-label"><g:message code="photoAlbum.summary.label"/></label>
	<div class="controls">
		<g:textArea name="summary" value="${photoAlbumInstance?.summary}"/>
		<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'summary', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'photoAlbumAuthentication', 'error')} ">
	<label for="authenticationLevel" class="control-label"><g:message code="authenticationLevel.label"/></label>
	<div class="controls">
		<g:select name="authenticationLevel" from="${roleList.reverse()}" value="${roleList[roleNumber]}"/>
		<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'authenticationLevel', 'error')}</span>
	</div>
</div>