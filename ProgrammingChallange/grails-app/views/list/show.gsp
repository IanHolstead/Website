
<%@ page import="com.ianholstead.programmingChallenge.shopping.List" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'list.label', default: 'List')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
<section id="list-show" class="first">
	<g:formRemote name="a" url="[controller:'list', action:'updateDate']"> 
		<bs:datePicker name="date" precision="day"  value="${listInstance?.date}" default="none" noSelection="['': '']" />
	</g:formRemote>
	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="status" title="${message(code: 'list.status.label')}"/>
				<g:sortableColumn property="item" title="${message(code: 'list.item.label')}"/>
				<g:sortableColumn property="quantity" title="${message(code: 'list.quantity.label')}"/>
				<g:sortableColumn property="category" title="${message(code: 'list.category.label')}"/>
				<g:sortableColumn property="notes" title="${message(code: 'list.notes.label')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${listItemInstanceList}" status="i" var="item">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${item.status}</td>
					<td>${item.item}</td>
					<td>${item.quantity}</td>
					<td>${item.category}</td>
					<td>${item.notes}</td>
				</tr>
			</g:each>
			<tr>
			<g:formRemote name="addItem" url="[controller:'list', action:'addItem']">
				<td></td>
				<td><g:field type="text" name="item"/></td>
				<td><g:field type="text" name="quantity"/></td>
				<td><g:field type="text" name="category"/></td>
				<td><g:field type="text" name="notes"/></td>
			</g:formRemote>
			</tr>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${listInstanceTotal?:10}" />
	</div>
</section>
</body>

</html>
