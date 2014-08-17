<%@ page import="com.ianholstead.website.Config" %>
<%@ page import="com.ianholstead.website.Employment" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<title><g:message code="employment.title"/></title>
</head>

<body>
<g:set var="config" value="${Config.get(1)}" />
<section id="address-contact">
	<div class="row">
		<div class="span4">
			<div>
				<g:if test="${employmentInstance.resume}">
					<div class="row">
						<span class="span1">
							<strong>Resume</strong>
						</span>
						<span class="span3">
							<g:link url="/resume/${employmentInstance.url}/ianholstead.pdf" class="btn btn-success btn-small" target="_blank">
								<i class="icon-download-alt icon-large"></i>
								${message(code: 'employ.download.label')}
							</g:link>
						</span>
					</div>
				</g:if>
				<g:if test="${employmentInstance.email}">
					<div class="row">
						<span class="span1">
							<strong>Email</strong>
						</span>
						<span class="span3">${config.employEmail}</span>
					</div>
				</g:if>
				<g:if test="${employmentInstance.phone}">
					<div class="row">
						<span class="span1">
							<strong>Phone</strong>
						</span>
						<span class="span3">${config.employPhone}</span>
					</div>
				</g:if>
				<div class="row">
					<span class="span1">
						<strong>LinkedIn</strong>
					</span>
					<span class="span3">${config.contactLinkedIn}</span>
				</div>
				<div class="row">
					<span class="span1">
						<strong>Skype</strong>
					</span>
					<span class="span3">${config.contactSkype}</span>
				</div>
			</div>
		</div>
	</div>
</section>

</body>

</html>
