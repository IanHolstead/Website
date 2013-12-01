package ian.website

class Upload {
	
	Boolean isLink
	String link
	String fileName
	String fileType
	Byte[] filePayload

    static constraints = {
		filePayload nullable:true, maxSize:52428800
//		fileName shared:'title'
    }
}
