package ian.website

class World {
	
	String blogTitle
	String blog
	String blogRestriction
	String video
	String videoCaption
	String xkcd
	String xkcdCaption
//	Byte[] img
	String imgTitle
	String imgCaption

    static mapping = {
		blog type: 'text'
	}
	
    static constraints = {
		blogTitle unique: true, shared:'title'
		blogRestriction inList:['','friends','close friends', 'family', 'personal']
//		video  
		videoCaption shared:'caption'  
		xkcd url:true 
		xkcdCaption shared:'caption' 
//		img
		imgTitle shared:'title'
		imgCaption shared:'caption' 
		
    }
}
