import Role
import ian.security.Role
import ian.security.User
import ian.security.UserRole


class BootStrap {

   def init = { servletContext ->

	   def superAdminRole = new Role(authority: 'ROLE_SUPER_ADMIN').save(flush: true)//For Ian only
	   def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)//For admins, if such a day comes
	   def awesomeUserRole = new Role(authority:'ROLE_AWESOME_USER').save(flush: true)//For friends who can participate in programming chalanges 
	   def superUserRole = new Role(authority: 'ROLE_SUPER_USER').save(flush: true)//For close friends - all blogs can be seen
	   def userRole = new Role(authority: 'ROLE_USER').save(flush: true)//For the average friend
	   def ian = new User(username: '***REMOVED***', enabled: true, password: '***REMOVED***')
	   ian.save(flush: true)
	   def friend = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
	   friend.save(flush:true)
	   def family = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
	   family.save(flush:true)
	   def admin = new User(username:'***REMOVED***', enabled: true, password:'BlackHatGuy')
	   admin.save(flush:true)
	   def alicia = new User(username:'***REMOVED***', enabled: true, password:'***REMOVED***')
	   alicia.save(flush:true)
	   
	   UserRole.create ian, superAdminRole, true
	   UserRole.create friend, userRole, true
	   UserRole.create family, superUserRole, true
	   UserRole.create admin, adminRole, true
	   UserRole.create alicia, awesomeUserRole, true
	   
	   
	   assert User.count() == 5
	   assert Role.count() == 5
	   assert UserRole.count() == 5
   }
}
