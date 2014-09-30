
<%@ page import="com.ianholstead.programmingChallenge.shopping.List" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'list.label', default: 'List')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-list" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="date" title="${message(code: 'list.date.label', default: 'Date')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${listInstanceList}" status="i" var="listInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${listInstance.id}">${fieldValue(bean: listInstance, field: "date")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${listInstanceTotal}" />
	</div>
</section>

</body>

</html>
