package br.gov.rn.saogoncalo.administracaoregistro

import br.gov.rn.saogoncalo.login.Usuario
import java.util.Date

class AdministracaoController {

    def index() { }
	
	
	
def salvaLog(int usuario, String observacao, String tipo, String tabela, Date data){

	Log log = new Log()
	log.observacao = observacao
	log.tipo = tipo
	log.tabela = tabela
	log.usuario = Usuario.get(usuario)
	log.data = data
	
	if(log.save(flush:true) == false){
		render(view:"/error403.gsp")		
	}
	
	
	
}	
	
}
