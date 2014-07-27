dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			driverClassName = "com.mysql.jdbc.Driver"
			username = "ianholstead"
			password = "TriAngSkiSeaDb.93"
            url = "jdbc:mysql://localhost/programming_challanges_dev"
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            dialect=org.hibernate.dialect.MySQL5InnoDBDialect
			driverClassName = "com.mysql.jdbc.Driver"
			jndiName="java:comp/env/WebDb"
        }
    }
}
