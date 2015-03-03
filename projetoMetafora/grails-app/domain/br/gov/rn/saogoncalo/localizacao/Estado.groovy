package br.gov.rn.saogoncalo.localizacao

class Estado {
	
	String abreviacao
	String estado
	
	static hasMany = [municipio:Municipio]
	
	static constraints = {
		abreviacao blank:false, nullable:false, maxSize: 2
		estado blank:false, nullable:false
	}

	static mapping = {
		table name: "estado", schema:"cadastro_unico_localizacao"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_localizacao.estado_id_seq']
		}
	
	
	
}
