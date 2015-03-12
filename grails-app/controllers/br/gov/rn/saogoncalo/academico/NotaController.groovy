package br.gov.rn.saogoncalo.academico

class NotaController {


	def listar(){
		
		def notas = Nota.findAll()
		
		render (view:"/nota/listarNota.gsp", model:[notas:notas])
		
	}
	    
}
