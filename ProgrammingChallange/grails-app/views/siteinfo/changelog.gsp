<html>

<head>
    <title><g:message code="site.changelog.title" default="Changelog"/></title>
    <meta name="layout" content="kickstart" />
</head>

<body>
	<section id="v1_1_0" class="section">
	    <h1><g:message code="change.1.1.0.title" default="1.1.1"/></h1>
	    <div>Bug Fixes! Just some small stuff leading up to interview season (<g:link url="changelog/1.1.1">Full change log</g:link>): 2016-04-27</div>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Fixed sorting and pagination</li>
			<li>Fixed various 500 errors</li>
	     </ul>
	    <div class="small_title">Tasks/Other</div>
	    <ul>
			<li>Changed title business card page</li>
			<li>Updated about me</li>
	     </ul>
	</section>
	<section id="v1_1_0" class="section">
	    <h1><g:message code="change.1.1.0.title" default="1.1.0"/></h1>
	    <div>Photo Update! Photos are now stored on the file system (<g:link url="changelog/1.1.0">Full change log</g:link>): 2015-05-16</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Files are stored on the File system rather than the DB</li>
			<li>Added option for downloading games Im working on. You'll need a URL from me though</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Some admin fixes</li>
			<li>Made file IO a little more robust.</li>
			<li>fixed photos overflowing on album show page</li>
	     </ul>
	    <div class="small_title">Tasks/Other</div>
	    <ul>
			<li>Removed worlds. Now there is just the blog, worlds were dumb.</li>
	     </ul>
	</section>
	<section id="v1_0_5" class="section">
	    <h1><g:message code="change.1.0.5.title" default="1.0.5"/></h1>
	    <div>Dynamic pages update! I'm slowly moving old static pages to dynamic ones (<g:link url="changelog/1.0.5">Full change log</g:link>): 2014-10-10</div>
	    <div class="small_title">New Features</div>
	    <ul>
			<li>Added employment section where I can share my contact info and resume with employers</li>
	     </ul>
	    <div class="small_title">Bug Fixes</div>
	    <ul>
			<li>Lots of little CSS fixes</li>
			<li>Lots of employment bug fixes</li>
			<li>Fixed a few incorrectly externalized strings</li>
	     </ul>
	    <div class="small_title">Tasks/Other</div>
	    <ul>
			<li>Added google analytics and webmaster tools!</li>
			<li>Moved repo to github! The repo is private due to passwords in the repo...</li>
	     </ul>
	</section>
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