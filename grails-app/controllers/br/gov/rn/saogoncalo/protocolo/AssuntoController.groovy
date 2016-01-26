package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController

class AssuntoController {

	    def index() { }

		def listar(){
			
					if((session["user"] == null) || (session["pass"] == null) ){
						render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"listar"])
					}else{
						def user = session["user"]
						def pass = session["pass"]
			
						def usuario = new UsuarioController()
			
						def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
						def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
			
						if (perm1 || perm2) {
			
							def assunto
							def msg
							
							msg = params.msg
			
							if (session["escid"] == 0) {
			
								assunto = Assunto.findAll()
							
								}else{
			
								assunto = Assunto.findAll()
	
							}
							render(view:"/assunto/listarAssunto.gsp", model:[ok:msg, assunto:assunto, perm2:perm2])
						}else{
							render(view:"/error403.gsp")
						}
					}
				}
		
		def deletar(int id){
			
			if((session["user"] == null) || (session["pass"] == null) ){
				render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"listar"])
			}else{
				def user = session["user"]
				def pass = session["pass"]
	
				def usuario = new UsuarioController()
	
				def perm2 = usuario.getPermissoes(user, pass,  "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
	
				if (perm2) {
	
					Assunto.deleteAll(Assunto.get(id))
					
					redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
				}else{
					render(view:"/error403.gsp")
				}
			}
		}
		
		
		def salvar(){
			
					if((session["user"] == null) || (session["pass"] == null) ){
						render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"salvar"])
					}else{
						def user = session["user"]
						def pass = session["pass"]
			
						def usuario = new UsuarioController()
			
						def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
			
						if (perm2) {
			
							Assunto assunto = new Assunto(params)
							assunto.assunto = params.assunto
							
			
							if (assunto.save(flush:true)){

								redirect(action:"listar", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
							}else{
								redirect(action:"listar", params:[msg:"Erro ao cadastrar", tipo:"erro"])
							}
						}else{
							render(view:"/error403.gsp")
						}
					}
				}
		
		
		def listarMensagem(String msg, String tipo){
			
			if((session["user"] == null) || (session["pass"] == null) ){
				render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"listar"])
			}else{
				def user = session["user"]
				def pass = session["pass"]
	
				def usuario = new UsuarioController()
	
				def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
				def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
	
				if (perm1 || perm2) {
	
					def assunto = Assunto.findAll()
					if (tipo == "ok")
	
						render(view:"/assunto/listarAssunto.gsp", model:[assunto:assunto, ok:msg, perm2:perm2])
					else
						render(view:"/assunto/listarAssunto.gsp", model:[assunto:assunto, erro:msg, perm2:perm2])
				}else{
					render(view:"/error403.gsp")
				}
			}
		}
		
		
		
		def editar(long id){
			
			if((session["user"] == null) || (session["pass"] == null) ){
				render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"listar"])
			}else{
			
				def user = session["user"]
				def pass = session["pass"]
	
				def usuario = new UsuarioController()
	
				def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
	
				if (perm2) {
	
					Assunto assunto = Assunto.get(id)
	
					render (view:"/assunto/editarAssunto.gsp", model:[assunto:assunto])
				}else{
					render(view:"/error403.gsp")
				}
			}
		}
		
			  def atualizar(){
			
					if((session["user"] == null) || (session["pass"] == null) ){
						render (view:"/usuario/login.gsp", model:[ctl:"assunto", act:"listar"])
					}else{
						def user = session["user"]
						def pass = session["pass"]
			
						def usuario = new UsuarioController()
			
						def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
			
						if (perm2) {
							
							def assunto = Assunto.get(params.id)
							  assunto.assunto = params.assunto
							
							  if(assunto.save(flush:true)){
								
								//listarMensagem("Tipo de documento atualizada com sucesso", "ok")
								redirect(action:"listar", params:[msg:"Atualizado com sucesso", tipo:"ok"])
							}else{
								//listarMensagem("Erro ao atualizar", "erro")
							redirect(action:"listar", params:[msg:"Erro ao atualizar", tipo:"erro"])
							}
						}
					}
				}
		
}
