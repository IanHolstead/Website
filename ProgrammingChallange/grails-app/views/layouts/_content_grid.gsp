<div id="Content" class="container">

<%--	<!-- Main menu in one line (e.g., controller entry points -->--%>
<%--	<sec:ifAnyGranted roles="ROLE_ADMIN">--%>
<%--		<div class="row">--%>
<%--			<div class="span12">--%>
<%--				<g:render template="/_menu/menubar"/>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</sec:ifAnyGranted>--%>
	
	<!-- Secondary menu in one line (e.g., actions for current controller) -->
	<sec:ifAnyGranted roles="ROLE_ADMIN">
	<div class="row">
		<div class="span12">
			<g:render template="/_menu/submenubar"/>														
		</div>
	</div>
	</sec:ifAnyGranted>

	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>

	<!-- Show page's content -->
	<g:layoutBody />
	<g:pageProperty name="page.body" />
</div>
