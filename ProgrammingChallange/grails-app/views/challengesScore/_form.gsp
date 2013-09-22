<%@ page import="programmingchallange.ChallengesScore" %>



<div class="fieldcontain ${hasErrors(bean: challengesScoreInstance, field: 'challange', 'error')} required">
	<label for="challange">
		<g:message code="challengesScore.challange.label" default="Challange" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="challange" name="challange.id" from="${programmingchallange.Challanges.list()}" optionKey="id" required="" value="${challengesScoreInstance?.challange?.id}" class="many-to-one"/>
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
	<g:select id="profile" name="profile.id" from="${programmingchallange.UserProfile.list()}" optionKey="id" required="" value="${challengesScoreInstance?.profile?.id}" class="many-to-one"/>
</div>

