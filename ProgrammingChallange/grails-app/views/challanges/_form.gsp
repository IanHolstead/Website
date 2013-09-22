<%@ page import="programmingchallange.Challanges" %>



<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="challanges.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${challangesInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="challanges.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${challangesInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'completionPoints', 'error')} required">
	<label for="completionPoints">
		<g:message code="challanges.completionPoints.label" default="Completion Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="completionPoints" type="number" min="1" value="${challangesInstance.completionPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'winningPoints', 'error')} required">
	<label for="winningPoints">
		<g:message code="challanges.winningPoints.label" default="Winning Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="winningPoints" type="number" value="${challangesInstance.winningPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'languageBonus', 'error')} ">
	<label for="languageBonus">
		<g:message code="challanges.languageBonus.label" default="Language Bonus" />
		
	</label>
	<g:field name="languageBonus" type="number" value="${challangesInstance.languageBonus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'bonusPoints', 'error')} ">
	<label for="bonusPoints">
		<g:message code="challanges.bonusPoints.label" default="Bonus Points" />
		
	</label>
	<g:field name="bonusPoints" type="number" value="${challangesInstance.bonusPoints}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'bonusPointsDescription', 'error')} ">
	<label for="bonusPointsDescription">
		<g:message code="challanges.bonusPointsDescription.label" default="Bonus Points Description" />
		
	</label>
	<g:textField name="bonusPointsDescription" maxlength="160" value="${challangesInstance?.bonusPointsDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="challanges.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${challangesInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: challangesInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="challanges.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${challangesInstance?.endDate}"  />
</div>

