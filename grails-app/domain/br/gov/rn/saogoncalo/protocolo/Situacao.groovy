package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

class Situacao {
	String nome
	String tipo

	static hasMany =[protocolo:Protocolo]
	static belongsTo = [pessoaJuridica:PessoaJuridica]

	static constraints = {
		nome blank:false, nullable:false
		tipo blank:false, nullable:false
	}

	static mapping = {
		table name: "situacao", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.situacao_id_seq']
	}
}