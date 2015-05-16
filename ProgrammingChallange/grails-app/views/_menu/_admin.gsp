<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="default.admin.label"/><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class=""><g:link url="/config"><g:message code="config.label"/></g:link></li>
			<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
				<li class=""><g:link url="/employment/list"><g:message code="employ.label"/></g:link></li>
			</sec:ifAnyGranted>
		</ul>
	</li>
</ul>
