package br.gov.rn.saogoncalo.protocolo

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

class FileUploadServiceController {

    def index() { }
	
	boolean transaction = true
	
	def String uploadFile(MultipartFile file , String nome , String destinationDirectory){
		def serveltContext =  ServletContextHolder.servletContext
		def storagePath = servletContext.getRealPath(destinationDirectory)
		def storagePathDirectory = new File(storagePath)
		 if(!storagePathDirectory.exists())
		  println ("criando diretorio")
		    if(storagePathDirectory.mkdirs()){
				println ("success")
		   
		 }else{
		
			   println ("failed")
			}

		if(!file.isEmpty()){
			
			file.transferTo(new File(storagePath +"/" + nome))
			println("arquivo salvo")
			return("/anexos/" + nome)
			
		}else{
		
		    println("arquivo vazio")
		    return null
		  }
		}
}
