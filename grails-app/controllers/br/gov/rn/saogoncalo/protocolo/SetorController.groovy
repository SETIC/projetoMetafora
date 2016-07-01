package br.gov.rn.saogoncalo.protocolo

import groovy.sql.Sql
import java.sql.Driver
import javax.lang.model.type.UnionType;

import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Funcionario
import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

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
			def msg
			
			
			if (perm1 || perm2) {

				def setor
				def funcionarios
				
				msg = params.msg

				if (session["escid"] == 0) {
					setor = Setor.findAll()

					funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
							" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
				}else{
										
					def pessoaJuridica = PessoaJuridica.get(session["escid"])
					setor = Setor.findAllByPessoaJuridica(pessoaJuridica)
					
					/*funcionarios = Funcionario.executeQuery("select f from Funcionario f " +
							" where f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")*/
					
					funcionarios = Funcionario.executeQuery("select f from Funcionario f, Pessoa as p " + 
						" where f.id = p.id " +
					    " and p.escid = "+ session["escid"] +
						" and f.id not in (select fs.funcionario.id from FuncionarioSetor fs)")
					
					print ("FUNCIONÁRIOS NORMAL >>> " + funcionarios)

				}
			
				render(view:"/setor/listarSetor.gsp", model:[ok:msg, setor:setor, perm2:perm2, funcionarios:funcionarios])
			}else{
				render(view:"/error403.gsp", model:[erro:msg])
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
									
					def pessoaJuridica = PessoaJuridica.get(session["escid"])
					setor = Setor.findAllByPessoaJuridica(pessoaJuridica)
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
				
				def pessoaJuridica = PessoaJuridica.get(session["escid"])
				setor.pessoaJuridica = pessoaJuridica 
				
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

					redirect(action:"listarSetor", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
					//listarMensagem("Setor cadastrada com sucesso", "ok")
				}else{
				
				redirect(action:"listarSetor", params:[msg:"Erro ao cadastrar", tipo:"erro"])
					//listarMensagem("Erro ao salvar", "erro")
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

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")

				def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)
				def sql = new Sql(conn)
				
				Setor setor = Setor.get(id)
				
				 def funcionarios = sql.rows(" select p.id, p.nome, fs.setor_id as setor from cadastro_unico_pessoal.Funcionario f, cadastro_unico_pessoal.Pessoa as p , cadastro_unico_protocolo.Funcionario_Setor as fs"+
				" where f.id = p.id"+
				" and fs.funcionario_id = f.id"+
				" and fs.setor_id = " + id.toString() +
				" union " +
				" select pt.id, pt.nome, '0' as setor from cadastro_unico_pessoal.Funcionario as ft, cadastro_unico_pessoal.Pessoa as pt"+
				" where ft.id not in (select fs.funcionario_id from cadastro_unico_protocolo.Funcionario_Setor fs)" +
				" and pt.escid = " + session["escid"] +
				" and pt.id = ft.id") 
					
				def funcionariosSetor = FuncionarioSetor.findAllBySetor(setor)
				def funcionariosSetorResponsaveis = FuncionarioSetor.findAllBySetorAndResponsavel(setor,'true')
				def funcionariosSetorNaoResponsaveis = FuncionarioSetor.findAllBySetorAndResponsavel(setor,'false')
				sql.close()
				conn.close()
				
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
				def pessoaJuridica = PessoaJuridica.get(session["escid"])
				setor.pessoaJuridica = pessoaJuridica

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

					//listarMensagem("Setor atualizado com sucesso", "ok")
					redirect(action:"listarSetor", params:[msg:"Atualizado com sucesso", tipo:"ok"])
				}else{
					redirect(action:"listarSetor", params:[msg:"Erro ao atualizar", tipo:"erro"])
					//listarMensagem("Erro ao atualizar", "erro")
				
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


				redirect(action:"listarSetor", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}