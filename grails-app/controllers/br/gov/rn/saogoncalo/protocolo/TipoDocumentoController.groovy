package br.gov.rn.saogoncalo.protocolo

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.PessoaJuridica


class TipoDocumentoController {

    def index() { }
	
	def salvar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"TipoDocumento", act:"salvar"])
				}else{
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "TIPO_DOCUMENTO", "2")
		
					if (perm2) {
		
						TipoDocumento tipoDocumento = new TipoDocumento(params)
						tipoDocumento.nome = params.nome
						def pessoaJuridica = PessoaJuridica.get(session["escid"])
						tipoDocumento.pessoaJuridica = pessoaJuridica
						
		
						if (tipoDocumento.save(flush:true)){
		
							//listarMensagem("Tipo de Documento Cadastrado com Sucesso", "ok")
							redirect(action:"listarTipoDocumento", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
						}else{						
							//listarMensagem("Erro ao Salvar", "erro")
							redirect(action:"listarSituacao", params:[msg:"Erro ao cadastrar", tipo:"erro"])
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
						  def pessoaJuridica = PessoaJuridica.get(session["escid"])
						  tipoDocumento.pessoaJuridica = pessoaJuridica
						
						  if(tipoDocumento.save(flush:true)){
							
							//listarMensagem("Tipo de documento atualizada com sucesso", "ok")
							redirect(action:"listarTipoDocumento", params:[msg:"Atualizado com sucesso", tipo:"ok"])
						}else{	
							//listarMensagem("Erro ao atualizar", "erro")
						redirect(action:"listarTipoDocumento", params:[msg:"Erro ao atualizar", tipo:"erro"])
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
				
				def pessoaJuridica = PessoaJuridica.get(session["escid"])
				def tipoDocumento = TipoDocumento.findAllByPessoaJuridica(pessoaJuridica)
				
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
						def msg
						
						msg = params.msg
		
						if (session["escid"] == 0) {
		
							tipoDocumento = TipoDocumento.findAll()
						
							}else{
		
							def pessoaJuridica = PessoaJuridica.get(session["escid"])
							tipoDocumento = TipoDocumento.findAllByPessoaJuridica(pessoaJuridica)

						}
						render(view:"/tipoDocumento/listarTipoDocumento.gsp", model:[ok:msg, tipoDocumento:tipoDocumento, perm2:perm2])
					}else{
						render(view:"/error403.gsp")
					}
				}
			}
		}
		

