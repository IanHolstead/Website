<%@ page import="ian.website.World" %>



			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'blogTitle', 'error')} ">
				<label for="blogTitle" class="control-label"><g:message code="world.blogTitle.label" default="Blog Title" /></label>
				<div class="controls">
					<g:textField name="blogTitle" maxlength="100" value="${worldInstance?.blogTitle}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'blogTitle', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'blogRestriction', 'error')} ">
				<label for="blogRestriction" class="control-label"><g:message code="world.blogRestriction.label" default="Blog Restriction" /></label>
				<div class="controls">
					<g:select name="blogRestriction" from="${worldInstance.constraints.blogRestriction.inList}" value="${worldInstance?.blogRestriction}" valueMessagePrefix="world.blogRestriction" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'blogRestriction', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'videoCaption', 'error')} ">
				<label for="videoCaption" class="control-label"><g:message code="world.videoCaption.label" default="Video Caption" /></label>
				<div class="controls">
					<g:textField name="videoCaption" maxlength="250" value="${worldInstance?.videoCaption}"/>
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
					<g:textField name="xkcdCaption" maxlength="250" value="${worldInstance?.xkcdCaption}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'xkcdCaption', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'imgTitle', 'error')} ">
				<label for="imgTitle" class="control-label"><g:message code="world.imgTitle.label" default="Img Title" /></label>
				<div class="controls">
					<g:textField name="imgTitle" maxlength="100" value="${worldInstance?.imgTitle}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'imgTitle', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'imgCaption', 'error')} ">
				<label for="imgCaption" class="control-label"><g:message code="world.imgCaption.label" default="Img Caption" /></label>
				<div class="controls">
					<g:textField name="imgCaption" maxlength="250" value="${worldInstance?.imgCaption}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'imgCaption', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'blog', 'error')} ">
				<label for="blog" class="control-label"><g:message code="world.blog.label" default="Blog" /></label>
				<div class="controls">
					<g:textField name="blog" value="${worldInstance?.blog}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'blog', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: worldInstance, field: 'video', 'error')} ">
				<label for="video" class="control-label"><g:message code="world.video.label" default="Video" /></label>
				<div class="controls">
					<g:textField name="video" value="${worldInstance?.video}"/>
					<span class="help-inline">${hasErrors(bean: worldInstance, field: 'video', 'error')}</span>
				</div>
			</div>

