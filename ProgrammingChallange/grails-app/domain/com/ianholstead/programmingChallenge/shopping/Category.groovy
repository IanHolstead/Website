package com.ianholstead.programmingChallenge.shopping

class Category {

	String name
	
    static mapping = {
    }
    
	static constraints = {
		name(blank:false, nullable: false, maxLength: 100)
    }
	
	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
}
