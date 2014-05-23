package ian.website

import ian.security.Role;

class PhotoAlbum {
	
	String name
	String summary
	java.sql.Date dateCreated
	
	Role authenticationLevel
	
	static hasMany = [photos:Photo]
	
    static mapping = {
    }
    
	static constraints = {
		name unique: true, nullable: false, blank: false, shared: 'title'
		summary shared:'caption'
    }
	
	@Override 
	public String toString() {
		return name;
	}
}
