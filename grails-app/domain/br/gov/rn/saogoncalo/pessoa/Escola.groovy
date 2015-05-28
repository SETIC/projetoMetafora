package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.academico.Sala
import br.gov.rn.saogoncalo.academico.Turma

class Escola {
	PessoaJuridica pessoaJuridica
	String inepDaEscola
	String latitude
	String longitude
	
	static hasMany = [sala:Sala, turma:Turma]
	//static belongsTo = [pessoa:Pessoa]
	
	static constraints = {
	
		inepDaEscola blank:false, nullable:true , unique:true
		
		}
	
	static mapping = {
		table name: "escola", schema:"cadastro_unico_pessoal"
		pessoaJuridica column: 'id', insertable: false, updateable: false, generator: 'assigned'
		pessoaJuridica ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.escola_id_seq']
	}
}
