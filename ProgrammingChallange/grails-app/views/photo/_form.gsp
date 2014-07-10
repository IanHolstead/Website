<%@ page import="ian.website.Photo" %>
<%@ page import="ian.website.PhotoAlbum" %>


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

<g:set var="photoAlbumList" value="${PhotoAlbum.list().collect{it.toString()}}"/>
<g:if test="${photoInstance?.album.toString() != "World" }">
	<g:set var="ignore" value="${photoAlbumList.remove(PhotoAlbum.findByName("World"))}"/>
</g:if>

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'album', 'error')} ">
	<label for="album" class="control-label"><g:message code="photo.album.label" default="Album" /></label>
	<div class="controls">
		<g:select  name="album" from="${photoAlbumList}" value="${photoInstance?.album.toString()}"/>
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'album', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'showOnHomePage', 'error')} ">
	<label for="showOnHomePage" class="control-label"><g:message code="photo.showOnHomePage.label" default="Show on home page?" /></label>
	<div class="controls">
		<bs:checkBox name="showOnHomePage" value="${photoInstance?.showOnHomePage}" />
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'showOnHomePage', 'error')}</span>
	</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'secureUrl', 'error')} ">
	<label for="secureUrl" class="control-label"><g:message code="photo.secureUrl.label" default="Bypass security?" /></label>
	<div class="controls">
		<bs:checkBox name="secureUrl" value="${photoInstance?.secureUrl}" />
		<span class="help-inline">${hasErrors(bean: photoInstance, field: 'secureUrl', 'error')}</span>
	</div>
</div>
