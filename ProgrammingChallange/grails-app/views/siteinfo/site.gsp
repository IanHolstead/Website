<html>

<head>
	<title><g:message code="site.title.label"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>
	<div style=" margin-bottom:20px;">
		<a class="small_title" href="/site/changelog" style="padding:0;">
			<g:message code="systeminfo.changelog.title" default="Changelog"/>
		</a>
	</div>
	
	<section id="application-site" class="site-info">
		<div class="accordion" id="accordion1">
			<div class="accordion-group" style="border:0px;">
				<div class="accordion-heading">
					<a class="accordion-toggle small_title" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne" style="padding:0px;">
						<g:message code="default.systeminfo.status"/> <b class="caret" style="vertical-align: middle;"></b>
					</a>
				</div>
				<div id="collapseOne" class="accordion-body collapse in">
					<div class="accordion-inner" style="border:0px; padding: 0px;">
						<ul style="margin-bottom: 0px;">
							<li>App version: <g:meta name="app.version"/></li>
							<li>Grails version: <g:meta name="app.grails.version"/></li>
							<li>Groovy version: ${GroovySystem.getVersion()}</li>
							<li>JVM version: ${System.getProperty('java.version')}</li>
							<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
							<li>Domains: ${grailsApplication.domainClasses.size()}</li>
							<li>Services: ${grailsApplication.serviceClasses.size()}</li>
							<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="intro-site" class="site-info">
		<div class="accordion" id="accordion2">
			<div class="accordion-group" style="border:0px;">
				<div class="accordion-heading">
					<a class="accordion-toggle small_title" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" style="padding:0px;">
						<g:message code="default.systeminfo.resources"/> <b class="caret" style="vertical-align: middle;"></b>
					</a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse in">
					<div class="accordion-inner" style="border:0px; padding: 0px;">
						<ul style="margin-bottom: 0px;">
							<li>Web Layout: <a href ="http://getbootstrap.com/">Bootstrap</a>, from Twitter 
					        	Licensed under the Apache License v2.0. Documentation licensed under CC BY 3.0. 
					        	(@TwBootstrap , http://getbootstrap.com/)</li>
					        <li>Datepicker: <a href ="https://github.com/eternicode/bootstrap-datepicker">Datepicker for Bootstrap</a>, 
					        	Copyright 2012 Stefan Petre, Improvements by Andrew Rowls, Licensed under the Apache License v2.0</li>
							<li>Flag Icons: <a href="http://www.famfamfam.com/lab/icons/flags/">FamFamFam Flag Icons</a> by Mark James. They are 
								<i>"available for free use for any purpose with no requirement for attribution"</i>.</li>
							<li>Icons from <a href="http://glyphicons.com">Glyphicons Free</a>, licensed under 
							<a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a></li>
							<li>SyntaxHighlighter: <a href ="http://alexgorbatchev.com/SyntaxHighlighter/">SyntaxHighighter</a> 
								used under the terms of the MIT License</li>
							<li>Image compression: <a href ="https://github.com/quirklabs/grails-hd-image-utils/blob/master/README.md">grails-hd-image-utils</a> 
								Licensed under the Apache License v2.0</li>
							<li>Claptrap Image: <a href ="http://ichrysi.deviantart.com/">deviantart</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="resources-site" class="site-info">
		<div class="accordion" id="accordion3">
			<div class="accordion-group" style="border:0px;">
				<div class="accordion-heading">
					<a class="accordion-toggle small_title" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree" style="padding:0px;">
						<g:message code="default.systeminfo.plugins"/> <b class="caret" style="vertical-align: middle;"></b>
					</a>
				</div>
				<div id="collapseThree" class="accordion-body collapse">
					<div class="accordion-inner" style="border:0px; padding: 0px;">
						<g:set var="pluginManager"
							value="${applicationContext.getBean('pluginManager')}"></g:set>
						<g:each var="plugin" in="${pluginManager.allPlugins.sort { it.name }}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="credit-site" class="site-info">
		<div class="accordion" id="accordion4">
			<div class="accordion-group" style="border:0px;">
				<div class="accordion-heading">
					<a class="accordion-toggle small_title" data-toggle="collapse" data-parent="#accordion4" href="#collapseFour" style="padding:0px;">
						<g:message code="site.acknowledgements.title"/> <b class="caret" style="vertical-align: middle;"></b>
					</a>
				</div>
				<div id="collapseFour" class="accordion-body collapse in">
					<div class="accordion-inner" style="border:0px; padding: 0px;">
						<ul style="margin-bottom: 0px;">
							<li><a href ="https://github.com/iryanclarke">Ian Clarke</a> For help with the some of the front end stuff
								including the photoAlbum show page and a number of the list pages.</li>
					        <li><a href ="https://twitter.com/Micle2000">Michael Shimokura</a> For help with the initial deployment.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="additional-site" class="site-info">
		<p class="small_title"><g:message code="site.disclaimer.label"/></p>
		<p>Information on this Web site may contain technical inaccuracies or typographical errors. 
		Information may be changed or updated without notice. 
		Ian may also make improvements and/or changes to any of the content at any time without notice. 
		Measures have been taken to protect all information on this site, however Ian cannot be held responsible for loss of personal information, if you have an account
		please use a unique password.
		For documents and software available from this server, the operator and author does not warrant or 
		assume any legal liability or responsibility for the accuracy, completeness, or usefulness of any information,
		apparatus, product, or process disclosed.
		</p>
	</section>

</body>

</html>
