
<%@ page import="com.ianholstead.website.Employment" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'employ.label')}" />
	<g:if env="development">
		<g:set var="url" value="http://localhost:8090/employ/"/>
	</g:if>
	<g:else>
		<g:set var="url" value="http://ianholstead.com/employ/"/>
	</g:else>
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<content tag="include.bottom">
		<script type="text/javascript">
			function copyToClipboard(text) {
				window.prompt("Copy to clipboard: Ctrl+C, Enter", text);
			}
		</script>
	</content>
</head>

<body>
	
<section id="list-employ" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="about" title="${message(code: 'employ.about.label')}" />
				<g:sortableColumn property="url" title="${message(code: 'employ.url.label')}" />
				<g:sortableColumn property="views" title="${message(code: 'employ.views.label')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${employmentInstanceList}" status="i" var="employmentInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="edit" id="${employmentInstance.id}">${employmentInstance.about}</g:link></td>
				<td><div onclick="copyToClipboard('${url+employmentInstance.url}')"><g:link url="#"><g:message code="employ.copy.label"/></g:link></div></td>
				<td><g:formatNumber number="${employmentInstance.views}"/></td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${employmentInstanceTotal}" />
	</div>
</section>

</body>
</html>
