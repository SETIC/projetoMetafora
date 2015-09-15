package br.gov.rn.saogoncalo.protocolo

class TipoDocumento {
	String nome	
	
	static hasmany = [protocolo:Protocolo]
	
	static constraints = {
		nome blank:false, nullable:false
	}
	
	static mapping = {
		table name: "tipo_Documento", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.tipo_Documento_id_seq']
	}
}
