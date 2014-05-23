package ian.security


class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	@Override
	public String toString() {
//		def role = authority.split('_')
//		role = role[1].toLowerCase().capitalize()
		return authority
	}
}
