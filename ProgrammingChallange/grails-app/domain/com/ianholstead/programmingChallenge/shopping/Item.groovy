package com.ianholstead.programmingChallenge.shopping


class Item {

	String item
	String notes
	Boolean weekly
	Integer defaultNumber
	
	Category category
	
    static mapping = {
    }
    
	static constraints = {
		item blank:false, nullable: false, maxLength: 100
		notes maxLength: 500
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${item}";
	}
}
