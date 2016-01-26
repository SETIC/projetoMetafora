package br.gov.rn.saogoncalo.pessoa

class Contato {
	
	String contato

		static belongsTo = [tipoContato:TipoContato, pessoa:Pessoa]

	static constraints = {
		contato blank:false, nullable:false
	}
	
	static mapping = {
		table name: "contato", schema:"cadastro_unico_pessoal"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.contato_id_seq']
		}
}
