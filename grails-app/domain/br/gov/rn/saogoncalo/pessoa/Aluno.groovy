package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.academico.Matricula

class Aluno {
	Cidadao cidadao	
	String numeroDeInscricao
	
	static hasMany = [matricula:Matricula , documento:Documento]
	
	static constraints = {
		numeroDeInscricao blank:true, nullable:true
	}
	
	static mapping = {
		table name: "aluno", schema:"cadastro_unico_pessoal"
		cidadao column: 'id', insertable: false, updateable: false
		cidadao ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.aluno_id_seq']
	}
}
