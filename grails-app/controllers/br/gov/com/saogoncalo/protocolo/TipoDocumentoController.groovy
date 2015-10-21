package br.gov.com.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.protocolo.TipoDocumento

class TipoDocumentoController {

    def index() { }
	
	def cadastrar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"cadastrar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")
		
					if (perm2) {
		
						TipoDocumento tipoDocumento = new TipoDocumento(params)
						tipoDocumento.nome = params.nome
						
		
						if (tipoDocumento.save(flush:true)){
		
							listarMensagem("Tipo de Documento Cadastrado com Sucesso", "ok")
						}else{
							listarMensagem("Erro ao Salvar", "erro")
						}
					}else{
						render(view:"/error403.gsp")
					}
				}
			}
	
	
	def editarTipoDocumento(long id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"listar"])
		}else{
		
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")

			if (perm2) {

				TipoDocumento tipoDocumento = TipoDocumento.get(id)

				render (view:"/tipoDocumento/editarTipoDocumento.gsp", model:[tipoDocumento:tipoDocumento])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	      def atualizar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"listar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")
		
					if (perm2) {
						
						def tipoDocumento = TipoDocumento.get(params.id)
						  tipoDocumento.nome = params.nome
						
						  if(tipoDocumento.save(flush:true)){
							
							listarMensagem("Tipo de documento atualizada com sucesso", "ok")
						}else{
										
							listarMensagem("Erro ao atualizar", "erro")
						}
					}
				}
			}
	
	def deletar(int id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass,  "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")

			if (perm2) {

				TipoDocumento.deleteAll(TipoDocumento.get(id))
				
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	
	
	def listarMensagem(String msg, String tipo){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"tipoDocumento", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")

			if (perm1 || perm2) {

				def tipoDocumento = TipoDocumento.findAll()
				if (tipo == "ok")

					render(view:"/tipoDocumento/listarTipoDocumento.gsp", model:[tipoDocumento:tipoDocumento, ok:msg, perm2:perm2])
				else
					render(view:"/tipoDocumento/listarTipoDocumento.gsp", model:[tipoDocumento:tipoDocumento, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	def listarTipoDocumento(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"listar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "1")
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")
		
					if (perm1 || perm2) {
		
						def tipoDocumento
		
						if (session["escid"] == 0) {
		
							tipoDocumento = TipoDocumento.findAll()
						
							}else{
		
							tipoDocumento = TipoDocumento.findAll()

						}
						render(view:"/tipoDocumento/listarTipoDocumento.gsp", model:[tipoDocumento:tipoDocumento, perm2:perm2])
					}else{
						render(view:"/error403.gsp")
					}
				}
			}
		}
		

