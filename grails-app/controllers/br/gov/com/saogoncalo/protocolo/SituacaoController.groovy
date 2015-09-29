package br.gov.com.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.protocolo.Situacao

class SituacaoController {

	def index() { }


	def cadastrar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"cadastrar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")

			if (perm2) {

				Situacao situacao = new Situacao(params)
				situacao.nome = params.nome
				situacao.tipo = params.tipo
				
                 println ("tiposituacao" + params.tipo)
				if (situacao.save(flush:true)){

					listarMensagem("Situacao cadastrada com sucesso", "ok")
				}else{
					listarMensagem("Erro ao salvar", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def listarMensagem(String msg, String tipo){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")

			if (perm1 || perm2) {

				def situacao = Situacao.findAll()
				if (tipo == "ok")

					render(view:"/situacao/listarSituacao.gsp", model:[situacao:situacao, ok:msg, perm2:perm2])
				else
					render(view:"/situacao/listarSituacao.gsp", model:[situacao:situacao, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass,  "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")

			if (perm2) {

				Situacao.deleteAll(Situacao.get(id))
				
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	
	def editarSituacao(long id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"listar"])
		}else{
		
			def user = session["user"]
			def pass = session["pass"]
            def situacoes
			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")
     
			if (perm2) {

				Situacao situacao = Situacao.get(id)
				situacoes = Situacao.findAll()

				render (view:"/situacao/editarSituacao.gsp", model:[situacoes:situacoes , situacao:situacao])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	
	
	def atualizar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"listar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")
		
					if (perm2) {
						
						def situacoes = Situacao.get(params.id)
						situacoes.nome = params.nome
						situacoes.tipo = params.tipo
						  
						  println("toi" +params)
						
						  if(situacoes.save(flush:true)){
							listarMensagem("Situaçao atualizada com sucesso", "ok")
						}else{
										
							listarMensagem("Erro ao atualizar", "erro")
						}
					}
				}
			}
		


	def listarSituacao(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")

			if (perm1 || perm2) {

				def situacao

				if (session["escid"] == 0) {

					situacao = Situacao.findAll()
				}else{

					situacao = Situacao.findAll()
				}
				render(view:"/situacao/listarSituacao.gsp", model:[situacao:situacao, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}






