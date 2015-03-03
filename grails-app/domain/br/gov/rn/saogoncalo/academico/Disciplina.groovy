package br.gov.rn.saogoncalo.academico

class Disciplina {
	String disciplina
	String cargaHoraria

	static hasMany = [disciplinaLecionadaPorProfessor:DisciplinaLecionadaPorProfessor, conteudoDisciplina:ConteudoDaDisciplina]
	

	static constraints = {
		disciplina blank:false, nullable:false
		cargaHoraria blank:false, nullable:false
	}
	static mapping = {
		table name: "disciplina", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.disciplina_id_seq']
		}
}
