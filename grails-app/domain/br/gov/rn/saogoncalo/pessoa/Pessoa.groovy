package br.gov.rn.saogoncalo.pessoa


class Pessoa {
	String nome
	Date dataDeNascimento
	String cpfCnpj
	String status = 'Ativo'
	int escid
	int escIdDestino = 0

	static hasMany = [reside:Reside, parentesco:Parentesco, documento:Documento]
	
	static constraints = {
		
		nome blank:false,nullable:true
		dataDeNascimento blank:false,nullable:true
		cpfCnpj blank:true, nullable:true, unique:true	
		escid nullable: true, unique:false, blank:true 
		escIdDestino  unique:false		
		
	}
	static mapping = {
		table name: "pessoa", schema:"cadastro_unico_pessoal"
		escIdDestino defaultValue: 0
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.pessoa_id_seq']
	}
}
