package ian.website

class World {
	
	String title
	String summary
	String video
	String videoCaption
	String xkcd
	String xkcdCaption
	
	java.sql.Date date
	Integer status = 0 //0: unused, 1: current, 2:archived, 11:scheduled next, 12: scheduled two weeks...
	
	Blog blog
	Photo photo

    static mapping = {
		
	}
	
    static constraints = {
		title nullable:false, blank:false, shared:'title',unique:true
		summary shared: 'caption'
		videoCaption shared:'caption'  
		xkcd url:true 
		xkcdCaption shared:'caption' 
		
    }
}
