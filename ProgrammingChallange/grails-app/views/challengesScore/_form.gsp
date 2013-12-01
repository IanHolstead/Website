<%@ page import="ian.programming.challenge.ChallengesScore" %>



			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'bonus', 'error')} ">
				<label for="bonus" class="control-label"><g:message code="challengesScore.bonus.label" default="Bonus" /></label>
				<div class="controls">
					<bs:checkBox name="bonus" value="${challengesScoreInstance?.bonus}" />
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'bonus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'challenge', 'error')} ">
				<label for="challenge" class="control-label"><g:message code="challengesScore.challenge.label" default="Challenge" /></label>
				<div class="controls">
					<g:select id="challenge" name="challenge.id" from="${ian.programming.challenge.Challenges.list()}" optionKey="id" value="${challengesScoreInstance?.challenge?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'challenge', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'completed', 'error')} ">
				<label for="completed" class="control-label"><g:message code="challengesScore.completed.label" default="Completed" /></label>
				<div class="controls">
					<bs:checkBox name="completed" value="${challengesScoreInstance?.completed}" />
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'completed', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'languageBonus', 'error')} ">
				<label for="languageBonus" class="control-label"><g:message code="challengesScore.languageBonus.label" default="Language Bonus" /></label>
				<div class="controls">
					<bs:checkBox name="languageBonus" value="${challengesScoreInstance?.languageBonus}" />
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'languageBonus', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'points', 'error')} ">
				<label for="points" class="control-label"><g:message code="challengesScore.points.label" default="Points" /></label>
				<div class="controls">
					<g:field type="number" name="points" value="${challengesScoreInstance.points}"/>
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'points', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'profile', 'error')} ">
				<label for="profile" class="control-label"><g:message code="challengesScore.profile.label" default="Profile" /></label>
				<div class="controls">
					<g:select id="profile" name="profile.id" from="${ian.programming.challenge.UserProfile.list()}" optionKey="id" value="${challengesScoreInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'profile', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'winning', 'error')} ">
				<label for="winning" class="control-label"><g:message code="challengesScore.winning.label" default="Winning" /></label>
				<div class="controls">
					<bs:checkBox name="winning" value="${challengesScoreInstance?.winning}" />
					<span class="help-inline">${hasErrors(bean: challengesScoreInstance, field: 'winning', 'error')}</span>
				</div>
			</div>

