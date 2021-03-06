package com.ianholstead.website

import com.ianholstead.security.Role;

class PhotoAlbum {
	
	String name
	String summary
	java.sql.Date dateCreated
	
	Role authenticationLevel
	
	static hasMany = [photos:Photo]
	
    static mapping = {
    }
    
	static constraints = {
		name shared: 'title'
		summary shared:'caption'
    }
	
	@Override 
	public String toString() {
		return name;
	}
	
	public def getUrl(){
		return this.name?.replace(' ', '-')
	}
}
