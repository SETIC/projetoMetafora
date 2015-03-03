package br.gov.rn.saogoncalo.academico

class TurmaDisciplina {
	String identificacao
	Date dataInicio
	Date dataTermino
		
	static hasMany = [horario:Horario]
	
	static belongsTo = [turma:Turma, disciplinaLecionadaPorProfessor:DisciplinaLecionadaPorProfessor]
	
	
	static constraints = {
		identificacao unique:true, blank:false, nullable:false
		dataInicio nullable:false, blank:false
		dataTermino nullable:false, blank:false
	}
	static mapping = {
	table name: "turma_disciplina", schema:"educacao_academico"
	version false
	id generator: 'sequence', params:[sequence:'educacao_academico.turma_disciplina_id_seq']
	}
}
