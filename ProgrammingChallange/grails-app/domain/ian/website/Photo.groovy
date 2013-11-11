package ian.website

class Photo {

	byte[] photoPayload
	String photoName
	String photoCaption
	
    static mapping = {
    }
    
	static constraints = {
		photoPayload maxSize: 1966080
		photoName maxLength:50
		photoCaption maxLength:350 
    }
	
	
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
