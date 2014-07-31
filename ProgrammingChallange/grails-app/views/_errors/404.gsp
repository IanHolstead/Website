<html>
	<head>
		<title><g:message code="site.404.long.title"/></title>
		<meta name="layout" content="kickstart" />
	</head>

	<body>
		<content tag="header">
			<!-- Empty Header -->
		</content>
		
	  	<section id="Error" class="">
			<div class="big-message">
				<div class="container">
					<h1 style="margin-bottom: 5px;"><g:message code="site.404.title"/></h1>
					<h2><g:message code="site.404.oh.noes.message"/></h2>
					<p>
						<g:message code="site.404.clap.message"/> <span style="font-size: 10px;"><g:message code="site.404.worry.message"/></span>
					</p>
					<g:img alt="Claptrap" dir="images/info" file="claptrap.png" />
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