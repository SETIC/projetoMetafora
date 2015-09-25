package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController

class ProtocoloController {

	def listarPendentes(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm1 || perm2) {

				def setorDestino
				def tramites
				
				setorDestino = FuncionarioSetor.executeQuery("select fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
														+ "where u.pessoa.id = f.id "
														+ "and fs.funcionario.id = f.id "
														+ "and s.id = fs.setor.id "
														+ "and f.id = " + session["pesid"])
				
				tramites = Tramite.executeQuery("select t from Protocolo p, Tramite t where t.protocolo.id = p.id and t.dataRecebimento is null "
									+ " and t.funcionarioSetorDestino.id =:setorDestino", [setorDestino : setorDestino.id])
				
				render(view:"/protocolo/listarPendentes.gsp", model:[perm2:perm2,tramites:tramites])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}