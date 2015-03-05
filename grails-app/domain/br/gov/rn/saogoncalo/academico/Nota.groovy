package br.gov.rn.saogoncalo.academico

class Nota {
	float pontuacao
	String observacao
	
	 static belongsTo = [matricula:Matricula, atividade:Atividade]

    static constraints = {
		pontuacao blank:false, nullable:false
		observacao blank:true, nullable:true
    }
	
	static mapping = {
		table name: "nota", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.nota_id_seq']
		}
}
