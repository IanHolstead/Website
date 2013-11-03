<%@ page import="ian.website.World" %>



<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'blogTitle', 'error')} ">
	<label for="blogTitle">
		<g:message code="world.blogTitle.label" default="Blog Title" />
		
	</label>
	<g:textField name="blogTitle" maxlength="100" value="${worldInstance?.blogTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'blogRestriction', 'error')} ">
	<label for="blogRestriction">
		<g:message code="world.blogRestriction.label" default="Blog Restriction" />
		
	</label>
	<g:select name="blogRestriction" from="${worldInstance.constraints.blogRestriction.inList}" value="${worldInstance?.blogRestriction}" valueMessagePrefix="world.blogRestriction" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'videoCaption', 'error')} ">
	<label for="videoCaption">
		<g:message code="world.videoCaption.label" default="Video Caption" />
		
	</label>
	<g:textField name="videoCaption" maxlength="250" value="${worldInstance?.videoCaption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'xkcd', 'error')} ">
	<label for="xkcd">
		<g:message code="world.xkcd.label" default="Xkcd" />
		
	</label>
	<g:field type="url" name="xkcd" value="${worldInstance?.xkcd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'xkcdCaption', 'error')} ">
	<label for="xkcdCaption">
		<g:message code="world.xkcdCaption.label" default="Xkcd Caption" />
		
	</label>
	<g:textField name="xkcdCaption" maxlength="250" value="${worldInstance?.xkcdCaption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'imgTitle', 'error')} ">
	<label for="imgTitle">
		<g:message code="world.imgTitle.label" default="Img Title" />
		
	</label>
	<g:textField name="imgTitle" maxlength="100" value="${worldInstance?.imgTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'imgCaption', 'error')} ">
	<label for="imgCaption">
		<g:message code="world.imgCaption.label" default="Img Caption" />
		
	</label>
	<g:textField name="imgCaption" maxlength="250" value="${worldInstance?.imgCaption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'blog', 'error')} ">
	<label for="blog">
		<g:message code="world.blog.label" default="Blog" />
		
	</label>
	<g:textField name="blog" value="${worldInstance?.blog}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: worldInstance, field: 'video', 'error')} ">
	<label for="video">
		<g:message code="world.video.label" default="Video" />
		
	</label>
	<g:textField name="video" value="${worldInstance?.video}"/>
</div>

