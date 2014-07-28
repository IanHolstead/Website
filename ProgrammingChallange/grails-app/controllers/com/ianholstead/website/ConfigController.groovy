package com.ianholstead.website

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ConfigController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(uri:'/')
    }
	
	@Secured(['ROLE_ADMIN'])
    def edit() {
        def configInstance = Config.get(1)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label')])
            redirect(uri:'/')
            return
        }

        [configInstance: configInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def configInstance = Config.get(1)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label')])
            redirect(uri:'/')
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (configInstance.version > version) {
                configInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'config.label')] as Object[],
                          "Another user has updated this Config while you were editing")
                render(view: "edit", model: [configInstance: configInstance])
                return
            }
        }

        configInstance.properties = params

        if (!configInstance.save(flush: true)) {
            render(view: "edit", model: [configInstance: configInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'config.label')])
        redirect(uri:'/')
    }
}
