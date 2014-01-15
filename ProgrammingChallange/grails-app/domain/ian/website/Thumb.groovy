package ian.website

/**
 * Thumb
 * A domain class describes the data object and it's mapping to the database
 */
class Thumb {

	byte[] thumbPayload
	
	static belongsTo	= [photo:Photo]	
	
    static mapping = {
    }
    
	static constraints = {
		thumbPayload maxSize: 15728640
    }
	
}
