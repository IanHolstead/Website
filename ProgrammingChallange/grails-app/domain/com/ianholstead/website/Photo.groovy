package com.ianholstead.website

import com.ianholstead.security.Role;

class Photo {

	String photoOriginalName
	String photoExtension
	String photoName
	String photoCaption
	java.sql.Date date
	Boolean showOnHomePage = false
	String secureUrl
	
	Role authenticationLevel
	static belongsTo = [album:PhotoAlbum]
	
    static mapping = {
    }
    
	static constraints = {
		photoName shared:'title'
		photoCaption shared:'caption'
		photoExtension blank: false, nullable: false, maxSize:4, validator : { val, obj ->
			['png', 'jpg', 'jpeg', 'tiff', 'bmp', 'gif', 'svg'].contains(val)
		}
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
		return (this.photoName + '.' + this.photoExtension)
	}
	
	public def getPageUrl(){
		return (this.photoName?.replace(' ', '-'))
	}
}
