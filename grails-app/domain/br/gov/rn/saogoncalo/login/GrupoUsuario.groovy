package br.gov.rn.saogoncalo.login

class GrupoUsuario {

	
	static belongsTo = [usuario:Usuario, grupo:Grupo]
	
	
	
	static mapping = {
		table name: "grupo_usuario", schema:"login"
		version false
		id generator: 'sequence', params:[sequence:'login.grupo_usuario_id_seq']
	}
}
