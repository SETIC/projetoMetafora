package br.gov.rn.saogoncalo.protocolo

class Anexo {
	String arquivo	
	Date dataAnexo
	
	
	static belongsTo = [protocolo:Protocolo]
	

	static constraints = {
		arquivo blank:false, nullable:false
		dataAnexo blank:false, nullable:false
	}
	
	static mapping = {
		table name: "Anexo", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.anexo_id_seq']
	}
}
