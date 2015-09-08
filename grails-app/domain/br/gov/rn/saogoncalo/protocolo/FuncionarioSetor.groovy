package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.pessoa.Funcionario

class FuncionarioSetor {
	
	
    
	
	static hasMany =[responsavel:Responsavel]
	static belongsTo= [setor:Setor , funcionario:Funcionario]
	
	static mapping = {
		table name: "FuncionarioSetor", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.funcionarioSetor_id_seq']
	}
}
