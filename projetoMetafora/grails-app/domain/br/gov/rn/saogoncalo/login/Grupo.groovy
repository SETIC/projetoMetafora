package br.gov.rn.saogoncalo.login

class Grupo {
	String descricao
	String nome
	
	static hasMany = [grupoUsuario:GrupoUsuario]
	
	
	static constraints = {

		descricao blank:false, nullable:false
		nome blank:false, nullable:false
	}

	static mapping = {
		table name: "grupo", schema:"login"
		version false
		id generator: 'sequence', params:[sequence:'login.grupo_id_seq']
	}
}