package br.gov.rn.saogoncalo.academico

import br.gov.rn.saogoncalo.pessoa.Escola

class Sala {
	String sala
	int vagas
	
	static hasMany = [horario:Horario]
	
	static belongsTo = [escola:Escola]
	
	static constraints = {
		sala blank:false, nullable:false
		vagas blank:false, nullable:true
	}
	
	static mapping = {
		table name: "sala", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.sala_id_seq']
		}
}
