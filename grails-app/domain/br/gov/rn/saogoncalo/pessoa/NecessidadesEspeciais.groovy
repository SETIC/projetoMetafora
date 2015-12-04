package br.gov.rn.saogoncalo.pessoa

class NecessidadesEspeciais {


	
	String descricao 
	
	
	static hasMany = [pessoaFisicaNecessidadesEspeciasi:PessoaFisicaNecessidadesEspeciais]
	
	static constraints = {
		descricao blank:false, nullable:false
		
		
	}
	
	static mapping = {
		table name: "necessidades_especiais", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.necessidades_especiais_id_seq']
		}
	

}
