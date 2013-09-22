package programmingchallange

class ChallengesScore {
	
	Boolean completed
	Boolean winning
	Boolean languageBonus
	Boolean bonus
	Integer points
	UserProfile profile 
	Challanges challange

	static belongsTo = [UserProfile, Challanges]
	
    static constraints = {
    }
	
	String toString(){
		"$challange"
	}
}
