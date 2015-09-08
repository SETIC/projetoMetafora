package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.Usuario

class Protocolo {

	Long numero
	Date dataProtocolo
	Date dataEmissao
	String numeroDocumento
	String assunto
	FuncionarioSetor funcionarioSetorOrigem
	FuncionarioSetor funcionarioSetorDestino
	
	
	static belongsTo = [tipoDocumento:TipoDocumento , situacao:Situacao , usuario:Usuario]
	static hasMany = [anexo:Anexo,  anexo:Anexo , observacao:Observacao , tramite:Tramite]
	

	static constraints = {
		numero blank:false, nullable:false
		dataProtocolo blank:false, nullable:false
		dataEmissao blank:false, nullable:false
		assunto blank:false, nullable:false
		
	}
	
	static mapping = {
		table name: "Protocolo", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.protocolo_id_seq']
	}
}
