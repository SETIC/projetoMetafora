package br.gov.rn.saogoncalo.pessoa

class Parentesco{

		String parentesco

		static belongsTo = [pessoa:Pessoa, pessoaFisica:PessoaFisica]
		
		static constraints = {
			parentesco blank:false, nullable:false

		}
		
		static mapping = {
			table name: "parentesco", schema:"cadastro_unico_pessoal"
			version false
			id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.parentesco_id_seq']
		}
	
	
}
