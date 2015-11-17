package br.gov.rn.saogoncalo.protocolo

class Observacao {
	String texto	
	Date dataObservacao

	
	
	static belongsTo = [protocolo:Protocolo]
	
	
	static constraints = {
		texto blank:false, nullable:false
		dataObservacao blank:false, nullable:false
	}
	
	static mapping = {
		table name: "observacao", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.observacao_id_seq']
	}
}
