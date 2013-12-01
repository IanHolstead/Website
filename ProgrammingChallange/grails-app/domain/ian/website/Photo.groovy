package ian.website

class Photo {

	byte[] photoPayload
	String photoOriginalName
	String photoName
	String photoCaption
	String album
	java.sql.Date date
	
    static mapping = {
    }
    
	static constraints = {
		photoPayload maxSize: 1966080
		photoName shared:'title'
		photoCaption shared:'caption'
		album maxLength:50
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return photoName
	}
}
