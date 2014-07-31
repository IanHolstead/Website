<%@ page import="com.ianholstead.website.Config" %>
<html>

<head>
	<title><g:message code="default.contact.title"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro-contact">
		<p class="lead">${Config.get(1).contactInfo}</p>
	</section>

	<section id="address-contact">
	<div class="row">
		<div class="span4">
			<h1><g:message code="contact.address.title" default="Current City"/></h1>
				<address>
					 ${Config.get(1).contactCity}<br>
					 <br>
				</address>
				<div>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Email">Email</abbr></strong>
						</span>
						<span class="span3">${Config.get(1).contactEmail}</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong>Facebook</strong>
						</span>
						<span class="span3">${Config.get(1).contactFacebook}</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong>LinkedIn</strong>
						</span>
						<span class="span3">${Config.get(1).contactLinkedIn}</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong>Skype</strong>
						</span>
						<span class="span3">${Config.get(1).contactSkype}</span>
					</div>
				</div>
			</div>
			
			<div class="span8 map">
				<iframe width="100%" scrolling="no" height="300" frameborder="0" 
					src="${Config.get(1).contactMapUrl}"
		 			marginwidth="0" marginheight="0"></iframe>
			</div>
		</div>
	</section>

</body>

</html>
