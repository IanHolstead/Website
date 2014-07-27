import Role
import com.ianholstead.security.Role
import com.ianholstead.security.User
import com.ianholstead.security.UserRole
import com.ianholstead.website.PhotoAlbum


class BootStrap {

   def init = { servletContext ->
	   
	   def adminRole
	   
	   if(User.count() == 0){
		   if(Role.count() !=0 || UserRole.count() !=0){
			   assert false
		   }
		   def superAdminRole = new Role(authority: 'ROLE_SUPER_ADMIN').save(flush: true)//For Ian only
		   	   adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)//For admins, if such a day comes
		   def awesomeUserRole = new Role(authority:'ROLE_AWESOME_USER').save(flush: true)//For friends who can participate in programming chalanges 
		   def superUserRole = new Role(authority: 'ROLE_SUPER_USER').save(flush: true)//For close friends - all blogs can be seen
		   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)//For the average friend
		   def none = new Role(authority: 'ROLE_NONE').save(flush: true)//Unauthenticated
		   def ian = new User(username: '***REMOVED***', enabled: true, password: '***REMOVED***')
		   ian.save(flush: true)
		   def friend = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
		   friend.save(flush:true)
		   def family = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
		   family.save(flush:true)
		   def admin = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
		   admin.save(flush:true)
		   def alicia = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
		   alicia.save(flush:true)
		   def mom = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
		   mom.save(flush:true)
		   
		   UserRole.create ian, superAdminRole, true
		   UserRole.create friend, userRole, true
		   UserRole.create family, superUserRole, true
		   UserRole.create admin, adminRole, true
		   UserRole.create alicia, awesomeUserRole, true
		   UserRole.create mom, adminRole, true
		   
		   assert User.count() == 6
		   assert Role.count() == 6
		   assert UserRole.count() == 6
	   }
	   else{
		   adminRole = Role.findByAuthority("ROLE_ADMIN")
	   }
	   
	   if(!PhotoAlbum.findByName("World")){
		   PhotoAlbum world = new PhotoAlbum(name: "World", dateCreated: null, authenticationLevel: adminRole, )
		   world.save(flush:true)
		   
		   assert PhotoAlbum.findByName("World")
	   }
	   if(!PhotoAlbum.findByName("Blog")){
		   PhotoAlbum blog = new PhotoAlbum(name: "Blog", dateCreated: null, authenticationLevel: adminRole, )
		   blog.save(flush:true)
		   
		   assert PhotoAlbum.findByName("Blog")
	   }
   }
}
