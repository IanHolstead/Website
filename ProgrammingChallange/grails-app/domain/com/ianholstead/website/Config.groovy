package com.ianholstead.website

class Config {

	String homeTitle
	String homeInfo
	
	String homeAboutInfo
	String homePhotoInfo
	String homeConnectInfo
	String homeProgrammingInfo
	String homeOtherInfo
	
	String contactInfo
	String contactCity
	String contactEmail
	String contactFacebook
	String contactLinkedIn
	String contactSkype
	String contactMapUrl
	
	String footerAboutInfo
	
    static mapping = {
    }
    
	static constraints = {
		homeTitle nullable:false, blank:false, shared:'title'
		homeInfo nullable:false, blank:false, shared:'caption'
		
		homeAboutInfo nullable:false, blank:false, shared:'shortCaption'
		homePhotoInfo nullable:false, blank:false, shared:'shortCaption'
		homeConnectInfo nullable:false, blank:false, shared:'caption'
		homeProgrammingInfo nullable:false, blank:false, shared:'caption'
		homeOtherInfo nullable:false, blank:false, shared:'caption'
			
		contactInfo nullable:false, blank:false, shared:'caption'
		contactCity nullable:false, blank:false, shared:'shortCaption'
		contactEmail nullable:false, blank:false, shared:'shortCaption'
		contactFacebook nullable:false, blank:false, shared:'shortCaption'
		contactLinkedIn nullable:false, blank:false, shared:'shortCaption'
		contactSkype nullable:false, blank:false, shared:'shortCaption'
		contactMapUrl nullable:false, blank:false, shared:'caption'
			
		footerAboutInfo nullable:false, blank:false, shared:'caption'
    }
	
	public static String getHomeTitle(){
		return this.get(1).homeTitle
	}
	
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
