package ian.website

class PhotoAlbum {
	
	String name
	String summary
	java.sql.Date dateCreated
	
	static hasMany = [photos:Photo]
	
    static mapping = {
    }
    
	static constraints = {
		name unique: true, nullable: false, blank: false, shared: 'title'
		summary shared:'caption'
    }
	
	@Override 
	public String toString() {
		return "${name}";
	}
}
