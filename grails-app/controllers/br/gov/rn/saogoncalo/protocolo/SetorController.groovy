package br.gov.rn.saogoncalo.protocolo

import org.apache.jasper.compiler.Node.ParamsAction;

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
					funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
							" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
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
					funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
							" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
				}else{
					setor = Setor.findAll()
					funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
							" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
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

				println("Params - " + params)
				Setor setor = new Setor(params)
				Funcionario funcionario = new Funcionario()
				if (setor.save(flush:true)){

					def i, j, cont = 0
					def responsaveis = params.funcionariosResponsaveisHidden.split(' ')

					for(i=0; i < params.funcionarios.size(); i++) {

						funcionario = Funcionario.get(params.funcionarios[i])
						FuncionarioSetor funcionarioSetor = new FuncionarioSetor()
						funcionarioSetor.funcionario = funcionario
						funcionarioSetor.setor = setor
						println("Funcionarios --- " + params.funcionarios[i])
						println("Responsaveis --- " + responsaveis)

						println("responsaveis.size() --- " + responsaveis.size())
						cont = 0
						for(j=0; j<responsaveis.size();j++){

							println("responsaveis[j] --" + responsaveis[j] + " == " + params.funcionarios[i].toString().toInteger())
							if(responsaveis[j].toString() == params.funcionarios[i].toString()){
								cont = cont + 1
								println("contou")
							}
						}

						println("cont  -- " + cont)

						if(cont > 0){
							funcionarioSetor.responsavel = "True"
							println("maior")
						}else{
							//funcionarioSetor.responsavel = "False"
							println("menor")
						}

						cont = 0

						if (funcionarioSetor.save(flush:true)){
						}
					}

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
				def funcionarios = Funcionario.findAll()
				//def funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
				//			" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
				def funcionariosSetor = FuncionarioSetor.findAllBySetor(setor)
				def funcionariosSetorResponsaveis = FuncionarioSetor.findAllBySetorAndResponsavel(setor,'true')
				def funcionariosSetorNaoResponsaveis = FuncionarioSetor.findAllBySetorAndResponsavel(setor,'false')

				render (view:"/setor/editarSetor.gsp", model:[setor:setor, funcionarios:funcionarios, funcionariosSetor:funcionariosSetor, funcionariosSetorResponsaveis:funcionariosSetorResponsaveis, funcionariosSetorNaoResponsaveis:funcionariosSetorNaoResponsaveis])
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
					
					
					//deletar do banco quando não estiver na gsp
					def i, j, cont
					def funcionariosSetorBanco = FuncionarioSetor.findAllBySetor(setor)
					println("FuncionarioSetorBanco - " + funcionariosSetorBanco.funcionario.id.toList())
					println("FuncionariosGSP - " + params.funcionarios)
					
					for(i=0; i<funcionariosSetorBanco.size();i++){
												
						cont = 0
						for(j=0;j<params.funcionarios.size();j++){ 
							println("Teste - " + funcionariosSetorBanco[i].funcionario.id.toString() + " ==  " + params.funcionarios[j] )
							if(funcionariosSetorBanco[i].funcionario.id.toString() == params.funcionarios[j]){
								cont = cont + 1
								break;
							}
						}
						
						if(cont == 0){
							FuncionarioSetor funcionarioDelete = FuncionarioSetor.get(funcionariosSetorBanco[i].id)
							println("Funcionario pra deletar - " + funcionarioDelete.funcionario.id)
							funcionarioDelete.delete()
						}


					}
					

					def vetResponsaveis = params.funcionariosResponsaveisHidden.split(',')
					def vetNaoResponsaveis = params.funcionariosNaoResponsaveisHidden.split(',') 
					
					println("Responsaveis "  + vetResponsaveis)
					println("Não Responsaveis "  + vetNaoResponsaveis)
					
					//def func
					
					//inserir Não Responsaveis
					println("Tamanho - " + vetNaoResponsaveis.size())
					for(i=0; i<vetNaoResponsaveis.size(); i++){
						
						def funcionarioT = Funcionario.get(vetNaoResponsaveis[i].toString().toInteger())
						def funcT = FuncionarioSetor.findAllByFuncionario(funcionarioT)
						
						println("funcionario -- " + vetNaoResponsaveis[i] + " -- FuncionarioBanco: " + funcionarioT.id + " funcT: " + funcT.id)
						
						if(funcT.isEmpty()){ 
							println("Vasio -- " + vetNaoResponsaveis[i])
							FuncionarioSetor f = new FuncionarioSetor()
							f.funcionario = funcionarioT
							f.setor = setor
							f.responsavel = false
							if(f.save(flush:true)){
								
							}							
						}
					}
					
					//inserir Responsaveis
					println("Tamanho - " + vetResponsaveis.size())
					for(i=0; i<vetResponsaveis.size(); i++){
						
						def funcionarioR = Funcionario.get(vetResponsaveis[i].toString().toInteger())
						def funcR = FuncionarioSetor.findAllByFuncionario(funcionarioR)
						
						println("funcionario -- " + vetResponsaveis[i] + " -- FuncionarioBanco: " + funcionarioR.id + " funcT: " + funcR.id)
						
						if(funcR.isEmpty()){
							println("Vasio -- " + vetResponsaveis[i])
							FuncionarioSetor fr = new FuncionarioSetor()
							fr.funcionario = funcionarioR
							fr.setor = setor
							fr.responsavel = true
							if(fr.save(flush:true)){
								
							}
						}
					}
					
					
					
					
				/*	FuncionarioSetor f1 = new FuncionarioSetor()
					for(i=0; i<params.funcionariosResponsaveisHidden.size(); i++){
						Funcionario func2 = Funcionario.get(params.funcionariosResponsaveisHidden[i].toString().toInteger())
						if(func2 == null){
							
							f1.funcionario = func2
							f1.setor = setor
							f1.responsavel = 'true'
							//if(f1.save(flush:true)){
								
							//}
						}
					}
				*/	
					
					

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
