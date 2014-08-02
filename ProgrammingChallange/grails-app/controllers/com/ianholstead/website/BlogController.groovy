package com.ianholstead.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.security.*

import org.apache.commons.lang.RandomStringUtils

import com.ianholstead.website.Blog;
import com.ianholstead.website.World;

class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	
    def index() {
		params.sort = params.sort?:'date'
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.int('offset')?:1
		def authId = (int)getRole().id
		def blogInstanceList = Blog.list()
		blogInstanceList.removeAll{
			it.authenticationLevel.id<authId
		}
		def blogCount = blogInstanceList.size()
		blogInstanceList = blogInstanceList.subList(params.offset-1, Math.min(params.offset-1 + params.max, blogCount))
		render(view:'list', model:[blogInstanceList: blogInstanceList, blogInstanceTotal: blogCount])
    }

    def list() {
		redirect(action: "index", params: params)
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

		flash.message = message(code: 'default.created.message', args: [message(code: 'blog.label')])
        redirect(action: "show", id: blogInstance.id)
    }

    def show() {
        def blogInstance = Blog.get(getBlogId(params.id))
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label')])
            redirect(action: "list")
            return
        }
		
		if (blogInstance.authenticationLevel.id < getRole().id) {
			redirect(uri:'/accessdenied')
			return
		}
		def authId = (int)getRole().id
		List blogs = Blog.list()
		blogs.removeAll{
			it.authenticationLevel.id<authId
		}
		blogs.sort(true) { a, b ->
			a.id <=> b.id
		}
		
		def next
		def prev
		for(int i = 0; i<(blogs.size()-1); i++){
			if(blogs[i].id == blogInstance.id){
				next = blogs[i+1]
				prev = blogs[i-1]
			}
		}
		if(!next)
			next = blogs[0]
		if(!prev){
			if(blogs.size()>2)
				prev = blogs[-2]
			else
				prev = blogs[0]
		}

        [blogInstance: blogInstance, next:next, prev:prev]
    }
	
	def showPastSecurity() {
		def blogInstance = Blog.findBySecureUrl(params.id)
		if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label')])
			redirect(action: "index")
			return
		}
		
		render(view: 'show', model:[blogInstance: blogInstance, noNav: true])
	}
	
	@Secured(['ROLE_ADMIN'])
    def edit() {
        def blogInstance = Blog.get(getBlogId(params.id))
		
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label')])
            redirect(action: "index")
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
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label')])
            redirect(action: "index")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (blogInstance.version > version) {
                blogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blog.label')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [message(code: 'blog.label')])
        redirect(action: "show", id: blogInstance.getUrl())
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def blogInstance = Blog.get(getBlogId(params.id))
		if(World.findByBlog(blogInstance)){
			flash.message = message(code: 'default.no.delete.world.message', args: [message(code: 'blog.label')])
			redirect(action: "index")
			return
		}
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label')])
            redirect(action: "index")
            return
        }

        try {
            blogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog.label')])
            redirect(action: "index")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blog.label')])
            redirect(action: "show", id: params.id)
        }
    }
	
	
	
	protected getBlogId(String name){
		int id = Blog.findByBlogTitle(name.replace('-', ' '))?.id
		id = id?:-1
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
