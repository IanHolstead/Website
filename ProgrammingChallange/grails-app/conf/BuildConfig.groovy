grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.war.file = "target/ROOT.war"

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
		
		mavenRepo "http://repository.springsource.com/maven/bundles/release/"
		mavenRepo "http://repository.springsource.com/maven/bundles/external/"

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.

         runtime 'mysql:mysql-connector-java:5.1.22'
//		 compile 'org.imgscalr:imgscalr-lib:4.1'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.2"
		build ":tomcat:$grailsVersion"

		compile ":spring-security-core:1.2.7.3"
		compile ":spring-security-ui:0.2"
		compile ":famfamfam:1.0.1"
		compile ":jquery-ui:1.8.24"
		
		compile ':kickstart-with-bootstrap:0.8.9'
		compile ':lesscss-resources:1.3.0.3'
		compile ":hd-image-utils:0.4"
//        runtime ":database-migration:1.3.2"
        compile ':cache:1.0.1'
    }
}
