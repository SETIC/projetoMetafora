package br.gov.rn.saogoncalo.protocolo

class Responsavel {
   
	
	
	static hasMany =[tramite:Tramite]
	static belongsTo = [funcionarioSetor:FuncionarioSetor]
	
	static mapping = {
		table name: "Responsavel", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.responsavel_id_seq']
	}
}
