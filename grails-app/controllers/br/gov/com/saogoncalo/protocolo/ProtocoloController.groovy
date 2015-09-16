package br.gov.com.saogoncalo.protocolo
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.protocolo.FuncionarioSetor
import br.gov.rn.saogoncalo.protocolo.Protocolo
import br.gov.rn.saogoncalo.protocolo.Situacao
import br.gov.rn.saogoncalo.protocolo.TipoDocumento

class ProtocoloController {

	def index() { }

	def salvar(){



		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm2) {

				Protocolo protocolo = new Protocolo(params)
				protocolo.numero = params.numero.toInteger()
				protocolo.numeroDocumento = params.numeroDocumento
				protocolo.assunto = params.assunto

				protocolo.dataProtocolo = params.dataProtocolo
				protocolo.dataEmissao = params.dataEmissao
				
				def funcionarioSetor = FuncionarioSetor.get(params.funcionarioSetor)
				
				/*println("Params aqui -- " + params)
				println("Datas: " + protocolo.dataProtocolo + " - " + protocolo.dataEmissao)
                */
				def tipoDocumento = TipoDocumento.get(params.tipoDocumento)
				def situacao = Situacao.get(params.situacao)
				protocolo.tipoDocumento  = tipoDocumento
				protocolo.situacao = situacao
				protocolo.funcionarioSetor = funcionarioSetor
				if (protocolo.save(flush:true)){

					listarMensagem("Protocolo cadastrado com sucesso", "ok")
				}else{
					def erros
					protocolo.errors.each {erros = it}
					print("erros: "+erros)
					listarMensagem("Erro ao salvar", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def listarMensagem(String msg, String tipo){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm1 || perm2) {

				def protocolo = Protocolo.findAll()
				if (tipo == "ok")

					render(view:"/protocolo/listarProtocolo.gsp", model:[protocolo:protocolo, ok:msg, perm2:perm2])
				else
					render(view:"/protocolo/listarProtocolo.gsp", model:[protocolo:protocolo, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	
	def editar(long id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
            
			def situacoes
			def tipoDocumentos
			
			if (perm2) {
				
				situacoes = Situacao.findAll()
				Protocolo protocolo = Protocolo.get(id)
				tipoDocumentos = TipoDocumento.findAll()
				

				render (view:"/protocolo/editar.gsp", model:[protocolo:protocolo , situacoes:situacoes , tipoDocumentos:tipoDocumentos ])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	  def atualizar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
				}else{
				
					def user = session["user"]
					def pass = session["pass"]
		
					def usuario = new UsuarioController()
		
					def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
		
					if (perm2) {
						
		                def tipoDocumentos
		                def situacoes
						
						def protocolos = Protocolo.get(params.id)
		                
						protocolos.numero = params.numero.toInteger()
                        protocolos.dataProtocolo = params.dataProtocolo
						protocolos.dataEmissao = params.dataEmissao
						println("Datas: " +  params+ " - " + protocolos.dataEmissao)
						protocolos.numeroDocumento = params.numeroDocumento
						protocolos.assunto = params.assunto
						tipoDocumentos = TipoDocumento.findAll()
						
						def situacao = Situacao.get(params.situacao)
						def tipoDocumento = TipoDocumento.get(params.tipoDocumento)
					
						  protocolos.tipoDocumento = tipoDocumento
						 
						   protocolos.situacao = situacao 
						   println ("assunto" +params.situacao)
						  
						   if(protocolos.save(flush:true)){
							 listarMensagem("Protocolo atualizado com sucesso", "ok")
							
						
						}else{
						def erros
					protocolos.errors.each {erros = it}
					print("erros: "+erros)
						
								
							listarMensagem("Erro ao atualizar", "erro")
						}
					}
				}
			}
	
	
	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm2) {

				Protocolo.deleteAll(Protocolo.get(id))
				
							
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def listarProtocolo(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm1 || perm2) {

				def protocolo
				def situacoes
				def tipoDocumentos
				def funcionarioSetor
				
                
				if (session["escid"] == 0) {

					protocolo = Protocolo.findAll()
					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()
					println("session "+session["pesid"])
					
					println(" Protocolo: " + protocolo)
					println(" Situações: " + situacoes)
					println(" TipoDocumentos: " + tipoDocumentos)
					
				    funcionarioSetor = FuncionarioSetor.executeQuery(" select fs from FuncionarioSetor fs ")
					 
					
				}else{
				
				
				
					protocolo = Protocolo.findAll()
					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()
					
					println ("session" +session["pesid"])
					println(" Protocolo: " + protocolo)
					println(" Situações: " + situacoes)
					println(" TipoDocumentos: " + tipoDocumentos)
					
					funcionarioSetor = FuncionarioSetor.findAll()
					
				render(view:"/protocolo/listarProtocolo.gsp", model:[protocolo:protocolo, situacoes:situacoes, funcionarioSetor:funcionarioSetor, tipoDocumentos:tipoDocumentos, perm2:perm2])
				}
				}else{
				render(view:"/error403.gsp")
			}
		}
	}
}


