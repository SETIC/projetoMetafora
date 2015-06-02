package br.gov.rn.saogoncalo.academico

class Frequencia {
	int quantFaltas
	
	static belongsTo = [aula:Aula, matricula:Matricula]


   static constraints = {
		quantFaltas unique:false, nullable:true, blank:true
	}

	static mapping = {
		table name: "frequencia", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.frequencia_id_seq']
	}
}
