package br.gov.rn.saogoncalo.pessoa

class PessoaFisicaNecessidadesEspeciais {


	String observacao
	
	static belongsTo = [pessoaFisica:PessoaFisica, necessidadesEspeciais:NecessidadesEspeciais]
	
	static constraints = {
		observacao blank:true, nullable:true
	}
	
	static mapping = {
		table name: "pessoa_fisica_necessidades_especiais", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.pessoa_fisica_necessidades_especiais_id_seq']
		}
}
