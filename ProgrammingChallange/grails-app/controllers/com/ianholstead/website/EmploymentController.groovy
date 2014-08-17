package com.ianholstead.website

import grails.plugins.springsecurity.Secured
import grails.util.Environment

import org.apache.commons.lang.RandomStringUtils
import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.security.*

class EmploymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService

    def index() {
        def employmentInstance = Employment.findByUrl(params.id)
        if (!employmentInstance) {
            redirect(uri: "/invalidUrl")
            return
        }
		
		employmentInstance.views++
		
		employmentInstance.save(flush:true)

         render(view: "show", model: [employmentInstance: employmentInstance])
    }

	def getResume(){
		def test = Employment.findByUrl(params.id)
		if (!test) {
			//TODO something...
			return
		}
		
		def path
		
		Environment.executeForCurrentEnvironment {
			development {
		  		path = /X:\Users\Ian\Documents\Projects\Job Materials\ianholstead.pdf/
      		}
      		production {
		  		path = '/home/ianhols/Docs/ianholstead.pdf'
      		}
		}
		File resume = new File(path)
		response.outputStream<<resume.getBytes()
		response.outputStream.flush()
	}
	
	@Secured(['ROLE_SUPER_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [employmentInstanceList: Employment.list(params), employmentInstanceTotal: Employment.count()]
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def create() {
        [employmentInstance: new Employment(params)]
    }
	
	@Secured(['ROLE_SUPER_ADMIN'])
    def save() {
		String randomString = null
		while (!randomString || randomString == Employment.findByUrl(randomString)) {
			randomString = RandomStringUtils.random(10, ((('A'..'Z') + ('0'..'9')).join()).toCharArray())
		}
		params.url = randomString
        def employmentInstance = new Employment(params)
        if (!employmentInstance.save(flush: true)) {
            render(view: "create", model: [employmentInstance: employmentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'employ.label'), employmentInstance.id])
        redirect(action: "list")
    }
	
	@Secured(['ROLE_SUPER_ADMIN'])
	def editResume() {
		
	}
	
	@Secured(['ROLE_SUPER_ADMIN'])
	def updateResume() {
		
	}
	
	@Secured(['ROLE_SUPER_ADMIN'])
    def edit() {
        def employmentInstance = Employment.get(params.id)
        if (!employmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employ.label'), params.id])
            redirect(action: "list")
            return
        }

        [employmentInstance: employmentInstance]
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def update() {
        def employmentInstance = Employment.get(params.id)
        if (!employmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employ.label'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (employmentInstance.version > version) {
                employmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employ.label')] as Object[],
                          "Another user has updated this Employ while you were editing")
                render(view: "edit", model: [employmentInstance: employmentInstance])
                return
            }
        }

        employmentInstance.properties = params

        if (!employmentInstance.save(flush: true)) {
            render(view: "edit", model: [employmentInstance: employmentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'employ.label'), employmentInstance.id])
        redirect(action: "list")
    }

	@Secured(['ROLE_SUPER_ADMIN'])
    def delete() {
        def employmentInstance = Employment.get(params.id)
        if (!employmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employ.label'), params.id])
            redirect(action: "list")
            return
        }

        try {
            employmentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'employ.label'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employ.label'), params.id])
            redirect(action: "list", id: params.id)
        }
    }
}
