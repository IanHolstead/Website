package com.ianholstead.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.website.Photo;
import com.ianholstead.website.Upload;

/**
 * UploadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UploadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(uri:'/')
    }

	@Secured(['ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [uploadInstanceList: Upload.list(params), uploadInstanceTotal: Upload.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [uploadInstance: new Upload(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def uploadInstance = new Upload(params)
		def uploadedFile = request.getFile('filePayload')
		uploadInstance.filePayload = uploadedFile.getBytes()
		uploadInstance.fileType = uploadedFile.contentType
        if (!uploadInstance.save(flush: true)) {
            render(view: "create", model: [uploadInstance: uploadInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'upload.label')])
        redirect(action: "show", id: uploadInstance.id)
    }

    def show() {	
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label')])
            redirect(uri:'/')
            return
        }
		
		if(uploadInstance.link){
			redirect(url:uploadInstance.link)
			return
		}

        return [uploadInstance: uploadInstance]
    }
	
	def showPayload(){
		def photoInstance = Photo.get(params.id)
		response.outputStream<<photoInstance.photoPayload
		response.outputStream.flush()
	}
	
	def fileDownload(){
		
	}

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label')])
            redirect(action: "list")
            return
        }

        [uploadInstance: uploadInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label')])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (uploadInstance.version > version) {
                uploadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'upload.label', default: 'Upload')] as Object[],
                          "Another user has updated this Upload while you were editing")
                render(view: "edit", model: [uploadInstance: uploadInstance])
                return
            }
        }

        uploadInstance.properties = params

        if (!uploadInstance.save(flush: true)) {
            render(view: "edit", model: [uploadInstance: uploadInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'upload.label')])
        redirect(action: "show", id: uploadInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def uploadInstance = Upload.get(params.id)
        if (!uploadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'upload.label')])
            redirect(action: "list")
            return
        }

        try {
            uploadInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'upload.label')])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'upload.label')])
            redirect(action: "show", id: params.id)
        }
    }
}
