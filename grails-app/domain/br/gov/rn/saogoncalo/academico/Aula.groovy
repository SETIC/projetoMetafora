package br.gov.rn.saogoncalo.academico

class Aula {
	Date dataAula
	String titulo
	String conteudo
	int quantHorarios
	
	static belongsTo = [turmaDisciplina:TurmaDisciplina, tipoAula:TipoDeAula]
	static hasMany = [frequencia:Frequencia]
	
    static constraints = {
		dataAula nullable:false, blank:false
		titulo unique:false, nullable:true, blank:true
		conteudo unique:false, nullable:true, blank:true, MaxSize:255
		quantHorarios unique:false, nullable:true, blank:true
	}

	static mapping = {
		table name: "aula", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.aula_id_seq']
	}
}
