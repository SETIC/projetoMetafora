package br.gov.rn.saogoncalo.pessoa

class TipoContato {

	String tipoContato

	
	static hasMany = [contato:Contato]
	
	static constraints = {
		tipoContato blank:false, nullable:false
	}
	
	static mapping = {
		table name: "tipo_contato", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.tipo_contato_id_seq']
		}
	
}
