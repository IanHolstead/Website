package ian.website

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ian.security.*
import org.apache.commons.lang.RandomStringUtils

class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?:'date'
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.int('offset')?:1
		def authId = (int)getRole().id
		def blogInstanceList = Blog.list()
		blogInstanceList.removeAll{
			it.authenticationLevel.id<authId
		}
		def blogCount = blogInstanceList.size()
		blogInstanceList = blogInstanceList.subList(params.offset-1, Math.min(params.offset-1 + params.max, blogCount-1))
        [blogInstanceList: blogInstanceList, blogInstanceTotal: blogCount]
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        [blogInstance: new Blog(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
		params.authenticationLevel = Role.findByAuthority(params.authenticationLevel)
		String randomString = null
		while (params.secureUrl && !randomString && randomString != Blog.findBySecureUrl(randomString)) {
			randomString = RandomStringUtils.random(10, ((('A'..'Z') + ('0'..'9')).join()).toCharArray())
		}
		params.secureUrl = randomString
        def blogInstance = new Blog(params)
		blogInstance.blogContent = parseBlog(params.blogContent)
        if (!blogInstance.save(flush: true)) {
            render(view: "create", model: [blogInstance: blogInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

    def show() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }
		
		if (blogInstance.authenticationLevel.id < getRole().id) {
			redirect(uri:'/accessdenied')
			return
		}

        [blogInstance: blogInstance]
    }
	
	def showPastSecurity() {
		def blogInstance = Blog.findBySecureUrl(params.id)
		if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
			redirect(action: "list")
			return
		}
		
		render(view: 'show', model:[blogInstance: blogInstance])
	}
	
	@Secured(['ROLE_ADMIN'])
    def edit() {
        def blogInstance = Blog.get(params.id)
		
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }
		
		def blogContent = blogInstance.blogContent
		blogContent = blogContent.replaceAll("<br/>", "\n")
		blogInstance.blogContent = blogContent

        [blogInstance: blogInstance]
    }
	
	@Secured(['ROLE_ADMIN'])
    def update() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (blogInstance.version > version) {
                blogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blog.label', default: 'Blog')] as Object[],
                          "Another user has updated this Blog while you were editing")
                render(view: "edit", model: [blogInstance: blogInstance])
                return
            }
        }
		
		String randomString = null
		if(params.secureUrl){
			if(!blogInstance.secureUrl){ 
				while (!randomString && randomString != Blog.findBySecureUrl(randomString)) {
					randomString = RandomStringUtils.random(10, ((('A'..'Z') + ('0'..'9')).join()).toCharArray())
				}
			}
			else{
				randomString = blogInstance.secureUrl
			}
		}
		
		
		params.authenticationLevel = Role.findByAuthority(params.authenticationLevel)
        blogInstance.properties = params
		blogInstance.secureUrl = randomString
		blogInstance.blogContent = parseBlog(params.blogContent)
        if (!blogInstance.save(flush: true)) {
            render(view: "edit", model: [blogInstance: blogInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def blogInstance = Blog.get(params.id)
		if(World.findByBlog(blogInstance)){
			flash.message = message(code: 'blog.no.delete.world.message', args: [message(code: 'blog.label', default: 'Blog'), params.id], default: 'You can\'t delete this because it has a world attached to it!')
			redirect(action: "list")
			return
		}
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        try {
            blogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	protected def getRole(){
		if(springSecurityService.getPrincipal() != 'anonymousUser'){
			def temp = springSecurityService.getPrincipal().getAuthorities().toArray()
			return Role.findByAuthority(temp[0].toString())
		}
		else{
			return Role.findByAuthority('ROLE_NONE')
		}
	}
	
	protected def parseBlog(def blogContent){
		def blogTemp = ""
		blogContent = blogContent.split("(?=<.?pre.*?>)")
		blogContent.eachWithIndex { it, i ->
			if(i%2 == 0){
				blogTemp = blogTemp + it.replaceAll("\n", "<br/>")
			}
			else{
				blogTemp = blogTemp + it
			}
		}
		return blogTemp
	}
}
