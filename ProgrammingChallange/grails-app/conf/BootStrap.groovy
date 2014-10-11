import Role
import com.ianholstead.security.Role
import com.ianholstead.security.User
import com.ianholstead.security.UserRole
import com.ianholstead.website.PhotoAlbum
import com.ianholstead.website.Config

class BootStrap {

   def init = { servletContext ->
	   
	   def adminRole
	   
	   if(Role.count() == 0){
		   def superAdminRole = new Role(authority: 'ROLE_SUPER_ADMIN').save(flush: true)	//For Ian only
			   adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)				//For admins, if such a day comes
		   def awesomeUserRole = new Role(authority:'ROLE_AWESOME_USER').save(flush: true)	//For friends who can participate in programming challenges
		   def superUserRole = new Role(authority: 'ROLE_SUPER_USER').save(flush: true)		//For close friends - all blogs can be seen
		   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)				//For the average friend
		   def none = new Role(authority: 'ROLE_NONE').save(flush: true)					//Unauthenticated
	   }
	   else{
		   adminRole = Role.findByAuthority("ROLE_ADMIN")
		   assert adminRole
	   }
	   
	   assert Role.count() == 6
	   	   
	   def usertCount = Users.count()
	   if(UserRole.count() != userCount){
		   assert false //you need to fix dangling data
	   }
	   if(userCount ==0){
			 //create new users
	   }
	   
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
	   
	   if(Config.count == 0){
		   println "There is no config object!"
		   //TODO add config object of none exists
	   }
	   else if(!Config.get(1)){
		   println "There was more then one config object"
	   }
	   assert Config.get(1);
   }
}
