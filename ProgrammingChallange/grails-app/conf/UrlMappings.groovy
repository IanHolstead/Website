class UrlMappings {

	static mappings = {
		
		/* 
		 * Pages without controller 
		 */
		"/about"		(view:"/siteinfo/about")
		"/contact"		(view:"/siteinfo/contact")
		"/site"			(view:"/siteinfo/site")
		"/systeminfo"	(view:"/siteinfo/systeminfo")
		"/site/changelog"	(view:"/siteinfo/changelog")
		"/site/changelog/1.0.3"	(view:"/siteinfo/fullchangelogs/1.0.3")
		"/site/changelog/1.0.4"	(view:"/siteinfo/fullchangelogs/1.0.4")
		"/site/changelog/1.0.5"	(view:"/siteinfo/fullchangelogs/1.0.5")
		"/site/changelog/1.1.0" (view:"/siteinfo/fullchangelogs/1.1.0")
		
		"/accessdenied"	(view:'/_errors/noAccess')
		"/invalidUrl"	(view:'/_errors/politieNoAccess')
		"/robots.txt"	(view:'/siteinfo/robots')
		
		"/"	 (view:"/home/index")
		"/loginFail" {view = "/home/index"
			message = 'Login Failed!'//TODO: move this to i18n
		}
		
		/* 
		 * Pages with controller
		 * WARN: No domain/controller should be named "api" or "mobile" or "web"!
		 */
		"/s/$id"{
			controller 	= 'upload'
			action 		= 'show'
		}
		
		"/employ/$id"{
			controller	= 'employment'
			action		= 'index'
		}
		
		"/resume/$id/ianholstead.pdf"{
			controller 	= 'employment'
			action 		= 'getResume'
		}
		
		"/games/$id/BorderlandsDemake"{
			controller	= 'employment'
			action		= 'getBorderlandsDemake'
		}
		
		"/showPhoto/$id"{
			controller 	= 'photo'
			action 		= 'showPayload'
		} 
		
		"/showThumb/$id"{
			controller 	= 'photo'
			action 		= 'showThumb'
		}
		
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
		  	}
		}
		
		/* 
		 * System Pages without controller 
		 */
		"404"	(view:'/_errors/404')
		"500"	(view:'/_errors/error')
	}
}
