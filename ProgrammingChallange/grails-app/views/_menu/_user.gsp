<ul class="nav pull-right">
	<li class="dropdown dropdown-btn">
<sec:ifNotLoggedIn>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
			<g:message code="security.signin.label"/><b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<form method="POST" action="${resource(file: 'j_spring_security_check')}">
					<input style="margin-bottom: 15px;" type="text" placeholder="Username" id="username" name="j_username">
					<div><input style="margin-bottom: 15px;" type="password" placeholder="Password" id="password" name="j_password"></div>
					<input style="float: left; margin-right: 10px;" type="checkbox" name='${rememberMeParameter}' id="remember-me" <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<label class="string optional" for="user_remember_me"> Remember me</label>
					<g:submitButton name="login" value="Sign In" class="btn btn-primary btn-block" id="sign-in"/>
				</form>
			</li>
<%--			<li class="divider"></li>--%>
<%--			<li class="button-container">--%>
<%--				<!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->--%>
<%--				<g:render template="/_common/modals/registerTextLink"/>--%>
<%--			</li>--%>
		</ul>

</sec:ifNotLoggedIn>
<sec:ifLoggedIn>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
			<!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
			<i class="icon-user icon-large icon-white"></i>
			<sec:username/> <b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu">
			<sec:ifAnyGranted roles="ROLE_SUPER_USER">
				<li class=""><g:link controller="user" action="show">
					<i class="icon-user"></i>
					<g:message code="user.show.label"/>
				</g:link></li>
				<li class="divider"></li>
			</sec:ifAnyGranted>
			<li class=""><a href="${createLink(uri: '/logout/index')}">
				<i class="icon-off"></i>
				<g:message code="security.signoff.label"/>
			</a></li>
		</ul>

</sec:ifLoggedIn>
	</li>
</ul>

<%--<noscript>--%>
<%--<ul class="nav pull-right">--%>
<%--	<li class="">--%>
<%--		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>--%>
<%--	</li>--%>
<%--</ul>--%>
<%--</noscript>--%>
