import Role
import com.ianholstead.security.Role
import com.ianholstead.security.User
import com.ianholstead.security.UserRole
import com.ianholstead.website.PhotoAlbum
import com.ianholstead.website.Config

class BootStrap {

	def init = { servletContext ->

		def superAdminRole
		def adminRole
		def awesomeUserRole
		def superUserRole
		def userRole
		def none

		if (Role.count() == 0) {
			superAdminRole = new Role(authority: 'ROLE_SUPER_ADMIN').save(flush: true)	//For Ian only
			adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)				//For admins, if such a day comes
			awesomeUserRole = new Role(authority:'ROLE_AWESOME_USER').save(flush: true)	//For friends who can participate in programming chalanges
			superUserRole = new Role(authority: 'ROLE_SUPER_USER').save(flush: true)	//For close friends - all blogs can be seen
			userRole = new Role(authority: 'ROLE_USER').save(flush: true)				//For the average friend
			none = new Role(authority: 'ROLE_NONE').save(flush: true)					//Unauthenticated
		}
		else{
			adminRole = Role.findByAuthority("ROLE_ADMIN")
			superAdminRole = Role.findByAuthority("ROLE_SUPER_ADMIN")
		}

		assert Role.count() == 6


		if(!User.findByUsername('***REMOVED***')){
			def ian = new User(username: '***REMOVED***', enabled: true, password: '***REMOVED***')
			ian.save(flush: true)
			UserRole.create ian, superAdminRole, true
		}
		if(!User.findByUsername('***REMOVED***')){
			def friend = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			friend.save(flush:true)
			UserRole.create friend, userRole, true
		}
		if(!User.findByUsername('***REMOVED***')){
			def family = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			family.save(flush:true)
			UserRole.create family, superUserRole, true
		}
		if(!User.findByUsername('***REMOVED***')){//for testing purposes
			def admin = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			admin.save(flush:true)
			UserRole.create admin, adminRole, true
		}
		if(!User.findByUsername('***REMOVED***')){//for testing purposes
			def alicia = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			alicia.save(flush:true)
			UserRole.create alicia, awesomeUserRole, true
		}
		if(!User.findByUsername('***REMOVED***')){
			def mom = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			mom.save(flush:true)
			UserRole.create mom, adminRole, true
		}
		if(!User.findByUsername('***REMOVED***')){
			def karen = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
			karen.save(flush:true)
			UserRole.create karen, adminRole, true
		}
		
		assert UserRole.findAllByRole(superAdminRole).size() == 1

		if(!PhotoAlbum.findByName("World")){
			PhotoAlbum world = new PhotoAlbum(name: "World", dateCreated: null, authenticationLevel: adminRole, )
			world.save(flush:true)
		}
		if(!PhotoAlbum.findByName("Blog")){
			PhotoAlbum blog = new PhotoAlbum(name: "Blog", dateCreated: null, authenticationLevel: adminRole, )
			blog.save(flush:true)
		}
		assert PhotoAlbum.findByName("World")
		assert PhotoAlbum.findByName("Blog")

		if(Config.count() == 0){
			println "There is no config object!"
		}
		else if(!Config.get(1)){
			println "There was more then one config object"
		}
		assert Config.get(1);
	}
}
