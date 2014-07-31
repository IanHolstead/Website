package com.ianholstead.website

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ConfigController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMIN'])
    def index() {
        def configInstance = Config.get(1)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label')])
            redirect(uri:'/')
            return
        }

        render(view:"edit", model: [configInstance: configInstance])
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
		assert Config.count == 1
		assert Config.get(1)
		flash.message = message(code: 'default.updated.message', args: [message(code: 'config.label')])
        redirect(uri:'/')
    }
}
