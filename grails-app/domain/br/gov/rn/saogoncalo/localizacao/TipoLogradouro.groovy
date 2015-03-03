package br.gov.rn.saogoncalo.localizacao

class TipoLogradouro {

	String tipoLogradouro
	
	static hasMany = [logradouro:Logradouro]
	
	static constraints = {
		tipoLogradouro blank:false, nullable:false
	}

	static mapping = {
		table name: "tipo_logradouro", schema:"cadastro_unico_localizacao"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_localizacao.tipo_logradouro_id_seq']
		}
}
