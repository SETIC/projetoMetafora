package br.gov.rn.saogoncalo.administracaoregistro

import br.gov.rn.saogoncalo.login.Usuario


class Log {

	String tabela
	String tipo
	String observacao

	static belongsTo =[usuario:Usuario]

	static constraints = {
		tabela blank:true, nullable:true
		tipo blank:true, nullable:true
	}

	static mapping = {
		table name: "log", schema:"administracao_registro"
		version false
		id generator: 'sequence', params:[sequence:'administracao_registro.log_id_seq']
	}
}
