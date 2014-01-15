<%@ page import="ian.website.World" %>
<%@ page import="ian.website.Photo" %>
<%@ page import="java.util.Random" %>
<html>

<head>
	<title><g:message code="home.title"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>
	<section id="intro" class="first">
		<h1>Welcome!</h1>
		<p>Hello World! This is my (Ian Holstead's) personal website where I will do my best to post stuff (photos, blog, etc) regularly.
		This site is still under development so hopefully whenever you check back there will cool new functionality. Thanks!</p>
<%--		<h2>About me (tl;dr)</h2>--%>
<%--		<p>Oel ngati kameie.</p>--%>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
	    	<g:set var="currentWorld" value="${World.findByStatus(1)}"/>
		    	<g:if test="${currentWorld}">
			    	<div class="center bigWrapper">
						<div class="bigImageWrapper">
				    		<g:link controller="world" action="currentWeek">
				    			<img class="bigFrontPageImage" src="/showThumb/${currentWorld?.photo?.id}/${currentWorld?.photo?.photoName}.png" alt="${currentWorld?.photo?.photoCaption}"/>
							</g:link>
						</div>
						<h3>${currentWorld?.title}</h3>
					</div>
					<p>${currentWorld.summary }</p>
				</g:if>
				<g:else>
					<div class="center bigWrapper">
						<div class="bigImageWrapper">
							<img class="bigFrontPageImage" src="${resource(dir: 'images/home_icons',file: 'science.png')}" style="padding-top:50px;"/>
						</div>
						<h3>Welcome!</h3>
					</div>
				<p>Welcome to my website!</p>
				</g:else>
				
			</div>
	    	<div class="span4">
		    	<div class="center bigWrapper">
					<div class="bigImageWrapper">
						<g:link controller="photoAlbum" action="list">
							<g:set var="picture" value="${Photo.findAllByShowOnHomePage(true)}"/>
							<g:set var="rand" value="${new Random()}"/>
							<g:if test="${picture.size()>1}">
								<img class="bigFrontPageImage" src="/showThumb/${picture[rand.nextInt(picture.size()-1)].id}/${picture[rand.nextInt(picture.size()-1)].photoName}.png" alt="${picture[rand.nextInt(picture.size()-1)].photoCaption}"/>
							</g:if>
							<g:elseif test="${picture.size()==1}">
								<img class="bigFrontPageImage" src="/showThumb/${picture[0].id}/${picture[0].photoName}.png" alt="${picture[0].photoCaption}"/>
							</g:elseif>
							<g:else>
								<img class="bigFrontPageImage" src="${resource(dir: 'images/home_icons',file: 'photo_blog.jpg')}" />
							</g:else>
						</g:link>
					</div>
					<h3>Photo Archive</h3>
				</div>
				<p>I post collections of my pictures here, whether they are from a trip to Switzerland or just backgrounds I like, they all end up here!</p>
			</div>
	    	<div class="span4">
		    	<div class="center bigWrapper">
					<div class="bigImageWrapper">
						<g:link	url="/about">
							<img class="bigFrontPageImage" src="${resource(dir: 'images/home_icons',file: 'ian_.png')}" />
						</g:link>
					</div>
					<h3>About me.</h3>
				</div>
				<p>I hear Ian's pretty cool, you should find out why<g:link	url="/about">...</g:link>
				</p>
<!-- 	                <li>Less 1.3</li> -->
			</div>
	    </div>
	</section>

	<section id="info2">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
<%--		    		<a href ="https://www.facebook.com/ian.holstead"  target="_blank">--%>
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'networks.png')}" />
<%--					</a>--%>
					<h3>Connect with me!</h3>
				</div>
				<p>
					Add me as a friend on <a href="https://www.facebook.com/ian.holstead" target="_blank">facebook!</a><br/>
					Follow me on <a href ="https://twitter.com/IanHolstead" target="_blank">twitter!</a><br/>
					For professional inquiries please see my <a href ="http://ca.linkedin.com/in/ianholstead/" target="_blank">Linkedin profile</a><br/>
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
<%--					<a href ="https://twitter.com/IanHolstead" target="_blank">--%>
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'programming.png')}" />
<%--					</a>--%>
					<h3>Programming</h3>
				</div>
				<p>
					Check out my <a href ="http://github.com/IanHolstead" target="_blank">GitHub account</a><br/>
					or my <a href ="http://stackoverflow.com/users/2399849/ian-holstead" target="_blank">Stackoverflow account</a>
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
<%--					<a href ="http://ca.linkedin.com/in/ianholstead/" target="_blank">--%>
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'social.png')}" />
<%--					</a>--%>
					<h3>Those other accounts</h3>
				</div>
				<p>
					Add me on <a href ="http://steamcommunity.com/id/themostevile/" target="_blank">steam!</a><br/>
					Take a look at my <a href ="http://www.youtube.com/user/theonemetorulethemal" target="_blank">YouTube channel</a><br/>
					Add me on <a href ="https://plus.google.com/103164028904505410580/posts" target="_blank">G+</a>
				</p>
			</div>
	    </div>
	</section>

<%--	<section id="info3">--%>
<%--		<div class="row">--%>
<%--	    	<div class="span4">--%>
<%--		    	<div class="center">--%>
<%--					<h3>Usage</h3>--%>
<%--				</div>--%>
<%--				<p>After installation you can call the script "grails--%>
<%--					kickstartWithBootstrap" which will copy some files into your--%>
<%--					project. It will overwrite only few files (e.g., in conf, src, and--%>
<%--					views) - <b>you should use it only on fresh new Grails projects</b>.--%>
<%--				</p>--%>
<%--			</div>--%>
<%--	    	<div class="span4">--%>
<%--		    	<div class="center">--%>
<%--					<h3>Notes</h3>--%>
<%--				</div>--%>
<%--				<p></p>--%>
<%--				<ul>--%>
<%--					<li>Currently, Kickstart works with Grails 2.0 and 2.1!</li>--%>
<%--					<li>Kickstart only uses the CSS version of Bootstrap (currently, no less).</li>--%>
<%--					<li>It does NOT use the Bootstrap plugin.</li>--%>
<%--					<li>I18N is only available for English and German!</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--	    	<div class="span4">--%>
<%--		    	<div class="center">--%>
<%--					<h3>Terms of Use</h3>--%>
<%--				</div>--%>
<%--				<p></p>--%>
<%--				<ul>--%>
<%--					<li>Bootstrap (from Twitter): Code licensed under the Apache--%>
<%--						License v2.0. Documentation licensed under CC BY 3.0.--%>
<%--						(<a href="http://twitter.com/TwBootstrap">@TwBootstrap</a> , <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>)</li>--%>
<%--					<li>Kickstart Plugins: Code licensed under the Apache License--%>
<%--						v2.0. Documentation licensed under CC BY 3.0. Copyright 2011 Jörg--%>
<%--						Rech (<a href="http://twitter.com/JoergRech">@JoergRech</a>, <a href="http://joerg-rech.com">http://joerg-rech.com</a>)</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--	    </div>--%>
<%----%>
<%--	</section>--%>

</body>

</html>
