package br.gov.rn.saogoncalo.pessoa

class PessoaJuridica {
	Pessoa pessoa
	String inscricaoEstadual
	String razaoSocial

	static constraints = {
	
		inscricaoEstadual blank:false, nullable:true
		razaoSocial blank:false, nullable:true
		
		}
	
	static mapping = {
		table name: "pessoa_juridica", schema:"cadastro_unico_pessoal"
		pessoa column: 'id', insertable: false, updateable: false, generator: 'assigned'
		pessoa ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.pessoa_juridica_id_seq']
	}
}
