<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require modules="jquery"/>
	<r:require modules="${session.skin ? session.skin            : 'bootstrap'}"/>
	<r:require modules="${session.skin ? session.skin + '_utils' : 'bootstrap_utils'}"/>
	
	<r:require modules="google"/>
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'general.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'controller-pages.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'static-pages.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

	<r:layoutResources />
	<g:layoutHead />

</head>

<body style="padding:0px;">
	<div class="body-content">
		<g:render template="/_menu/navbar"/>														
	
		<!-- Enable to overwrite Header by individual page -->
		<g:if test="${ pageProperty(name:'page.header') }">
	   		<g:pageProperty name="page.header" />
		</g:if>
		<g:else>
			<g:render template="/layouts/header"/>														
		</g:else>
	
		<div class="indent-body">
			<g:if test="${session.layout == 'fluid'}">
				<g:render template="/layouts/content_${session.layout}"/>														
			</g:if>
			<g:else>
				<g:render template="/layouts/content_grid"/>														
			</g:else>
		</div>
	</div>
	<div class="footer-content">
		<g:if test="${ pageProperty(name:'page.footer') }">
		    <g:pageProperty name="page.footer" />
		</g:if>
		<g:else>
			<g:render template="/layouts/footer"/>														
		</g:else>
	</div>
	
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	<g:else>
		<g:render template="/_common/modals/registerDialog" model="[item: item]"/>
	</g:else>
	
	<r:layoutResources />
</body>

</html>