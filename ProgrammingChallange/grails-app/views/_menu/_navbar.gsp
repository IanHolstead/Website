<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse" style="margin: 0px">
	<div class="navbar-inner">
		<div class="container">
			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
			</a>

			<a class="brand" href="${createLink(uri: '/')}">
				<img class="logo" src="${resource(dir:'images',file:'icon.png')}" alt="${message(code:'home.label')}" />
				${message(code:'home.label')}
			</a>

       		<div class="nav-collapse">
       			<g:set var="controllerList" value="${['blog','photoAlbum']}"/>
       			<g:set var="controllerNameList" value="${['Blog', 'Photo Albums']}"/>
       			<g:set var="actionList" value="${['list','list']}"/>
       			<ul class="nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Browse <b class="caret"></b></a>
						<ul class="dropdown-menu">
		                    <g:each var="controller" in="${controllerList}" status="i">
		                    	<li class="controller"><g:link controller="${controller}" action="${actionList[i]}">${controllerNameList[i]}</g:link></li>
		                    </g:each>
		                    <li class=""><a href="${createLink(uri: '/about')}"><g:message code="menu.about.label"/></a></li>
							<li class=""><a href="${createLink(uri: '/contact')}"><g:message code="menu.contact.label"/></a></li>
							<li class="divider"></li>
							<li class=""><a href="${createLink(uri: '/site')}"><g:message code="menu.site.info.label"/></a></li>
						</ul>
					</li>
				</ul>

	  			<div class="pull-left">
					<%--Left-side entries--%>
	  			</div>

	  			<div class="pull-right">
	  				<!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
					<%--Right-side entries--%>
					<%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
					<%--<g:render template="/_menu/language"/>--%>
					<%--<g:render template="/_menu/config"/>--%>
					<g:render template="/_menu/user"/>
<%--					<g:render template="/_menu/info"/>	--%>
					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<g:render template="/_menu/admin"/>
					</sec:ifAnyGranted>
					<%--<g:render template="/_menu/search"/> --%>
	  			</div>

			</div>
			
		</div>
	</div>
</div>
