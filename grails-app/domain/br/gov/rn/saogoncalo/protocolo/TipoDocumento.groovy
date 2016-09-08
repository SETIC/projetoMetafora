package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

class TipoDocumento {
	String nome	
	
	static hasmany = [protocolo:Protocolo]
	static belongsTo = [pessoaJuridica:PessoaJuridica]
	
	static constraints = {
		nome blank:false, nullable:false
	}
	
	static mapping = {


		table name: "tipo_documento", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.tipo_documento_id_seq']


	}
}
