package ian.programming.challenge

class UserProfile {
	
	String name
	String email
	Integer points
	

    static constraints = {
		name(blank: false)
		email(email: true, blank: false)
		points()
    }
	
	String toString() {
		"$name"
	}
	
}
