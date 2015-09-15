package br.gov.rn.saogoncalo.protocolo

class TipoDocumento {
	String nome	

	
	
	
	static hasmany = [protocolo:Protocolo]
	
	
	
	static constraints = {
		nome blank:false, nullable:false
	}
	
	static mapping = {
		table name: "tipoDocumento", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.tipoDocumento_id_seq']
	}
}
