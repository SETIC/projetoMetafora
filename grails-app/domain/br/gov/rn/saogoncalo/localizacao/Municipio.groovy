package br.gov.rn.saogoncalo.localizacao

class Municipio {

	String municipio
	
	static hasMany = [bairro:Bairro]
	static belongsTo = [estado:Estado]
	
	static constraints = {
		municipio blank:false, nullable:false
	}
	
	static mapping = {
		table name: "municipio", schema:"cadastro_unico_localizacao"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_localizacao.municipio_id_seq']
		}
}
