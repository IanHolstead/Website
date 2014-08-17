
<%@ page import="com.ianholstead.website.Employment" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'employ.label', default: 'Employ')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
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
				<td>${employmentInstance.about}</td>
				<td><g:link action="edit" id="${employmentInstance.id}">${fieldValue(bean: employmentInstance, field: "url")}</g:link></td>
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
