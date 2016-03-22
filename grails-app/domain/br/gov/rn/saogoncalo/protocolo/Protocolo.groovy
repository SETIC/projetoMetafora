package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.Usuario

class Protocolo {

	String numero
	Date dataProtocolo
	Date dataEmissao
	String numeroDocumento
	FuncionarioSetor funcionarioSetor
	String interessado 

			
	static belongsTo = [tipoDocumento:TipoDocumento , situacao:Situacao, assunto:Assunto]
	static hasMany = [anexo:Anexo, observacao: Observacao , tramite:Tramite]
	
	static constraints = {
		numero blank:false, nullable:false
		dataProtocolo blank:false, nullable:false
		dataEmissao blank:false, nullable:false   
		interessado blank:true, nullable:true
	}
	
	static mapping = {
		table name: "protocolo", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.protocolo_id_seq']
	}
}
