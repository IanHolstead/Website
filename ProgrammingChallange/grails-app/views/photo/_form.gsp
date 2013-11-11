<%@ page import="ian.website.Photo" %>



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
					<g:textField name="photoCaption" value="${photoInstance?.photoCaption}"/>
					<span class="help-inline">${hasErrors(bean: photoInstance, field: 'photoCaption', 'error')}</span>
				</div>
			</div>

