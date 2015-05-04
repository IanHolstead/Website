<%@ page import="com.ianholstead.website.Blog" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${blogInstance.blogTitle}" />
	<title>${entityName}</title>
</head>

<body>
<section id="show-blog" class="first">
	<g:if test="${!noNav}">
		<div class="cont-nav">
			<div class="left">
				<g:link controller="blog" action="show" id="${prev.getUrl()}">
					<span class="icon-chevron-left"></span> <g:message code="default.paginate.prev"/>
				</g:link>
			</div>
			
			<div class="center">
				<g:link controller="blog" action="list">
					<span class="icon-th-list"></span> <g:message code="default.archive.label" args="${[message(code: 'blog.label')]}"/>
				</g:link>
			</div>
			
			<div class="right">
				<g:link controller="blog" action="show" id="${next.getUrl()}">
					<g:message code="default.paginate.next"/> <span class="icon-chevron-right"></span>
				</g:link>
			</div>
		</div>
	</g:if>
	<sec:ifAllGranted roles="ROLE_ADMIN">
		<g:if test="${blogInstance.secureUrl}">
			(<g:link controller="blog" action="showPastSecurity" id="${blogInstance.secureUrl}"><g:message code="linkForSharing.label"/></g:link>)
		</g:if>
	</sec:ifAllGranted>
	<div class="content">${blogInstance.blogContent}</div>
	
	<g:if test="${!noNav}">
		<div class="cont-nav">
			<div class="left">
				<g:link controller="blog" action="show" id="${prev.getUrl()}">
					<span class="icon-chevron-left"></span> <g:message code="default.paginate.prev"/>
				</g:link>
			</div>
			
			<div class="center">
				<g:link controller="blog" action="list">
					<span class="icon-th-list"></span> <g:message code="default.archive.label" args="${[message(code: 'blog.label')]}"/>
				</g:link>
			</div>
			
			<div class="right">
				<g:link controller="blog" action="show" id="${next.getUrl()}">
					<g:message code="default.paginate.next"/> <span class="icon-chevron-right"></span>
				</g:link>
			</div>
		</div>
	</g:if>
</section>

<content tag="include.bottom">
	<!-- Include required JS files  and brushes for Syntax Highlighter-->
	<r:require modules="syntaxHighlighter"/>
	<r:script>
		SyntaxHighlighter.all()
	</r:script>
</content>

</body>

</html>
