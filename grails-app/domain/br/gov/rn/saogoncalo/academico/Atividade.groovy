package br.gov.rn.saogoncalo.academico

class Atividade {
	
	
	String nomeAtividade
	float notaMaxima
	int pesoAtividade
	Date dataInicio
	Date dataFim
	String descricaoAtividade
	
	static belongsTo = [turmaDisciplina:TurmaDisciplina]
	
	static hasMany = [nota:Nota]
	
	
    static constraints = {
		nomeAtividade blank:false, nullable:false
		notaMaxima blank:false, nullable:false
		pesoAtividade blank:false, nullable:false
		
    }
	
	static mapping = {
		table name: "atividade", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.atividade_id_seq']
		}
}
