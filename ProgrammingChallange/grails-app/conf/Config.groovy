grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

grails.gorm.default.constraints = {
	'*'(nullable: true)
	title maxSize:100, blank:false, nullable:false, unique: true, validator: {val -> return (!val.contains('-') && val==~ /^([!#$+'-\).0-9= A-\[\]_a-z~]|%[0-9a-fA-F]{2})+$/)}
	caption maxSize:1000
	shortCaption maxSize:150
}

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000
grails.app.context = "/"

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
		baseFilePath = 'C:\\Users\\Ian\\Programming\\Grails\\FileStorage\\'
		photoPath = 'Photos\\'
		thumbsPath = 'Photos\\Thumbs\\'
    }
    production {
        grails.logging.jul.usebridge = false
		baseFilePath = '/home/ianhols/'
		photoPath = 'Photos/'
		thumbsPath = 'Photos/Thumbs/'
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.ianholstead.security.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.ianholstead.security.UserRole'
grails.plugins.springsecurity.authority.className = 'com.ianholstead.security.Role'

grails.plugins.springsecurity.auth.loginFormUrl = '/'
grails.plugins.springsecurity.failureHandler.defaultFailureUrl = '/loginFail'

grails.plugins.springsecurity.rememberMe.cookieName="ianholstead"
grails.plugins.springsecurity.rememberMe.key="_grails_"
grails.plugins.springsecurity.rememberMe.rememberMe.persistent = true


grails.plugins.springsecurity.roleHierarchy = '''
   	ROLE_SUPER_ADMIN > ROLE_ADMIN
   	ROLE_ADMIN > ROLE_AWESOME_USER
	ROLE_AWESOME_USER > ROLE_SUPER_USER
	ROLE_SUPER_USER > ROLE_USER
	ROLE_USER > ROLE_NONE
'''

grails.config.defaults.locations = [KickstartResources]