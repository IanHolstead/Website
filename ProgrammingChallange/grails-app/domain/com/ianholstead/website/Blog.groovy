package com.ianholstead.website

import com.ianholstead.security.Role;

class Blog {

	String blogTitle
	String blogSummary
	String blogContent
	java.sql.Date date
	String secureUrl
	
	Role authenticationLevel
	
    static mapping = {
		
    }
    
	static constraints = {
		blogTitle nullable:false, blank:false, shared:'title',unique:true
		blogSummary shared:'caption'
		blogContent maxSize: 35000
		authenticationLevel nullable:true 
    }
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return blogTitle
	}
}
