package programmingchallenge.web

class Challenges {
	
	String name
	String description
	Integer completionPoints = 1
	Integer winningPoints = 3
	Integer languageBonus = 1
	Integer bonusPoints = 1
	String bonusPointsDescription
	java.sql.Date startDate
	java.sql.Date endDate
	

    static constraints = {
		name blank: false
		description nullable: true, maxSize: 500
		completionPoints nullable:false, min: 1 
		winningPoints nullable:false
		languageBonus nullable:true 
		bonusPoints nullable:true 
		bonusPointsDescription nullable: true, maxSize: 160
		startDate()
		endDate()
    }
	
	String toString(){
		name
	}
}
