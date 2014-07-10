<%@ page import="ian.website.Blog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${blogInstance.blogTitle}" />
	<title>${entityName}</title>
</head>

<body>
<sec:ifAllGranted roles="ROLE_ADMIN">
	<g:if test="${blogInstance.secureUrl}">
		<g:link controller="blog" action="showPastSecurity" id="${blogInstance.secureUrl}">Link for sharing</g:link>
	</g:if>
</sec:ifAllGranted>
<section id="show-blog" class="first">
	<div class="content">${blogInstance.blogContent}</div>
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
