package com.ianholstead.website

import com.ianholstead.security.Role;

class World {
	
	String title
	String summary
	String video
	String videoCaption
	String xkcd
	String xkcdCaption
	
	java.sql.Date date
	Integer status = 0 //0: unused, 1: current, 2:archived, 11:scheduled next, 12: scheduled two weeks...
	
	Blog blog
	Photo photo

    static mapping = {
		
	}
	
    static constraints = {
		title shared:'title'
		summary shared: 'caption'
		videoCaption shared:'caption'  
		xkcd url:true 
		xkcdCaption shared:'caption' 
    }
	
	@Override
	public String toString() {
		return title
	}
	
	public def getUrl(){
		return this.title?.replace(' ', '-')
	}
	
}
