package br.gov.rn.saogoncalo.academico

class ConteudoDaDisciplina {
	String conteudoDaDisciplina
	
	static belongsTo = [disciplina:Disciplina]
	
	static constraints = {
		conteudoDaDisciplina blank:false, nullable:false
	}
	static mapping = {
		table name: "conteudo_da_disciplina", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.conteudo_da_disciplina_id_seq']
		}

}
