package br.gov.rn.saogoncalo.protocolo

class Assunto {
	
	String assunto
	

	static hasMany = [protocolo:Protocolo]
	
	static constraints = {
		assunto blank:false, nullable:false
	}
	
	static mapping = {

		table name: "assunto", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.assunto_id_seq']


	}

}
