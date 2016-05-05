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
<section id="employ">
	<div class="row">
		<div class="span6">
			<div>
				<g:if test="${employmentInstance.resume}">
					<div class="row download">
						<span class="span1 download-title">
							<strong>Resume</strong>
						</span>
						<span class="span2">
							<g:link url="/resume/${employmentInstance.url}/ianholstead.pdf" class="btn btn-success btn-small" target="_blank">
								<i class="icon-download-alt icon-large"></i>
								${message(code: 'employ.download.label')}
							</g:link>
						</span>
					</div>
				</g:if>
				<g:if test="${employmentInstance.games}">
					<g:if test="${configInstance.borderlandsDemakeDownload||configInstance.borderlandsDemakeOnline}">
						<div class="row download">
							<span class="span1">
								<strong>Borderlands 2 Demake</strong>
							</span>
							<span class="span4 download">
							<g:if test="${configInstance.borderlandsDemakeDownload}">
								<g:link url="/games/${employmentInstance.url}/BorderlandsDemake/download" class="btn btn-success btn-small">
									<i class="icon-download-alt icon-large"></i>
									${message(code: 'employ.download.label')}
								</g:link>
								<span style="margin-left:10px">
								</span>
								</g:if>
								<g:if test="${configInstance.borderlandsDemakeOnline}">
									<g:link url="/games/${employmentInstance.url}/BorderlandsDemake/play" class="btn btn-primary btn-small" target="_blank">
										<i class="icon-file icon-large"></i>
										${message(code: 'employ.play.label')}
									</g:link>
								</g:if>
							</span>
						</div>
					</g:if>
					<g:if test="${configInstance.shotsInTheDarkDownload||configInstance.shotsInTheDarkOnline}">
						<div class="row">
							<span class="span1">
								<strong>Shots in the Dark</strong>
							</span>
							<span class="span3 download">
								<g:if test="${configInstance.shotsInTheDarkDownload}">
									<g:link url="/games/${employmentInstance.url}/ShotsInTheDark/download" class="btn btn-success btn-small">
										<i class="icon-download-alt icon-large"></i>
										${message(code: 'employ.download.label')}
									</g:link>
								</g:if>
								<span style="margin-left:10px">
								</span>
								<g:if test="${configInstance.shotsInTheDarkOnline}">
									<g:link url="/games/${employmentInstance.url}/ShotsInTheDark/play" class="btn btn-primary btn-small" target="_blank">
										<i class="icon-file icon-large"></i>
										${message(code: 'employ.play.label')}
									</g:link>
								</g:if>
							</span>
						</div>
					</g:if>
				</g:if>
				<g:if test="${employmentInstance.email}">
					<div class="row">
						<span class="span1">
							<strong>Email</strong>
						</span>
						<span class="span3">${configInstance.employEmail}</span>
					</div>
				</g:if>
				<g:if test="${employmentInstance.phone}">
					<div class="row">
						<span class="span1">
							<strong>Phone</strong>
						</span>
						<span class="span3">${configInstance.employPhone}</span>
					</div>
				</g:if>
				<g:if test="${employmentInstance.other}">
					<div class="row">
						<span class="span1">
							<strong>LinkedIn</strong>
						</span>
						<span class="span3">${configInstance.contactLinkedIn}</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong>Skype</strong>
						</span>
						<span class="span3">${configInstance.contactSkype}</span>
					</div>
				</g:if>
			</div>
		</div>
	</div>
</section>

</body>

</html>
