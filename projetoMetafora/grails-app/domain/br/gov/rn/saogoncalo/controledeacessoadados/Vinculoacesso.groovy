package br.gov.rn.saogoncalo.controledeacessoadados

class Vinculoacesso {

	String tabela
	String esquema
	int idtabela //id da tabela
	int idescola
	
	static constraints = {
	
			tabela blank:false, nullable:false
			esquema blank:false, nullable:false
			idtabela nullable:false
			idescola nullable:false 
		}
	
	static mapping = {
		table name: "vinculo_acesso", schema:"controle_de_acesso_a_dado"
		version false
		id generator: 'sequence', params:[sequence:'controle_de_acesso_a_dado.vinculo_acesso_id_seq']
	}
}
