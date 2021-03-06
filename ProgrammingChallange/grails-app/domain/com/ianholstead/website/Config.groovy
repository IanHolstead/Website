package com.ianholstead.website

class Config {

	String homeTitle
	String homeSubTitle
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
	
	String employPhone
	String employEmail
	
	Boolean shotsInTheDarkDownload
	Boolean shotsInTheDarkOnline
	Boolean borderlandsDemakeDownload
	Boolean borderlandsDemakeOnline
	
	String footerAboutInfo
	
    static mapping = {
    }
    
	static constraints = {
		homeTitle shared:'title'
		homeSubTitle shared:'title'
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
		
		employPhone nullable:false, blank:false, shared:'shortCaption'
		employEmail nullable:false, blank:false, shared:'shortCaption'
		
		footerAboutInfo nullable:false, blank:false, shared:'caption'
		
		shotsInTheDarkDownload nullable:false, blank:false
		shotsInTheDarkOnline nullable:false, blank:false
		borderlandsDemakeDownload nullable:false, blank:false
		borderlandsDemakeOnline nullable:false, blank:false
    }
	
}
