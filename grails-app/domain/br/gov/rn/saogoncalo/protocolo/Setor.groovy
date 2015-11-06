package br.gov.rn.saogoncalo.protocolo

class Setor {
	String nome	
	String sigla

	static hasMany =[funcionarioSetor:FuncionarioSetor]
	
	static constraints = {
		nome blank:false, nullable:false
		sigla blank:false, nullable:false
	}
	
	static mapping = {
		table name: "setor", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.setor_id_seq']
	}
}
