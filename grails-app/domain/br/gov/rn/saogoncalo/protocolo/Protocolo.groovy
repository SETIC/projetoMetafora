package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.Usuario

class Protocolo {

	Long numero
	Date dataProtocolo
	Date dataEmissao
	String numeroDocumento
	String assunto
	FuncionarioSetor funcionarioSetor
	
	
	static belongsTo = [tipoDocumento:TipoDocumento , situacao:Situacao]
	static hasMany = [anexo:Anexo, tramite:Tramite]
	

	static constraints = {
		numero blank:false, nullable:false
		dataProtocolo blank:false, nullable:false
		dataEmissao blank:false, nullable:false
		assunto blank:false, nullable:false
		
	}
	
	static mapping = {
		table name: "protocolo", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.protocolo_id_seq']
	}
}
