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

		//add users here!
		
		assert UserRole.findAllByRole(superAdminRole).size() == 1

		if(!PhotoAlbum.findByName("Blog")){
			PhotoAlbum blog = new PhotoAlbum(name: "Blog", dateCreated: null, authenticationLevel: adminRole, )
			blog.save(flush:true)
		}
		assert PhotoAlbum.findByName("Blog")
		
		if(!PhotoAlbum.findByName("BlogThumbs")){
			PhotoAlbum blogThumbs = new PhotoAlbum(name: "BlogThumbs", dateCreated: null, authenticationLevel: adminRole, )
			blogThumbs.save(flush:true)
		}
		assert PhotoAlbum.findByName("BlogThumbs")

		if(Config.count() == 0){
			println "There is no config object!"
		}
		else if(!Config.get(1)){
			println "There was more then one config object"
		}
		assert Config.get(1);
	}
}
