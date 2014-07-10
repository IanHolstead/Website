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
		<p>Hello World! This is my personal website where I will do my best to post stuff (photos, blog, etc) regularly.
		This site is still under development so hopefully whenever you check back there will cool new functionality. Thanks!</p>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
	    	<g:set var="currentWorld" value="${World.findByStatus(1)}"/>
		    	<g:if test="${currentWorld}">
			    	<div class="center big-wrapper">
						<div class="big-image-wrapper">
				    		<g:link controller="world" action="currentWeek">
				    			<img class="big-front-page-image" src="/showThumb/${currentWorld?.photo?.id}/${currentWorld?.photo?.photoName}.png" alt="${currentWorld?.photo?.photoCaption}"/>
							</g:link>
						</div>
						<h3>${currentWorld?.title}</h3>
					</div>
					<p>${currentWorld.summary }</p>
				</g:if>
				<g:else>
					<div class="center big-wrapper">
						<div class="big-image-wrapper">
							<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'science.png')}" style="padding-top:50px;"/>
						</div>
						<h3>Welcome!</h3>
					</div>
				<p>Welcome to my website!</p>
				</g:else>
				
			</div>
	    	<div class="span4">
		    	<div class="center big-wrapper">
					<div class="big-image-wrapper">
						<g:link controller="photoAlbum" action="list">
							<g:set var="picture" value="${Photo.findAllByShowOnHomePage(true)}"/>
							<g:set var="rand" value="${new Random()}"/>
							<g:if test="${picture.size()>1}">
								<img class="big-front-page-image" src="/showThumb/${picture[rand.nextInt(picture.size()-1)].id}/${picture[rand.nextInt(picture.size()-1)].photoName}.png" alt="${picture[rand.nextInt(picture.size()-1)].photoCaption}"/>
							</g:if>
							<g:elseif test="${picture.size()==1}">
								<img class="big-front-page-image" src="/showThumb/${picture[0].id}/${picture[0].photoName}.png" alt="${picture[0].photoCaption}"/>
							</g:elseif>
							<g:else>
								<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'photo_blog.jpg')}" />
							</g:else>
						</g:link>
					</div>
					<h3>Photo Albums</h3>
				</div>
				<p>I post collections of my pictures here: whether they are from a trip to Switzerland or just backgrounds I like, they all end up here!</p>
			</div>
	    	<div class="span4">
		    	<div class="center big-wrapper">
					<div class="big-image-wrapper">
						<g:link	url="/about">
							<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'ian.png')}" />
						</g:link>
					</div>
					<h3>About me.</h3>
				</div>
				<p>I hear Ian's pretty cool, you should find out why<g:link	url="/about">...</g:link>
				</p>
			</div>
	    </div>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'networks.png')}" usemap="#network-map"/>
						<map name="network-map">
							<area shape="rect" alt="Facebook" coords="0,0,100,100" href="https://www.facebook.com/ian.holstead" target="_blank">
							<area shape="rect" alt="Twitter" coords="100,0,200,100" href="https://twitter.com/IanHolstead" target="_blank">
							<area shape="rect" alt="LinkedIn" coords="200,0,300,100" href="http://ca.linkedin.com/in/ianholstead/" target="_blank">
						</map>
					<h3>Connect with me!</h3>
				</div>
				<p>
					Add me as a friend on <a href="https://www.facebook.com/ian.holstead" target="_blank">Facebook!</a><br/>
					Follow me on <a href ="https://twitter.com/IanHolstead" target="_blank">Twitter!</a><br/>
					For professional inquiries please see my <a href ="http://ca.linkedin.com/in/ianholstead/" target="_blank">Linkedin profile</a><br/>
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'programming.png')}" usemap="#programming-map"/>
						<map name="programming-map">
							<area shape="rect" alt="Github" coords="0,0,100,100" href="http://github.com/IanHolstead" target="_blank">
							<area shape="rect" alt="Stackoverflow" coords="100,0,200,100" href="http://stackoverflow.com/users/2399849/ian-holstead" target="_blank">
						</map>
					<h3>Programming</h3>
				</div>
				<p>
					Check out my <a href ="http://github.com/IanHolstead" target="_blank">GitHub account</a><br/>
					or my <a href ="http://stackoverflow.com/users/2399849/ian-holstead" target="_blank">Stackoverflow account</a>
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'social.png')}" usemap="#other-map"/>
						<map name="other-map">
							<area shape="rect" alt="Steam" coords="0,0,100,100" href="http://steamcommunity.com/id/themostevile/" target="_blank">
							<area shape="rect" alt="YouTube" coords="100,0,200,100" href="http://www.youtube.com/user/theonemetorulethemal" target="_blank">
							<area shape="rect" alt="G+" coords="200,0,300,100" href="https://plus.google.com/103164028904505410580/posts" target="_blank">
						</map>
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

</body>

</html>
