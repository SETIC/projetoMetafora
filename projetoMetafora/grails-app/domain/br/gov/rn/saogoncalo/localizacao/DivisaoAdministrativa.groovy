package br.gov.rn.saogoncalo.localizacao

class DivisaoAdministrativa {

		String nome
		
		static constraints = {
			nome blank:false, nullable:false
		} 
		
		static beLongsTo = [municipio:Municipio]
	
		static mapping = {
			table name: "divisao_administrativa", schema:"cadastro_unico_localizacao"
			version false
			id generator: 'sequence', params:[sequence:'cadastro_unico_localizacao.divisao_administrativa_id_seq']
			}
		
		}
