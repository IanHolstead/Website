<%@ page import="com.ianholstead.website.Config" %>
<html>

<g:set var="config" value="${Config.get(1)}"/>

<head>
	<title><g:message code="default.contact.title"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro-contact">
		<p class="lead">${config.contactInfo}</p>
	</section>

	<section id="address-contact">
	<div class="row">
		<div class="span4">
			<h1><g:message code="contact.address.title" default="Current City"/></h1>
				<address>
					 ${config.contactCity}<br>
					 <br>
				</address>
				<div>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Email">Email</abbr></strong>
						</span>
						<span class="span3">${config.contactEmail}</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong>Facebook</strong>
						</span>
						<span class="span3">${config.contactFacebook}</span>
					</div>
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
			
			<div class="span8 map">
				<iframe width="100%" scrolling="no" height="300" frameborder="0" 
					src="${config.contactMapUrl}"
		 			marginwidth="0" marginheight="0"></iframe>
			</div>
		</div>
	</section>

</body>

</html>
