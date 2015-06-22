package br.gov.rn.saoconcalo.organizacao

import com.sun.org.apache.xpath.internal.operations.String

class Cargo {
	
	String cargo
	double moedaSalario
	
			static belongsTo = [lotacao:Lotacao]
			
			static constraints = {
				cargo blank:false, nullable:false
	
			}
			
			static mapping = {
				table name: "cargo", schema:"administracao_organizacao"
				version false
				id generator: 'sequence', params:[sequence:'administracao_organizacao.cargo_id_seq']
			}
		
		
	}
	
   

