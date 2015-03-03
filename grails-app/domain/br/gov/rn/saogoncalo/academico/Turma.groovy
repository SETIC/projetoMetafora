package br.gov.rn.saogoncalo.academico
import br.gov.rn.saogoncalo.pessoa.Escola

class Turma {
	String turma
	int vagas
	int anoLetivo
	String turno
	
	static hasMany = [turmaDisciplina:TurmaDisciplina, matricula:Matricula]
	static belongsTo = [serie:Serie, escola:Escola]

	static constraints = {
		turma blank:false, nullable:false
		vagas blank:false, nullable:false
		anoLetivo blank:false, nullable:true 
		turno blank:false, nullable:true
	}
	static mapping = {
		table name: "turma", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.turma_id_seq']
		}
}
