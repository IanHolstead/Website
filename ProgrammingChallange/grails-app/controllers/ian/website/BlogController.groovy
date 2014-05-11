package ian.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException


class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def blogInstanceList = Blog.list(params)
		
		blogInstanceList = blogInstanceList.collect{
			def world = World.findByBlog(it)
			if(world?.status !=1 && world?.status !=2 && world){
				it = null
			}
			return it
		}
		blogInstanceList.removeAll([null])
		
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [blogInstanceList: blogInstanceList, blogInstanceTotal: blogInstanceList.size()]
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        [blogInstance: new Blog(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def blogInstance = new Blog(params)
		def blogContent = params.blogContent
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
		blogInstance.blogContent = blogTemp
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

        [blogInstance: blogInstance]
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

        blogInstance.properties = params
		def blogContent = params.blogContent
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
		blogInstance.blogContent = blogTemp

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
}
