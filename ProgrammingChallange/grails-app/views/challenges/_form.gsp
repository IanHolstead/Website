<%@ page import="programmingchallenge.web.Challenges" %>



<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="challenges.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${challengesInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="challenges.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${challengesInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'completionPoints', 'error')} required">
	<label for="completionPoints">
		<g:message code="challenges.completionPoints.label" default="Completion Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="completionPoints" type="number" min="1" value="${challengesInstance.completionPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'winningPoints', 'error')} required">
	<label for="winningPoints">
		<g:message code="challenges.winningPoints.label" default="Winning Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="winningPoints" type="number" value="${challengesInstance.winningPoints}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'languageBonus', 'error')} ">
	<label for="languageBonus">
		<g:message code="challenges.languageBonus.label" default="Language Bonus" />
		
	</label>
	<g:field name="languageBonus" type="number" value="${challengesInstance.languageBonus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'bonusPoints', 'error')} ">
	<label for="bonusPoints">
		<g:message code="challenges.bonusPoints.label" default="Bonus Points" />
		
	</label>
	<g:field name="bonusPoints" type="number" value="${challengesInstance.bonusPoints}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'bonusPointsDescription', 'error')} ">
	<label for="bonusPointsDescription">
		<g:message code="challenges.bonusPointsDescription.label" default="Bonus Points Description" />
		
	</label>
	<g:textField name="bonusPointsDescription" maxlength="160" value="${challengesInstance?.bonusPointsDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="challenges.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${challengesInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: challengesInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="challenges.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${challengesInstance?.endDate}"  />
</div>

