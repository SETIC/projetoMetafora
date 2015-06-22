package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.organizacao.Lotacao

class Funcionario {
	Cidadao cidadao
	String cargaHoraria
	String matricula
	
	static hasMany=[lotacao:Lotacao]
	
	static constraints = {
	
			cargaHoraria blank:true, nullable:true
			matricula blank:true, nullable:true
		}
	static mapping = {
		table name: "funcionario", schema:"cadastro_unico_pessoal"
		cidadao column: 'id', insertable: false, updateable: false
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.funcionario_id_seq']
	}
}
