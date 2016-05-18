package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

class SituacaoController {

	def index() { }


	def salvar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Situacao", act:"salvar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SITUACAO", "2")

			if (perm2) {

				Situacao situacao = new Situacao(params)
				situacao.nome = params.nome
				situacao.tipo = params.tipo
				
				def pessoaJuridica = PessoaJuridica.get(session["escid"])
				situacao.pessoaJuridica = pessoaJuridica
				
                 println ("tiposituacao" + params.tipo)
				if (situacao.save(flush:true)){

					//listarMensagem("Situacao cadastrada com sucesso", "ok")
					redirect(action:"listarSituacao", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
				}else{
					redirect(action:"listarSituacao", params:[msg:"Erro ao cadastrar", tipo:"erro"])
					//listarMensagem("Erro ao salvar", "erro")
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

				def pessoaJuridica = PessoaJuridica.get(session["escid"])
				def situacao = Situacao.findAllByPessoaJuridica(pessoaJuridica)
				
				
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
				
				redirect(action:"listarSituacao", params:[msg:"Deletado com sucesso!", tipo:"ok"])
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
						def pessoaJuridica = PessoaJuridica.get(session["escid"])
						situacoes.pessoaJuridica = pessoaJuridica
						
						
						  println("toi" +params)
						
						  if(situacoes.save(flush:true)){
							//listarMensagem("Situaçao atualizada com sucesso", "ok")
							redirect(action:"listarSituacao", params:[msg:"Atualizado com sucesso", tipo:"ok"])
						}else{
						redirect(action:"listarSituacao", params:[msg:"Erro ao atualizar", tipo:"erro"])
							//listarMensagem("Erro ao atualizar", "erro")
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
				def msg

				msg = params.msg
				
				if (session["escid"] == 0) {
					
					situacao = Situacao.findAll()
				}else{

					situacao = Situacao.findAll()
					def pessoaJuridica = PessoaJuridica.get(session["escid"])
					situacao = Situacao.findAllByPessoaJuridica(pessoaJuridica)
					
				}
				render(view:"/situacao/listarSituacao.gsp", model:[ok:msg, situacao:situacao, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}






