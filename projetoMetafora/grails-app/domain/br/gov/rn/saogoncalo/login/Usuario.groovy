package br.gov.rn.saogoncalo.login

import br.gov.rn.saogoncalo.pessoa.Pessoa

class Usuario {
	
	String senha
	String username

	
	static hasMany = [grupoUsuario:GrupoUsuario]
	static belongsTo = [pessoa:Pessoa]
	
	static constraints = {
	
			senha blank:false, nullable:false
			username blank:false, nullable:false
		}
	
	static mapping = {
		table name: "usuario", schema:"login"
		
		version false
		id generator: 'sequence', params:[sequence:'login.usuario_id_seq']
	}
}
