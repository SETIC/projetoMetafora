package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Funcionario

class SetorController {

	def index() { }

	def listarSetor(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm1 || perm2) {

				def setor
				def funcionarios

				if (session["escid"] == 0) {
					setor = Setor.findAll()
					funcionarios = Funcionario.executeQuery("select f from Funcionario f " + 
                                                            " where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
				}else{
					setor = Setor.findAll()
					funcionarios = Funcionario.executeQuery("select f from Funcionario f where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
				}

				render(view:"/setor/listarSetor.gsp", model:[setor:setor, perm2:perm2, funcionarios:funcionarios])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	def listarMensagem (String msg , String tipo ){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")
		
					if (perm1 || perm2) {
								
						def setor
						def funcionarios
		
						if (session["escid"] == 0) {
		
							setor = Setor.findAll()
							funcionarios = FuncionarioSetor.findAll()

						}else{
							setor = Setor.findAll()
							funcionarios = FuncionarioSetor.findAll()
						}
		
						if (tipo == "ok"){
		
							render(view:"/setor/listarSetor.gsp", model:[setor:setor, ok:msg, perm2:perm2, funcionarios:funcionarios])
		
						}else
							render(view:"/setor/listarSetor.gsp", model:[setor:setor, erro:msg, perm2:perm2, funcionarios:funcionarios])
					}else{
						render(view:"/error403.gsp")
					}
				}
			}
	
	
	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm2) {

				Setor setor = new Setor(params)
				if (setor.save(flush:true)){
					
					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), " Salvo Setor " + setor.id.toString(), "Create", "Setor", date)

					listarMensagem("Setor cadastrada com sucesso", "ok")
				}else{

					listarMensagem("Erro ao salvar", "erro")
				}

			}else{
				render(view:"/error403.gsp")

			}
		}
	}
	
	
	def editarSetor(long id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm2) {

				Setor setor = Setor.get(id)

				render (view:"/setor/editarSetor.gsp", model:[setor:setor])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	
	def atualizar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")
		
					if (perm2) {
		
		
						def setor = Setor.get(params.id)
		
						setor.nome = params.nome
						setor.sigla = params.sigla
		
		
						if(setor.save(flush:true)){
							
							def date = new Date()
							AdministracaoController adm = new AdministracaoController()
		
							adm.salvaLog(session["usid"].toString().toInteger(), " Atualizada Setor " + setor.id.toString(), "Update", "Setor", date)

							listarMensagem("Setor atualizado com sucesso", "ok")
						}else{
							listarMensagem("Erro ao atualizar", "erro")
						}
					}
				}
			}
	
	
	
	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Setor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm2) {

				Setor.deleteAll(Setor.get(id))
				
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "Deletar Setor: " + id, "DELETE", "Setor", date)

				
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
}
