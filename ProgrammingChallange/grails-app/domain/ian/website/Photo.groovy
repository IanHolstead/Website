package ian.website

class Photo {

	byte[] photoPayload
	String photoOriginalName
	String photoName
	String photoCaption
	java.sql.Date date
	
	static belongsTo = [album:PhotoAlbum]
	
    static mapping = {
    }
    
	static constraints = {
		photoPayload maxSize: 1966080
		photoName shared:'title'
		photoCaption shared:'caption'
		album nullable:false
    }
	
	
	@Override
	public String toString() {
		return photoName
	}
}
