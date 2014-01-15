<html>

<head>
	<title><g:message code="site.title.label"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro-site">
		<h1><g:message code="site.tech.label"/></h1>
		<p>This site is powered by <a href="http://grails.org/">grails</a> ${meta(name:'app.grails.version')}.</p>
		<p>Designed and built using Twitter's <a href="http://twitter.github.com/bootstrap/" target="_blank">Bootstrap</a>. 
			Code licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>. 
			Documentation licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.
			Icons from <a href="http://glyphicons.com">Glyphicons Free</a>, licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
	</section>

	<section id="application-site">
	     <p class="small_title"><g:message code="default.systeminfo.status"/></p>
	     <ul>
			<li>App version: <g:meta name="app.version"/></li>
			<li>Grails version: <g:meta name="app.grails.version"/></li>
			<li>Groovy version: ${GroovySystem.getVersion()}</li>
			<li>JVM version: ${System.getProperty('java.version')}</li>
			<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
			<li>Domains: ${grailsApplication.domainClasses.size()}</li>
			<li>Services: ${grailsApplication.serviceClasses.size()}</li>
			<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
	     </ul>
	</section>
	
	<section id="resources-site">
	     <p class="small_title"><g:message code="default.systeminfo.plugins"/></p>
	     <ul>
	         <g:set var="pluginManager"
	                value="${applicationContext.getBean('pluginManager')}"></g:set>
	
	         <g:each var="plugin" in="${pluginManager.allPlugins.sort { it.name }}">
	             <li>${plugin.name} - ${plugin.version}</li>
	         </g:each>
	
	     </ul>
	</section>

	<section id="additional-site">
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
