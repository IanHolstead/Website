package ian.programming.challenge


class ChallengesScore {
	
	Boolean completed
	Boolean winning
	Boolean languageBonus
	Boolean bonus
	Integer points
	UserProfile profile 
	Challenges challenge

	static belongsTo = [UserProfile, Challenges]
	
    static constraints = {
    }
	
	String toString(){
		return challenge
	}
}
