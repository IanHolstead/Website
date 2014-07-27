
<%@ page import="com.ianholstead.website.Upload" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'upload.label', default: 'Upload')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-upload" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="link" title="${message(code: 'upload.link.label', default: 'Link')}" />
				<g:sortableColumn property="fileName" title="${message(code: 'upload.fileName.label', default: 'File Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${uploadInstanceList}" status="i" var="uploadInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${uploadInstance.id}">${uploadInstance.link}</g:link></td>
				<td><g:link action="show" id="${uploadInstance.id}">${uploadInstance.fileName}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${uploadInstanceTotal}" />
	</div>
</section>

</body>

</html>
