<html>
	<head>
		<title><g:message code="site.no.bad.url.message"/></title>
		<meta name="layout" content="kickstart" />
	</head>

	<body>
		<content tag="header">
			<!-- Empty Header -->
		</content>
		
	  	<section id="Error" class="">
			<div class="big-message">
				<div class="container">
					<h1 style="margin-bottom: 5px;"><g:message code="site.no.bad.url.message"/></h1>
					<h2><g:message code="site.no.employ.message"/></h2>
					<p><g:message code="site.no.contact.message"/><g:link url="/contact"><g:message code="site.no.here.message"/></g:link></p>
					<div class="actions">
						<a href="javascript:history.go(-1)" class="btn btn-large btn-primary">
							<i class="icon-chevron-left icon-white"></i>
							<g:message code="default.button.back.label"/>
						</a>
						<a href="/" class="btn btn-large btn-success">
							<i class="icon-home"></i>
							<g:message code="default.button.home.label"/>
						</a>					
					</div>
				</div>
			</div>
		</section>
  	</body>
</html>