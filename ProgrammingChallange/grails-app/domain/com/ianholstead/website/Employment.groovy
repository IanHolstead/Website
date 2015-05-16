package com.ianholstead.website

/**
 * Employ
 * A domain class describes the data object and it's mapping to the database
 */
class Employment {

	String url
	Boolean phone = true
	Boolean email = true
	Boolean other = true
	Boolean resume = true
	Boolean games = false
	
	String about
	
	Integer views = -1
	Integer gameCounter = 0
	Integer resumeCounter = 0
	
	
    static mapping = {
    }
    
	static constraints = {
		url blank:false, nullable: false, unique:true, maxSize: 25 
		about shared:'shortCaption'
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${about}";
	}
}
