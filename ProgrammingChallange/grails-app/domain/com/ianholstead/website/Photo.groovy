package com.ianholstead.website

import com.ianholstead.security.Role;

class Photo {

	byte[] photoPayload
	String photoOriginalName
	String photoName
	String photoCaption
	java.sql.Date date
	Boolean showOnHomePage = false
	String secureUrl
	
	Role authenticationLevel
	Thumb thumb
	static belongsTo = [album:PhotoAlbum]
	
    static mapping = {
    }
    
	static constraints = {
		photoPayload maxSize: 15728640, minSize:1
		photoName shared:'title'
		photoCaption shared:'caption'
		album nullable:false
		showOnHomePage validator : { val, obj ->
			!val || (obj.authenticationLevel.authority == 'ROLE_NONE')  
		}
		secureUrl unique:true
    }
	
	
	@Override
	public String toString() {
		return photoName
	}
	
	public def getUrl(){
		return this.photoName?.replace(' ', '-')
	}
}