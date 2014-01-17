<ul class="nav pull-right" id="menu-no-show-mobile">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="icon-cog icon-large icon-white"></i>
		</a>
		<ul class="dropdown-menu">
			<li class="controller">
				<a tabindex="-1" href="#"><b>Visual Style</b></a>
			</li>
			<li class="dropdown-submenu">
				<a href="#" class="dropdown-toggle">
					<span class="js-current-language">${message(code: 'default.skin.label', default: 'Skin')}</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-dark">
					<li>
						<a title="Original" href="${request.forwardURI+'?skin=bootstrap'}">
							<g:message code="default.skin.original.label" default="Bright (Original)"/>
						</a>
					</li>
					<li>
						<a title="Skin A"    href="${request.forwardURI+'?skin=bootstrap_skinA'}">
							<g:message code="default.skin.skinA.label"    default="Dark (Cyborg)"/>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</li>
</ul>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="config"><g:message code="user.config.label" default="Config"/></g:link>
	</li>
</ul>
</noscript>
