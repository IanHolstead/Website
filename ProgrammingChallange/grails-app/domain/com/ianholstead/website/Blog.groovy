package com.ianholstead.website

import com.ianholstead.security.Role;

class Blog {

	String blogTitle
	String blogSummary
	String blogContent
	java.sql.Date date
	String secureUrl
	
	Photo thumb
	Role authenticationLevel
	
    static mapping = {
		
    }
    
	static constraints = {
		blogTitle shared:'title'
		blogSummary shared:'caption'
		blogContent maxSize: 35000
		authenticationLevel nullable:false 
		secureUrl unique:true 
    }
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return blogTitle
	}
	
	public def getUrl(){
		this.blogTitle.replace(' ', '-')
	}
}
