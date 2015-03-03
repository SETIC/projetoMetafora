import grailslibrary.*
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		if (GrailsUtil.environment == "production" ) return
    }
    def destroy = {
    }
}
