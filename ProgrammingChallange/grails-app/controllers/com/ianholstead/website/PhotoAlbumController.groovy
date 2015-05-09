package com.ianholstead.website

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.ianholstead.website.Photo;
import com.ianholstead.website.PhotoAlbum;
import com.ianholstead.security.*

class PhotoAlbumController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.offset = params.int('offset')?:1//needs to be one higher since paginations sets it to 10
		def photoAlbumInstanceList = PhotoAlbum.list()
		def authId = getRole().id
		photoAlbumInstanceList.removeAll{
			it.authenticationLevel.id<authId || !Photo.findByAlbum(it)//the or checks that there is at least one photo in the album
		}
		def photoAlbumCount = photoAlbumInstanceList.size()
		if (photoAlbumCount != 0) {
			photoAlbumInstanceList = photoAlbumInstanceList.subList(params.offset-1, Math.min(params.offset-1 + params.max, photoAlbumCount))
		}
		
        [photoAlbumInstanceList: photoAlbumInstanceList, photoAlbumInstanceTotal: photoAlbumCount]
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
        [photoAlbumInstance: new PhotoAlbum(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
		params.authenticationLevel = Role.findByAuthority(params.authenticationLevel)
        def photoAlbumInstance = new PhotoAlbum(params)
        photoAlbumInstance.dateCreated = new java.sql.Date((new Date()).getTime())
		if (!photoAlbumInstance.save(flush: true)) {
            render(view: "create", model: [photoAlbumInstance: photoAlbumInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'photoAlbum.label')])
        redirect(action: "list")
    }

    def show() {
        def photoAlbumInstance = PhotoAlbum.get(getId(params.id))
		if (!photoAlbumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "list")
            return
        }
		
		if (photoAlbumInstance.authenticationLevel.id < getRole().id) {
			redirect(uri:'/accessdenied')
			return
		}
		
		def photos = Photo.findAllByAlbum(photoAlbumInstance)
		photos.sort(true) { a, b ->
			a.id <=> b.id
		}
		
		def authId = (int)getRole().id
		List albums = PhotoAlbum.list()
		albums.removeAll{
			it.authenticationLevel.id<authId || !Photo.findByAlbum(it)
		}
		albums.sort(true) { a, b ->
			a.id <=> b.id
		}
		
		def next
		def prev
		for(int i = 0; i<(albums.size()-1); i++){
			if(albums[i].id == photoAlbumInstance.id){
				next = albums[i+1]
				prev = albums[i-1]
			}
		}
		if(!next)
			next = albums[0]
		if(!prev){
			if(albums.size()>2)
				prev = albums[-2]
			else
				prev = albums[0]
		}

        [photoAlbumInstance: photoAlbumInstance, photos:photos, prev:prev, next:next]
    }

	@Secured(['ROLE_ADMIN'])
    def edit() {
        def photoAlbumInstance = PhotoAlbum.get(getId(params.id))
        if (!photoAlbumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "list")
            return
        }
		if(!validAlbum(photoAlbumInstance)){
			redirect(action: "list")
			return
		}

        [photoAlbumInstance: photoAlbumInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update() {
        def photoAlbumInstance = PhotoAlbum.get(params.id)
        if (!photoAlbumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoAlbumInstance.version > version) {
                photoAlbumInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photoAlbum.label')] as Object[],
                          "Another user has updated this PhotoAlbum while you were editing")
                render(view: "edit", model: [photoAlbumInstance: photoAlbumInstance])
                return
            }
        }
		params.authenticationLevel = Role.findByAuthority(params.authenticationLevel)
        photoAlbumInstance.properties = params

        if (!photoAlbumInstance.save(flush: true)) {
            render(view: "edit", model: [photoAlbumInstance: photoAlbumInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'photoAlbum.label')])
        redirect(action: "show", id: photoAlbumInstance.getUrl())
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def photoAlbumInstance = PhotoAlbum.get(getId(params.id))
        if (!photoAlbumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "list")
            return
        }
		if(!validAlbum(photoAlbumInstance)){
			redirect(action: "list")
			return
		}

        try {
            photoAlbumInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photoAlbum.label')])
            redirect(action: "show", id: params.id)
        }
    }
	
	protected def validAlbum(def instance){
		if(instance.name == 'World' || instance.name == 'Blog'){
			return false
		}
		return true
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
	
	protected getId(String name){
		def id = PhotoAlbum.findByName(name.replace('-', ' '))?.id
		id = id?:-1
	}
}
