package br.gov.rn.saogoncalo.academico
import br.gov.rn.saogoncalo.pessoa.Aluno


class Matricula {
	Date dataDaMatricula
	String matricula
	String status
	Integer nivelEspecial


	static hasMany = [nota:Nota, frequencia:Frequencia]
	
	static belongsTo = [turma:Turma, aluno:Aluno]

	static constraints = {
		dataDaMatricula nullable:false, blank:false
		matricula unique:false, nullable:true, blank:true
		status unique:false, nullable:true, blank:true
		nivelEspecial nullable:true, blank:true
	}

	static mapping = {
		table name: "matricula", schema:"educacao_academico"
		version false
		id generator: 'sequence', params:[sequence:'educacao_academico.matricula_id_seq']
	}
}
