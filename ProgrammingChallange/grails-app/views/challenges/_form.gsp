<%@ page import="ian.programming.challenge.Challenges" %>



			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="challenges.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${challengesInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="challenges.description.label" default="Description" /></label>
				<div class="controls">
					<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${challengesInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'completionPoints', 'error')} required">
				<label for="completionPoints" class="control-label"><g:message code="challenges.completionPoints.label" default="Completion Points" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="completionPoints" min="1" required="" value="${challengesInstance.completionPoints}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'completionPoints', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'winningPoints', 'error')} required">
				<label for="winningPoints" class="control-label"><g:message code="challenges.winningPoints.label" default="Winning Points" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="winningPoints" required="" value="${challengesInstance.winningPoints}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'winningPoints', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'languageBonus', 'error')} ">
				<label for="languageBonus" class="control-label"><g:message code="challenges.languageBonus.label" default="Language Bonus" /></label>
				<div class="controls">
					<g:field type="number" name="languageBonus" value="${challengesInstance.languageBonus}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'languageBonus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'bonusPoints', 'error')} ">
				<label for="bonusPoints" class="control-label"><g:message code="challenges.bonusPoints.label" default="Bonus Points" /></label>
				<div class="controls">
					<g:field type="number" name="bonusPoints" value="${challengesInstance.bonusPoints}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'bonusPoints', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'bonusPointsDescription', 'error')} ">
				<label for="bonusPointsDescription" class="control-label"><g:message code="challenges.bonusPointsDescription.label" default="Bonus Points Description" /></label>
				<div class="controls">
					<g:textField name="bonusPointsDescription" maxlength="160" value="${challengesInstance?.bonusPointsDescription}"/>
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'bonusPointsDescription', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'startDate', 'error')} ">
				<label for="startDate" class="control-label"><g:message code="challenges.startDate.label" default="Start Date" /></label>
				<div class="controls">
					<bs:datePicker name="startDate" precision="day"  value="${challengesInstance?.startDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'startDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesInstance, field: 'endDate', 'error')} ">
				<label for="endDate" class="control-label"><g:message code="challenges.endDate.label" default="End Date" /></label>
				<div class="controls">
					<bs:datePicker name="endDate" precision="day"  value="${challengesInstance?.endDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: challengesInstance, field: 'endDate', 'error')}</span>
				</div>
			</div>

