<%@ page import="com.ianholstead.website.Blog" %>
<%@ page import="com.ianholstead.website.Photo" %>
<%@ page import="java.util.Random" %>
<%@ page import="com.ianholstead.website.Config" %>
<html>

<g:set var="config" value="${Config.get(1)}"/>

<head>
	<title>${config.homeTitle}</title>
	<meta name="layout" content="kickstart" />
</head>

<body>
	<g:if test="${params?.message}">
		<div class="alert alert-error">
			${params.message}
		</div>
	</g:if>
	<section id="intro" class="first">
		<h1>${config.homeSubTitle}</h1>
		<p>${config.homeInfo}</p>
	</section>

	<section id="info">
		<div class="row-fluid">
	    	<div class="span4">
	    	<g:set var="currentBlog" value="${Blog.findByFeatured(true)}"/>
		    	<g:if test="${currentBlog}">
			    	<div class="center big-wrapper">
						<div class="big-image-wrapper">
				    		<g:link controller="blog" action="show" id="${currentBlog.getUrl()}">
				    			<img class="big-front-page-image" src="/showThumb/${currentBlog?.thumb?.getUrl()}" alt="${currentWorld?.thumb?.photoName}"/>
							</g:link>
						</div>
						<h3>${currentBlog?.blogTitle}</h3>
					</div>
					<p>${currentBlog.blogSummary}</p>
				</g:if>
				<g:else>
					<div class="center big-wrapper">
						<div class="big-image-wrapper">
							<g:link controller="blog" action="index">
								<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'science.png')}" style="padding-top:50px;"/>
							</g:link>
						</div>
						<h3><g:message code="home.no.feature.title"/></h3>
					</div>
				<p><g:message code="home.no.feature.info.label"/></p>
				</g:else>
				
			</div>
	    	<div class="span4">
		    	<div class="center big-wrapper">
					<div class="big-image-wrapper">
						<g:link controller="photoAlbum" action="list">
							<g:set var="picture" value="${Photo.findAllByShowOnHomePage(true)}"/>
							<g:set var="rand" value="${new Random()}"/>
							<g:if test="${picture.size()>1}">
								<img class="big-front-page-image" src="/showThumb/${picture[rand.nextInt(picture.size()-1)].getUrl()}" alt="${picture[rand.nextInt(picture.size()-1)].photoNAme}"/>
							</g:if>
							<g:elseif test="${picture.size()==1}">
								<img class="big-front-page-image" src="/showThumb/${picture[0].getUrl()}" alt="${picture[0].photoName}"/>
							</g:elseif>
							<g:else>
								<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'photo_blog.jpg')}" />
							</g:else>
						</g:link>
					</div>
					<h3><g:message code="home.photoAlbums.title"/></h3>
				</div>
				<p>${config.homePhotoInfo}</p>
			</div>
	    	<div class="span4">
		    	<div class="center big-wrapper">
					<div class="big-image-wrapper">
						<g:link	url="/about">
							<img class="big-front-page-image" src="${resource(dir: 'images/home_icons',file: 'ian.png')}" />
						</g:link>
					</div>
					<h3><g:message code="home.about.title"/></h3>
				</div>
				<p>${config.homeAboutInfo}</p>
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
					<h3><g:message code="home.social.title"/></h3>
				</div>
				<p>${config.homeConnectInfo}</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'programming.png')}" usemap="#programming-map"/>
						<map name="programming-map">
							<area shape="rect" alt="Github" coords="0,0,100,100" href="http://github.com/IanHolstead" target="_blank">
							<area shape="rect" alt="Stackoverflow" coords="100,0,200,100" href="http://stackoverflow.com/users/2399849/ian-holstead" target="_blank">
						</map>
					<h3><g:message code="home.programming.title"/></h3>
				</div>
				<p>${config.homeProgrammingInfo}</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
						<img class="frontpageImage" src="${resource(dir: 'images/home_icons',file: 'social.png')}" usemap="#other-map"/>
						<map name="other-map">
							<area shape="rect" alt="Steam" coords="0,0,100,100" href="http://steamcommunity.com/id/themostevile/" target="_blank">
							<area shape="rect" alt="YouTube" coords="100,0,200,100" href="http://www.youtube.com/user/theonemetorulethemal" target="_blank">
							<area shape="rect" alt="G+" coords="200,0,300,100" href="https://plus.google.com/103164028904505410580/posts" target="_blank">
						</map>
					<h3><g:message code="home.other.title"/></h3>
				</div>
				<p>${config.homeOtherInfo}</p>
			</div>
	    </div>
	</section>

</body>

</html>
