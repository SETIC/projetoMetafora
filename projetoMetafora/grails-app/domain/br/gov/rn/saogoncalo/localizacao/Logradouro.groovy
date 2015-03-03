package br.gov.rn.saogoncalo.localizacao

import br.gov.rn.saogoncalo.pessoa.Reside

class Logradouro {
	
	String logradouro
	
	static hasMany = [reside:Reside]
	static belongsTo = [tipoLogradouro:TipoLogradouro]
	
	static constraints = {
		logradouro blank:false, nullable:false
	}

	static mapping = {
		table name: "logradouro", schema:"cadastro_unico_localizacao"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_localizacao.logradouro_id_seq']
		}
}
