
<%@ page import="com.ianholstead.website.World" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${worldInstance.title}" />
	<title>${entityName}</title>
	
</head>

<body>
<section id="show-world" class="first">
	<div class="cont-nav">
		<div class="left">
			<g:link controller="world" action="show" id="${prev.getUrl()}">
				<span class="icon-chevron-left"></span> <g:message code="default.paginate.prev"/>
			</g:link>
		</div>
		
		<div class="center">
			<g:link controller="world" action="list">
				<span class="icon-th-list"></span> <g:message code="default.archive.label" args="${[message(code: 'world.label')]}"/>
			</g:link>
		</div>
		
		<div class="right">
			<g:link controller="world" action="show" id="${next.getUrl()}">
				<g:message code="default.paginate.next"/> <span class="icon-chevron-right"></span>
			</g:link>
		</div>
	</div>
	
	<div class="blog">
		<div class="blogTitle"><h1>${blogInstance.blogTitle}</h1></div>
		<div class="blogContent"><p>${blogInstance.blogContent}<p></div>
	</div>

	<hr/>
	
	<div class="photo">
		<div class="photoTitle">
			<div class="center"><h3>${photoInstance.photoName}</h3></div>
		</div>
		<div class="photoThumb">
			<div class="center">
				<img src="/showPhoto/${photoInstance.getUrl()}.png" alt="${photoInstance.photoCaption}"/>
			</div>
		</div>
		<div class="photoDescription">
			<div class="center"><p>${photoInstance.photoCaption}</p></div>
		</div>
	</div>
	
	<hr/>
	
	<div class="video">
		<div class="center videoThumb">
			<iframe class="iVideo" width="420" height="315" src="${worldInstance.video}" frameborder="0" allowfullscreen></iframe>
		</div>
		<div class="videoCaption">
			<div class="center"><p>${worldInstance.videoCaption}</p></div>
		</div>
	</div>
	
	<hr/>

	<div class="XKCD">
		<div class="XKCDthumb">
			<div class="center"><img class="XKCD" src="${worldInstance.xkcd}"/></div>
		</div>
		<div class="XKCDcaption">
			<div class="center"><p>${worldInstance.xkcdCaption}</p></div>
		</div>
	</div>
	
	<div class="cont-nav">
		<div class="left">
			<g:link controller="world" action="show" id="${prev.getUrl()}">
				<span class="icon-chevron-left"></span> <g:message code="default.paginate.prev"/>
			</g:link>
		</div>
		
		<div class="center">
			<g:link controller="world" action="list">
				<span class="icon-th-list"></span> <g:message code="default.archive.label" args="${[message(code: 'world.label')]}"/>
			</g:link>
		</div>
		
		<div class="right">
			<g:link controller="world" action="show" id="${next.getUrl()}">
				<g:message code="default.paginate.next"/> <span class="icon-chevron-right"></span>
			</g:link>
		</div>
	</div>
</section>

<content tag="include.bottom">
	<!-- Include required JS files  and brushes for Syntax Highlighter-->
	<link href="${resource(dir: 'css/sh', file: 'shCore.css')}" rel="stylesheet" type="text/css" />
	<link href="${resource(dir: 'css/sh', file: 'shThemeDefault.css')}" rel="stylesheet" type="text/css" />
	<g:javascript src="sh/shCore.js" />
	<g:javascript src="sh/shBrushGroovy.js" />
	<g:javascript src="sh/shBrushCSharp.js" />
	<g:javascript src="sh/shBrushCpp.js" />
	<g:javascript src="sh/shBrushJava.js" />
	<g:javascript src="sh/shBrushPlain.js" />
	<script type="text/javascript">
    	SyntaxHighlighter.all()
	</script>	
</content>

</body>

</html>
