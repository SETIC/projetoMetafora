package br.gov.rn.saoconcalo.organizacao

import br.gov.rn.saogoncalo.pessoa.Funcionario;

class Lotacao {
	
	 String situacao
	 String vinculo
	 String funcao
	 Date dataInicio
	 Date dataTermino
	 
	   static belongsTo =[funcionario:Funcionario, cargo:Cargo]
	   
	   static constraints = {
		   vinculo blank:false, nullable:false
		   
		   }
		   
		   
		   static mapping = {
			   table name: "lotacao", schema:"administracao_organizacao"
			   version false
			   id generator: 'sequence', params:[sequence:'administracao_organizacao.lotacao_id_seq']
		   }
   
 	 
    }

   
