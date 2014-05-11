
<%@ page import="ian.website.World" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${worldInstance.title}" />
	<title>${entityName}</title>
	
</head>

<body>
<section id="show-world" class="first">
		<div class="blog">
			<div class="blogTitle"><h1>${blogInstance.blogTitle}</h1></div>
			<div class="blogContent"><p>${blogInstance.blogContent}<p></div>
		</div>
	
		<hr/>
		
		<div class="photo">
			<div class="photoTitle">
				<div class="center"><h3>${photoInstance.photoName}</h3></div>
			</div>
			<div class="photoThumb">
				<div class="center">
					<img src="/showPhoto/${photoInstance.id}/${photoInstance.photoName}.png" alt="${photoInstance.photoCaption}"/>
				</div>
			</div>
			<div class="photoDescription">
				<div class="center"><p>${photoInstance.photoCaption}</p></div>
			</div>
		</div>
		
		<hr/>
		
		<div class="video">
			<div class="center videoThumb">
				<iframe class="iVideo" width="420" height="315" src="${worldInstance.video}" frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="videoCaption">
				<div class="center"><p>${worldInstance.videoCaption}</p></div>
			</div>
		</div>
		
		<hr/>
	
		<div class="XKCD">
			<div class="XKCDthumb">
				<div class="center"><img class="XKCD" src="${worldInstance.xkcd}"/></div>
			</div>
			<div class="XKCDcaption">
				<div class="center"><p>${worldInstance.xkcdCaption}</p></div>
			</div>
		</div>


	
</section>

</body>

</html>
