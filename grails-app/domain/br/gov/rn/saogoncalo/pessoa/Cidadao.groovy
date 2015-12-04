package br.gov.rn.saogoncalo.pessoa



class Cidadao {
	PessoaFisica pessoaFisica
	String nacionalidade
	String rgNumero
	String estadoCivil
	String profissao
	
	Date rgDataDeEmissao
	String rgOrgaoExpeditor
	
	static constraints = {
		nacionalidade blank:false, nullable:true
		estadoCivil blank:false, nullable:false
		profissao blank:false, nullable:true
		rgNumero blank:true, nullable:true
		rgDataDeEmissao blank:true, nullable:true
		rgOrgaoExpeditor blank:true, nullable:true
		
		
	}
	
	static mapping = {
		table name: "cidadao", schema:"cadastro_unico_pessoal"
		pessoaFisica column: 'id', insertable: false, updateable: false, generator: 'assigned'
		pessoaFisica ignoreNotFound: true
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_pessoal.cidadao_id_seq']
	}
}
