package com.ianholstead.programmingChallenge.shopping


class List {

	java.sql.Date date
	
	static hasMany = [listItems: ListItem]
	
    static mapping = {
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
