package br.gov.rn.saogoncalo.academico

class TipoDeAula {
String tipoDeAula

static hasMany = [aula:Aula]

static constraints = {
	tipoDeAula nullable:false, blank:false
	
}

static mapping = {
	table name: "tipo_aula", schema:"educacao_academico"
	version false
	id generator: 'sequence', params:[sequence:'educacao_academico.tipo_aula_id_seq']
}
}
