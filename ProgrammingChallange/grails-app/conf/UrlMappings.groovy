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
//		"/about/computer"	(view:"siteinfo/computer")
		
		"/accessdenied"	(view:'/_errors/noAccess')
		
		/* 
		 * Pages with controller
		 * WARN: No domain/controller should be named "api" or "mobile" or "web"!
		 */
        "/"	{
			controller	= 'home'
			action		= { 'index' }
            view		= { 'index' }
        }
		"/s/$id"{
			controller 	= 'upload'
			action 		= 'show'
		}
		
		"/showPhoto/$id/$name"{
			controller 	= 'photo'
			action 		= 'showPayload'
		} 
		
		"/showThumb/$id/$name"{
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
		//"403"	(view:'/_errors/403')
		"404"	(view:'/_errors/404')
		"500"	(view:'/_errors/error')
		//"503"	(view:'/_errors/503')
	}
}
