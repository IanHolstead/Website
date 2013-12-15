<%@ page import="ian.website.PhotoAlbum" %>



			<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="photoAlbum.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${photoAlbumInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: photoAlbumInstance, field: 'photos', 'error')} ">
				<label for="photos" class="control-label"><g:message code="photoAlbum.photos.label" default="Photos" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${photoAlbumInstance?.photos?}" var="p">
    <li><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="photo" action="create" params="['photoAlbum.id': photoAlbumInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: photoAlbumInstance, field: 'photos', 'error')}</span>
				</div>
			</div>

