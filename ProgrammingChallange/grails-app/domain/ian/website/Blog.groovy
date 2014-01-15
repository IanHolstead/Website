package ian.website

class Blog {

	String blogTitle
	String blogSummary
	String blogContent
	java.sql.Date date
	
    static mapping = {
		
    }
    
	static constraints = {
		blogTitle nullable:false, blank:false, shared:'title',unique:true
		blogSummary shared:'caption'
		blogContent maxSize: 35000
    }
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return blogTitle
	}
}
