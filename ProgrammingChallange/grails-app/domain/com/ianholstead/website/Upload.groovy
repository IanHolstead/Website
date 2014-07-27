package com.ianholstead.website

class Upload {
	
	String link
	Boolean isPicture
	String fileName
	String fileType
	Byte[] filePayload

    static constraints = {
		filePayload nullable:true, maxSize:52428800
//		fileName shared:'title'
    }
}
