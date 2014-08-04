<html>

<head>
    <title><g:message code="site.changelog.title" default="Changelog"/></title>
    <meta name="layout" content="kickstart" />
</head>

<body>
	<section id="v1_0_4" class="section">
	    <h1><g:message code="change.1.0.4.title" default="1.0.4"/></h1>
	    <div>This change focused on refactoring and general cleanup (<g:link url="changelog/1.0.4">Full change log</g:link>): 2014-08-03</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Added navigation to blogs, worlds and photo albums</li>
			<li>Improved URLs</li>
			<li>Added config object allowing most text on the site to be edited at any point</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Blogs and worlds do not have dates</li>
			<li>Change version number (oops)</li>
			<li>Fixed alt text on pictures</li>
	     </ul>
	    <div class="small_title">Tasks/Other</div>
	    <ul>
			<li>Externalized strings, if you see a.weird.title that is why... Let me know if you see one!</li>
	     </ul>
	</section>
	<section id="v1_0_3" class="section">
	    <h1><g:message code="change.1.0.3.title" default="1.0.3"/></h1>
	    <div>This change has lots of bug fixes but little in terms of new features (<g:link url="changelog/1.0.3">Full change log</g:link>): 2014-07-10</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Create Access denied page</li>
			<li>Add bypass security option for direct linking</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Fix Bootstrap links</li>
			<li>Fix Error pages</li>
			<li>Fix DB Timeout</li>
			<li>Blogs not attached to worlds do not show up</li>
			<li>Pagination does not work</li>
			<li>Small photos are positioned incorrectly on show page</li>
			<li>Blog and image dont delete with world</li>
			<li>Make CSS and JS for syntax highligher only load on the correct pages</li>
			<li>Add acknowledgements to site info</li>
			<li>Can not create new blog</li>
	     </ul>
	    <div class="small_title">Tasks/Other</div>
	    <ul>
			<li>Started using Jira</li>
			<li>CSS cleanup</li>
			<li>Web interface for adding users</li>
			<li>Add Security level field to each object</li>
			<li>Make footer sticky</li>
	     </ul>
	</section>
	<section id="v1_0_2" class="section">
	    <h1><g:message code="change.1.0.2.title" default="1.0.2"/></h1>
	    <div>This change focused on mobile pages and bug fixes: 2014-01-22</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Syntax highlighting for code</li>
			<li>Changelog page created</li>
			<li>Accordions on site info page</li>
			<li>Added navigation to photo show page</li>
			<li>Added links to photos on home page</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Fixed list pages on mobile devices</li>
			<li>Fixed Youtube video in worlds for mobile devices</li>
			<li>Fixed hidden blogs showing up</li>
			<li>Fixed editing of pages</li>
			<li>Fixed thumbnails showing up to large if they were portrait</li>
			<li>Fixed site being really slow (by upgrading my hosting plan...)</li>
	     </ul>
	    <div class="small_title">Coming soon</div>
	    <ul>
			<li>About... My computer!</li>
			<li>Web interface for adding users</li>
			<li>Facebook/Twitter API integration</li>
			<li>Uploads</li>
			<li>Major refactoring</li>
			<li>Programming challenges</li>
			<li>Tags for posts</li>
	     </ul>
	</section>
	<section id="v1_0_1" class="section-small">
	    <h1><g:message code="change.1_0_1.title" default="1.0.1"/></h1>
	    <div>Primarily UI upgrades</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>List pages have better UI</li>
			<li>Home page has better pictures</li>
			<li>About me page looks better</li>
			<li>Made worlds prettier</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Fixed footer</li>
			<li>Better support for editing pictures</li>
			<li>Fixed world 'queuing'</li>
			<li>Removed unfinished pages</li>
			<li>Fixed text on most pages</li>
	     </ul>
	</section>
	<section id="v1_0_0" class="section-small">
	    <h1><g:message code="change.1_0_0.title" default="1.0.0"/></h1>
	    <div>This was the first stable release ready for the web</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Added security to all pages</li>
			<li>Added photo thumbnails</li>
			<li>Deployed to ianholstead.com</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Everything.</li>
	     </ul>
	</section>
	<section id="v0_-_-" class="section-small">
	    <h1><g:message code="change.1_-_-.title" default="Initial changes (Unstable)"/></h1>
	    <div>Built the basis of the website</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Created Grails project</li>
			<li>Ran Twitter Bootstrap</li>
			<li>Created domain classes</li>
			<li>Build views and controllers from scaffolding</li>
			<li>Added file storage on DB</li>
			<li>Got website running!</li>
	     </ul>
	</section>

</body>

</html>