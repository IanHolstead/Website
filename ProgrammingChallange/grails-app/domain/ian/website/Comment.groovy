package ian.website

class Comment {

	String comment
	String name
	java.sql.Date date
	
	Comment nextComment = null
	
    static mapping = {
    }
    
	static constraints = {
    }
	

//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
