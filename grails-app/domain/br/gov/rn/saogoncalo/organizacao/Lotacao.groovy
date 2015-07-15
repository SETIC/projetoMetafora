package br.gov.rn.saogoncalo.organizacao

import br.gov.rn.saogoncalo.pessoa.Funcionario;

class Lotacao {
	
	 String situacao
	 String vinculo
	 String funcao
	
	 Date dataInicio
	 Date dataTermino
	 String turno
	 
	   static belongsTo =[funcionario:Funcionario, cargo:Cargo]
	   
	   static constraints = {
		   turno blank:true, nullable:true
		   vinculo blank:false, nullable:false
		   
		   }
		   
		   static mapping = {
			   table name: "lotacao", schema:"administracao_organizacao"
			   version false
			   id generator: 'sequence', params:[sequence:'administracao_organizacao.lotacao_id_seq']
		   }
   
 	 
    }

   
