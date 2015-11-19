package br.gov.rn.saogoncalo.pessoa

import java.util.Date;

class Documento {
	
	String arquivo
	Date dataDocumento
	
	static belongsTo = [aluno:Aluno]

	static constraints = {
		arquivo blank:false, nullable:false
		dataDocumento blank:false, nullable:false

	}
	
	static mapping = {
		table name: "Documento", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.documento_id_seq']
	}
}

   

