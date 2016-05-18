package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

class Assunto {

	String assunto

	static hasMany = [protocolo:Protocolo]
	static belongsTo = [pessoaJuridica:PessoaJuridica]

	static constraints = {
		assunto blank:false, nullable:false
	}

	static mapping = {

		table name: "assunto", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.assunto_id_seq']
	}
}
