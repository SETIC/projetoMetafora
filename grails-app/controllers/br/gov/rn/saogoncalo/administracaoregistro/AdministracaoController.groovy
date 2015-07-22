package br.gov.rn.saogoncalo.administracaoregistro

import br.gov.rn.saogoncalo.login.Usuario

class AdministracaoController {

    def index() { }
	
	
	
def salvaLog(int usuario, String observacao, String tipo, String tabela){

	Log log = new Log()
	log.observacao = observacao
	log.tipo = tipo
	log.tabela = tabela
	log.usuario = Usuario.get(usuario)
	
	if(log.save(flush:true) == false){
		render(view:"/error403.gsp")		
	}
	
	
	
}	
	
}
