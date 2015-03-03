package br.gov.rn.saogoncalo.pessoa

class PessoaFisica {
	Pessoa pessoa
	String rcNumero
	String rcNomeDoCartorio
	String rcNomeDoLivro
	String rcFolhaDoLivro
	String sexo

	static constraints = {
	
		rcNumero blank:true, nullable:true
		rcNomeDoCartorio blank:true, nullable:true
		rcNomeDoLivro blank:true, nullable:true
		rcFolhaDoLivro blank:true, nullable:true
		sexo blank:false, nullable:true
		
		}
	
	static mapping = {
		table name: "pessoa_fisica", schema:"cadastro_unico_pessoal"
		pessoa column: 'id', insertable: false, updateable: false, generator: 'assigned'
		pessoa ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.pessoa_fisica_id_seq']
	}
}
