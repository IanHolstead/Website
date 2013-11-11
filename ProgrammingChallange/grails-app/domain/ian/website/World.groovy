package ian.website

class World {
	
	String title
	String summary
	String video
	String videoCaption
	String xkcd
	String xkcdCaption
	
	Blog blog
	Photo photo

    static mapping = {
		
	}
	
    static constraints = {
		title unique: true, shared:'title'
//		blogRestriction inList:['','friends','close friends', 'family', 'personal']
//		video  
		videoCaption shared:'caption'  
		xkcd url:true 
		xkcdCaption shared:'caption' 
//		img
		
    }
}
