package ian.website

class PhotoAlbum {
	
	String name
	java.sql.Date dateCreated
	
	static hasMany = [photos:Photo]
	
    static mapping = {
    }
    
	static constraints = {
		name unique: true
    }
	
	@Override 
	public String toString() {
		return "${name}";
	}
}
