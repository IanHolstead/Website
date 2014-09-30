package com.ianholstead.programmingChallenge.shopping
import org.springframework.dao.DataIntegrityViolationException

class ListController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [listInstanceList: List.list(params), listInstanceTotal: List.count()]
    }

    def create() {
		List listInstance = new List([date:createDate()])
		def weeklyItems = Item.findAllByWeekly(true)
		ListItem[] listItems
		weeklyItems.each{ itemInstance ->
			listItems.add(new ListItem(createListItem(itemInstance, listInstance, itemInstance.defaultNumber, itemInstance.notes)))
			listItems[-1].save()
			listInstance.addToListItems(listItems[-1])
		}
		if (!listInstance.save(flush: true)) {
			flash.message(message(code: 'list.create.failed.message'))
			render(view: "list", params: params)
			return
		}
		render(view: "show", params: params, model:[listInstance: listInstance, listItemInstanceList: listItems])
    }
	
	def addItem() {
		Item item = new Item(params)
		List list = List.get(params.listInstanceId)
		if (!item.save(flush: true)) {
			flash.message(message(code: 'list.add.failed.message'))
			render(view: "show", params: params)//TODO WHY U NO AJAX BRO
			return
		}
		ListItem listItem = new ListItem(createListItem(item, list, item.defaultNumber, item.notes))
		if (!listItem.save(flush: true)) {
			flash.message(message(code: 'list.add.failed.message'))
			render(view: "show", params: params)//TODO WHY U NO AJAX BRO
			return
		}
		render(view:show, params: params, model: [listInstance: list, itemInstanceList: list.listItems])//TODO WHY U NO AJAX BRO
	}

    def saveListItem() {
		List listInstance = List.get(params.id)
        listInstance.addToItems(Item.get(params.itemId))
        if (!listInstance.save(flush: true)) {
            flash.message(message(code: 'list.add.failed.message'))
			render(view: "show", model: [listInstance: listInstance, itemInstanceList: listInstance.items])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'item.label')])
        render(action: "show", id: itemInstance.id)
    }

    def show() {
        def listInstance = List.get(params.id)
        if (!listInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "list")
            return
        }

        [listInstance: listInstance, listItems:listInstance.listItems]
    }

    def edit() {
        def listInstance = List.get(params.id)
        if (!listInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "list")
            return
        }

        [listInstance: listInstance]
    }

    def update() {
        def listInstance = List.get(params.id)
        if (!listInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (listInstance.version > version) {
                listInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'list.label', default: 'List')] as Object[],
                          "Another user has updated this List while you were editing")
                render(view: "edit", model: [listInstance: listInstance])
                return
            }
        }

        listInstance.properties = params

        if (!listInstance.save(flush: true)) {
            render(view: "edit", model: [listInstance: listInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'list.label', default: 'List'), listInstance.id])
        redirect(action: "show", id: listInstance.id)
    }

    def delete() {
        def listInstance = List.get(params.id)
        if (!listInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "list")
            return
        }

        try {
            listInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'list.label', default: 'List'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	protected def createDate(){
		def todayDate = new java.sql.Date(new Date().time)
		todayDate.clearTime()
	}
	
	protected def createListItem(def itemInstance, def listInstance, int quantity, String notes) {
		[item: itemInstance, list: listInstance, quantity: quantity, notes:notes, status: false]
	}
}
