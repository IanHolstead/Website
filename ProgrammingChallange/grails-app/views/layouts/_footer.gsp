<%@ page import="com.ianholstead.website.Config" %>
<footer class="footer" style="min-width:0px">
	<div class="container">
		<div class="indent-body">
			<div class="row">
				<div class="span2">
					<h4>Content</h4>
					<ul class="unstyled">
						<li>
							<a href="${createLink(uri: '/blog')}">Blag</a>
						</li>
						<li>
							<a href="${createLink(uri: '/photoAlbum')}">Photo Albums</a>
						</li>
					</ul>
				</div>
				<div class="span2">
					<h4>Info</h4>
					<ul class="unstyled">
						<li><a href="${createLink(uri: '/about')}"><g:message code="default.about.label"/></a></li>
						<li><a href="${createLink(uri: '/contact')}"><g:message code="default.contact.label"/></a></li>
						<li><a href="${createLink(uri: '/site')}">Site Info</a></li>
					</ul>
				</div>
				<div class="span8" style="width: inherit;">
					<h4> About </h4>
					<p>${Config.get(1).footerAboutInfo}</p>
					<span style="color:#EEEEEE;">Oel ngati kameie.</span>
				</div>
			</div>
		
			<p class="pull-right"><a href="#">Back to top</a></p>
		</div>
	</div>
</footer>
