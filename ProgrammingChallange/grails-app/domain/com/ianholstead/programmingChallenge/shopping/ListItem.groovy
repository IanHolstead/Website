package com.ianholstead.programmingChallenge.shopping

/**
 * ListItem
 * A domain class describes the data object and it's mapping to the database
 */
class ListItem {

	Integer quantity
	Boolean status
	String notes
	
	static belongsTo	= [list: List, item: Item]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
    static mapping = {
    }
    
	static constraints = {
		quantity min:0,  max: 9002
		notes maxLength: 500
    }
	
	@Override
	public String toString() {
		return "${item}, ${quantity}";
	}
}
