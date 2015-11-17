package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.pessoa.Funcionario

class FuncionarioSetor {
	
	boolean responsavel
    
	static belongsTo= [setor:Setor , funcionario:Funcionario]
	
	static mapping = {
		table name: "funcionario_setor", schema:"cadastro_unico_protocolo"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_unico_protocolo.funcionario_Setor_id_seq']
	}
}
