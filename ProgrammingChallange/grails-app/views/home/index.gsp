<html>

<head>
	<title><g:message code="home.title"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>
	<section id="intro" class="first">
		<h1>Welcome to my website!</h1>
		<p>If you have ened up here, you've ahead of the game, so much so that I'm not actually finished 
		this site yet! Feel free to look around, there is probably little to no information on the site yet
		and the visual layout is no where near done. None the less, thanks!</p>
		<h2>About me (tl;dr)</h2>
		<p>Oel ngati kameie.</p>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
		    		<g:link controller="world" action="currentWeek">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'science.png')}" />
					</g:link>
					<h3>Bootstrap 2.1.1</h3>
				</div>
				<p>Check out my world this week, where I post a blog post, photo, youtube video and xkcd comic</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<g:link controller="photoAlbum" action="list">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'photo_blog.png')}" />
					</g:link>
					<h3>Photo Archive</h3>
				</div>
				<p>Bootstrap is tested and supported in major modern browsers like Chrome 14, Safari 5+, Opera 11, Internet Explorer 7, and Firefox 5.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<g:link	url="/about">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'photo_blog.png')}" />
					</g:link>
					<h3>About me.</h3>
				</div>
				<p>Bootstrap is based on elements of HTML 5, CSS 3, Javascript 1.8, and jQuery 1.7 with progressively enhanced 
				components to enable a responsive design of the website.
				Kickstart is built using Groovy 2.0 and Java 7 integrated into the Grails 2.1 framework. 
				</p>
<!-- 	                <li>Less 1.3</li> -->
			</div>
	    </div>
	</section>

	<section id="info2">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
		    		<a href ="https://www.facebook.com/ian.holstead"  target="_blank">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'facebook.png')}" />
					</a>
					<h3>Facebook</h3>
				</div>
				<p>Add me as a friend on facebook!</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<a href ="https://twitter.com/IanHolstead" target="_blank">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'twitter.png')}" />
					</a>
					<h3>Twitter</h3>
				</div>
				<p>Follow me on twitter.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<a href ="http://ca.linkedin.com/in/ianholstead/" target="_blank">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'linkedin.png')}" />
					</a>
					<h3>Linkedin</h3>
				</div>
				<p>For professional inquiries please see my Linkedin profile</p>
			</div>
	    </div>
	</section>

	<section id="info3">
		<div class="row">
	    	<div class="span4">
		    	<div class="center">
					<h3>Usage</h3>
				</div>
				<p>After installation you can call the script "grails
					kickstartWithBootstrap" which will copy some files into your
					project. It will overwrite only few files (e.g., in conf, src, and
					views) - <b>you should use it only on fresh new Grails projects</b>.
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Notes</h3>
				</div>
				<p></p>
				<ul>
					<li>Currently, Kickstart works with Grails 2.0 and 2.1!</li>
					<li>Kickstart only uses the CSS version of Bootstrap (currently, no less).</li>
					<li>It does NOT use the Bootstrap plugin.</li>
					<li>I18N is only available for English and German!</li>
				</ul>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Terms of Use</h3>
				</div>
				<p></p>
				<ul>
					<li>Bootstrap (from Twitter): Code licensed under the Apache
						License v2.0. Documentation licensed under CC BY 3.0.
						(<a href="http://twitter.com/TwBootstrap">@TwBootstrap</a> , <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>)</li>
					<li>Kickstart Plugins: Code licensed under the Apache License
						v2.0. Documentation licensed under CC BY 3.0. Copyright 2011 Jörg
						Rech (<a href="http://twitter.com/JoergRech">@JoergRech</a>, <a href="http://joerg-rech.com">http://joerg-rech.com</a>)</li>
				</ul>
			</div>
	    </div>

	</section>

</body>

</html>
