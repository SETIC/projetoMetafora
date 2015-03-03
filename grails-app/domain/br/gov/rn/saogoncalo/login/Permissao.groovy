package br.gov.rn.saogoncalo.login

class Permissao {

	String permissao
	String tabela
	String esquema
	
	
	static belongsTo = [grupo:Grupo] 
	
	static constraints = {

		permissao blank:false, nullable:false
		tabela blank:false, nullable:false
		esquema blank:false, nullable:false
	}

	static mapping = {
		table name: "permissao", schema:"login"
		version false
		id generator: 'sequence', params:[sequence:'login.permissao_id_seq']
	}
}