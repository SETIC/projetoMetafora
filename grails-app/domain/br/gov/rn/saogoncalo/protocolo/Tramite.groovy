package br.gov.rn.saogoncalo.protocolo

class Tramite {
	
	Date dataDisponibilizacao
	Date dataRecebimento
	FuncionarioSetor funcionarioSetorOrigem
	FuncionarioSetor funcionarioSetorDestino

	String status

	static belongsTo = [protocolo:Protocolo]


	
	static constraints = {

		dataDisponibilizacao blank:false, nullable:true
		dataRecebimento blank:true, nullable:true
		status blank:false, nullable:false
		
	}
	
	static mapping = {
		table name: "tramite", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.tramite_id_seq']
	}
}