
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
				<center><h3>${photoInstance.photoName}</h3></center>
			</div>
			<div class="photoThumb">
				<center>
					<img class="image" src="${createLink(controller:'photo', action:'showPayload', id:"${photoInstance.id}")}" />
				</center>
			</div>
			<div class="photoDescription">
				<center><p>${photoInstance.photoCaption}</p></center>
			</div>
		</div>
		
		<hr/>
		
		<div class="video">
			<div class="videoThumb">  <!-- ENSURE TO INPUT WIDTH CSS RULE -->
				<center>
					<iframe width="853" height="480" src="${worldInstance.video}" frameborder="0" allowfullscreen></iframe>
				</center>
			</div>
			<div class="videoCaption">
				<center><p>${worldInstance.videoCaption}</p></center>
			</div>
		</div>
		
		<hr/>
	
		<div class="XKCD">
			<div class="XKCDthumb">  <!-- ENSURE TO INPUT WIDTH CSS RULE -->
				<center><img  src="${worldInstance.xkcd}" width='300' /></center>
			</div>
			<div class="XKCDcaption">
				<center><p>${worldInstance.xkcdCaption}</p></center>
			</div>
		</div>


	
</section>

</body>

</html>
