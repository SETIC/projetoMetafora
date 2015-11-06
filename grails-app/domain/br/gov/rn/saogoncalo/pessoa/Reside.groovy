package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.localizacao.Bairro
import br.gov.rn.saogoncalo.localizacao.Logradouro

class Reside {
	
	String numero 
	String complemento	
	String cep
	
	
	static belongsTo = [pessoa:Pessoa, bairro:Bairro, logradouro:Logradouro]
	
	static constraints = {
		numero blank:false, nullable:false
		complemento blank:true, nullable:true
		
	}
	
	static mapping = {
		table name: "reside", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.reside_id_seq']
		}
	
}
