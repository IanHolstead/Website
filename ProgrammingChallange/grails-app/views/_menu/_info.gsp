<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" href="#"><g:message code="default.info.label"/> <b class="caret"></b></a>
		<ul class="dropdown-menu">
		
			<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
			<li class=""><a href="${createLink(uri: '/about')}"><g:message code="menu.about.label"/></a></li>
			<li class=""><a href="${createLink(uri: '/contact')}"><g:message code="menu.contact.label"/></a></li>
			
			<li class="divider"></li>
			<li class=""><a href="${createLink(uri: '/site')}"><i><g:message code="menu.site.info.label"/></i></a></li>
						
<%--			<li class="divider"></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/imprint')}">Imprint</a></li>--%>
<%--			<li class=""><a href="${createLink(uri: '/terms')}"><i>Terms of Use</i></a></li>--%>
		</ul>
	</li>
</ul>
