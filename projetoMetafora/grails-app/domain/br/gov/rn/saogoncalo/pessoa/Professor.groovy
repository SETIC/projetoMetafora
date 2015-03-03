package br.gov.rn.saogoncalo.pessoa
import br.gov.rn.saogoncalo.academico.DisciplinaLecionadaPorProfessor

class Professor  {
	
	Funcionario funcionario	
	String identificacao
	
	static hasMany = [ disciplinaLecionadaPorProfessor: DisciplinaLecionadaPorProfessor]
	
	static constraints = {
	identificacao blank:true, nullable:true
	}
	static mapping = {
		table name: "professor", schema:"cadastro_unico_pessoal"
		funcionario column: 'id', insertable: false, updateable: false
		funcionario ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.professor_id_seq']
		
	}

}
