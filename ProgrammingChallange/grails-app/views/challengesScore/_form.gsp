<%@ page import="programmingchallenge.web.ChallengesScore" %>



<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'bonus', 'error')} ">
	<label for="bonus">
		<g:message code="challengesScore.bonus.label" default="Bonus" />
		
	</label>
	<g:checkBox name="bonus" value="${challengesScoreInstance?.bonus}" />
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'challange', 'error')} required">
	<label for="challange">
		<g:message code="challengesScore.challange.label" default="Challange" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="challange" name="challange.id" from="${programmingchallenge.web.Challenges.list()}" optionKey="id" required="" value="${challengesScoreInstance?.challange?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'completed', 'error')} ">
	<label for="completed">
		<g:message code="challengesScore.completed.label" default="Completed" />
		
	</label>
	<g:checkBox name="completed" value="${challengesScoreInstance?.completed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'languageBonus', 'error')} ">
	<label for="languageBonus">
		<g:message code="challengesScore.languageBonus.label" default="Language Bonus" />
		
	</label>
	<g:checkBox name="languageBonus" value="${challengesScoreInstance?.languageBonus}" />
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="challengesScore.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" value="${challengesScoreInstance.points}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="challengesScore.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${programmingchallenge.web.UserProfile.list()}" optionKey="id" required="" value="${challengesScoreInstance?.profile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'winning', 'error')} ">
	<label for="winning">
		<g:message code="challengesScore.winning.label" default="Winning" />
		
	</label>
	<g:checkBox name="winning" value="${challengesScoreInstance?.winning}" />
</div>

