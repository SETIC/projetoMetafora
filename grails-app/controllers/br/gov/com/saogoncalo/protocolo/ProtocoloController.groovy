package br.gov.com.saogoncalo.protocolo
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.protocolo.FuncionarioSetor
import br.gov.rn.saogoncalo.protocolo.Observacao
import br.gov.rn.saogoncalo.protocolo.Protocolo
import br.gov.rn.saogoncalo.protocolo.Situacao
import br.gov.rn.saogoncalo.protocolo.TipoDocumento
import br.gov.rn.saogoncalo.protocolo.Tramite

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
				def tipoDocumento = TipoDocumento.get(params.tipoDocumento)
				def situacao = Situacao.get(params.situacao)
				
				protocolo.tipoDocumento  = tipoDocumento
				protocolo.situacao = situacao
				protocolo.funcionarioSetor = funcionarioSetor
				  
				 if (protocolo.save(flush:true)){
					Observacao observacao = new Observacao(params)
					println ("fdd" + params)
					println ("fdfdf" + params.texto)
					observacao.texto = params.texto
					observacao.dataObservacao = new Date()
					observacao.protocolo = protocolo
				
				 if(observacao.save(flush:true)){
					
					println("salvou observacao ")
					println ("observacao" + observacao)
					listarMensagem("Protocolo cadastrado com sucesso", "ok")
					
					}
				 
				 else{
						
						def erros
						observacao.errors.each {erros = it}
						print("erros: "+erros)
						
					}
				
				 
				 Tramite tramite = new Tramite()
				 tramite.funcionarioSetorOrigem = funcionarioSetor
				 tramite.funcionarioSetorDestino = FuncionarioSetor.get(params.funcionarioSetorDestino)
				 tramite.protocolo = protocolo
				 tramite.dataDisponibilizacao = new Date()
				
				if(tramite.save()){
					println("tramite salvo" + tramite)
					
					def ok
					redirect(controller: "Protocolo", action: "listarMensagem", params:[msg:"Protocolo cadastrado com sucesso!", tipo:"ok"])
					
					}
				
				else{
					def erros
					tramite.errors.each {erros = it}
					print("erros: "+erros)
					
					}
				  
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

     def verInfoProtocolo(long id){
		 
		 if((session["user"] == null) || (session["pass"] == null) ){
			 render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		 }else{
			 def user = session["user"]
			 def pass = session["pass"]
 
			 def usuario = new UsuarioController()
 
			 def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			 def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")
 
			 if (perm1 || perm2) {
              
				
		        def funcionarioSetor
				
				
			    Protocolo protocolos = Protocolo.get(id)
			   def tramites = Tramite.findAllByProtocolo(protocolos)
			 
			     def observacoes = Observacao.findAllByProtocolo(protocolos)
                //funcionarioSetor = FuncionarioSetor.get(params.funcionarioSetor)
				
				render (view:"/protocolo/verInfoProtocolo.gsp", model:[protocolos:protocolos , tramites:tramites, observacoes:observacoes])
			     
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
				def funcionariosSetor
				def funcionarioSetorDestino
				
                
				if (session["escid"] == 0) {

					protocolo = Protocolo.findAll()
					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()
									
				    funcionariosSetor = FuncionarioSetor.executeQuery(" select fs from FuncionarioSetor fs, Pessoa p, Usuario u " +
															          " where p.id = fs.funcionario.id " +
																	  "   and u.pessoa.id = p.id " + 
																	  "   and p.id = " + session["pesid"])	
					
					
					funcionarioSetorDestino = FuncionarioSetor.findAll()
		
				}else{
				
					protocolo = Protocolo.findAll()
					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()
					
					funcionariosSetor = FuncionarioSetor.executeQuery(" select fs from FuncionarioSetor fs, Pessoa p, Usuario u " +
															          " where p.id = fs.funcionario.id " +
																	  "   and u.pessoa.id = p.id " + 
																	  "   and p.id = " + session["pesid"])
					
					funcionarioSetorDestino = FuncionarioSetor.findAll()
					
				}	
				render(view:"/protocolo/listarProtocolo.gsp", model:[protocolo:protocolo, situacoes:situacoes, funcionariosSetor:funcionariosSetor, funcionarioSetorDestino:funcionarioSetorDestino , tipoDocumentos:tipoDocumentos, perm2:perm2])
				
				}else{
				render(view:"/error403.gsp")
			}
		}
	}
}


