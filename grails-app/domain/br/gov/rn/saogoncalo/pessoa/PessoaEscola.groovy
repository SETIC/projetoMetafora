package br.gov.rn.saogoncalo.pessoa

class PessoaEscola {

	String tipo
	String ativo
	
	static belongsTo = [pessoa:Pessoa, escola:Escola]
	

	static constraints = {
		ativo blank:false, nullable:false
		tipo blank:false, nullable:false
	}
	
	static mapping = {
		table name: "pessoa_escola", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.pessoa_escola_id_seq']
		}
}
