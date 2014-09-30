<%@ page import="com.ianholstead.programmingChallenge.shopping.List" %>



			<div class="control-group fieldcontain ${hasErrors(bean: listInstance, field: 'date', 'error')} ">
				<label for="date" class="control-label"><g:message code="list.date.label" default="Date" /></label>
				<div class="controls">
					<bs:datePicker name="date" precision="day"  value="${listInstance?.date}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: listInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: listInstance, field: 'listItems', 'error')} ">
				<label for="listItems" class="control-label"><g:message code="list.listItems.label" default="List Items" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${listInstance?.listItems?}" var="l">
    <li><g:link controller="listItem" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="listItem" action="create" params="['list.id': listInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'listItem.label', default: 'ListItem')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: listInstance, field: 'listItems', 'error')}</span>
				</div>
			</div>

