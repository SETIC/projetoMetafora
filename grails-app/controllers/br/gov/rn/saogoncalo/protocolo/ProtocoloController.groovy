package br.gov.rn.saogoncalo.protocolo

import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

import br.gov.rn.saogoncalo.login.UsuarioController


class ProtocoloController {

	def index() { }
	
	
	def pesquisarProtocolos(){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm1 || perm2){
				
				def protocolo
				def sql
				
				println("parametro" + params)
				   sql = "select p from Protocolo p "
			   if(params.tipoBusca == "numero"){
				   
				   sql = sql + "where p.numero = "+params.numeroProtocolo
			   }
			   if(params.tipoBusca == "data"){
				   
				   sql = sql + "where p.dataEmissao between'" +params.dataInicial + "' and '" + params.dataFinal +"'"
			   
			   }
			   
			   if(params.tipoBusca == "setor"){
				   
				   sql = sql + "where p.funcionarioSetor.setor.id = "+params.setor
				   
			   }
			   
			   protocolo = Protocolo.executeQuery(sql)
			   
			   def setor=  Setor.findAll()
	   
				render(view:"/protocolo/pesquisarProtocolos.gsp", model:[protocolo:protocolo ,setor:setor, perm1:perm1])
				}else{
				render(view:"/error403.gsp")
				}
			
			 }
		   
		  }
	

	def salvar(){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm2) {

				println("parametros " + params.arquivos)
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
					observacao.texto = params.texto
					observacao.dataObservacao = new Date()
					observacao.protocolo = protocolo

					if(observacao.save(flush:true)){

						println("salvou observacao ")
						println ("observacao" + observacao)
						listarMensagem("Protocolo cadastrado com sucesso", "ok")
					}else{

						def erros
						observacao.errors.each { erros = it }
						print("erros: "+erros)
					}

					println("parametros aqui" + params)


					/*MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
					 CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile("arquivo");
					 //Suponha que haja um campo de entrada de arquivo com nome ProfilePic */


					/*					MultipartHttpServletRequest arquivo = (MultipartHttpServletRequest)request
					 def List <CommonsMultipartFile> arquivoList = params.list('arquivo')
					 arquivoList.each{
					 println("nome do arquivo: " + arquivoList.originalFilename)*/


					/*for(int i = 0 ;  i <  arquivoList.originalFilename.size(); i++){
					 println ( arquivoList.originalFilename[i])
					 println ("parametros akiiiiiiiiii" +params.arquivo)*/

					/*for(MultipartFile multipartFile : arquivo) {
					 String fileName = multipartFile.getOriginalFilename();
					 fileNames.add(fileName);
					 println ("parametros akiiiiiiiiii" +params.arquivo)
					 } */




					request.getFiles("arquivo[]").each { file ->

						println("Arquivo aqui ---+++ " + file.originalFilename)

						Anexo anexo = new Anexo()

						FileUploadServiceController fil = new  FileUploadServiceController()
						anexo.arquivo =  fil.uploadFile(file,file.originalFilename, "/anexos")
						anexo.dataAnexo = new Date()
						anexo.protocolo = protocolo
						if(anexo.save(flush:true)){
							println("anexo salva -----")
						}
					}



					Tramite tramite = new Tramite()
					tramite.funcionarioSetorOrigem = funcionarioSetor
					tramite.funcionarioSetorDestino = FuncionarioSetor.get(params.funcionarioSetorDestino)
					tramite.protocolo = protocolo
					tramite.status = 'ABERTO'
					tramite.dataDisponibilizacao = new Date()

					if(tramite.save(flush:true)){

						println("Dado -- " + tramite.dataDisponibilizacao)
						println("tramite salvo" + tramite)
						println("parametros do tramite" +protocolo)

						/*def ok
						 redirect(controller: "Protocolo", action: "listarMensagem", params:[msg:"Protocolo cadastrado com sucesso!", tipo:"ok"])*/
					}

					else{
						def erros
						tramite.errors.each { erros = it }
						print("erros: "+erros)
					}
				}else{

					def erros
					protocolo.errors.each { erros = it }
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
			def tipoEdicao, tramitesCriados

			if (perm2) {

				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				situacoes = Situacao.findAll()
				Protocolo protocolo = Protocolo.get(id)
				tipoDocumentos = TipoDocumento.findAll()
				tramitesCriados = Tramite.executeQuery(" select t from Tramite t, Protocolo p " +
						"  where p.id = t.protocolo.id " +
						"    and t.dataRecebimento is null " +
						"    and t.status = 'ABERTO' " +
						"    and p.id = :protocoloId " +
						"    and t.funcionarioSetorOrigem.id = :funcionarioSetorId ",
						[protocoloId:protocolo.id, funcionarioSetorId:funcionarioSetorLogado.id])

				println("Tramite -- " + tramitesCriados)

				if(tramitesCriados.isEmpty()){
					tipoEdicao = "ACEITO"
				}else{
					tipoEdicao = "CRIADO"
				}

				println("Tipo -- " + tipoEdicao)

				render (view:"/protocolo/editar.gsp", model:[protocolo:protocolo , situacoes:situacoes , tipoDocumentos:tipoDocumentos, tipoEdicao:tipoEdicao ])
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

				def tipoDocumento
				def situacoes

				def protocolos = Protocolo.get(params.id)

				protocolos.numero = params.numero.toString().toInteger()
				if(params.dataProtocolo != null){
					protocolos.dataProtocolo = params?.dataProtocolo
				}
				if(params.dataEmissao != null){
					protocolos.dataEmissao = params?.dataEmissao
				}
				println("Datas: " +  params+ " - " + protocolos.dataEmissao)
				protocolos.numeroDocumento = params.numeroDocumento
				protocolos.assunto = params.assunto
				//tipoDocumentos = TipoDocumento.findAll()

				def situacao = Situacao.get(params.situacao)

				if(params.tipoDocumento != null){
					tipoDocumento = TipoDocumento.get(params?.tipoDocumento)
					protocolos.tipoDocumento = tipoDocumento
				}

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
				def anexos = Anexo.findAllByProtocolo(protocolos)
				//funcionarioSetor = FuncionarioSetor.get(params.funcionarioSetor)

				render (view:"/protocolo/verInfoProtocolo.gsp", model:[protocolos:protocolos , tramites:tramites, observacoes:observacoes, anexos:anexos])

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

				def protocolosAceitos
				def protocolosEnviados
				def situacoes
				def tipoDocumentos
				def funcionariosSetor
				def funcionarioSetorDestino


				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				println(" Usuario - " + funcionarioSetorLogado)

				if (session["escid"] == 0) {

					//protocolo = Protocolo.findAll()
					protocolosEnviados = Protocolo.executeQuery(" select p from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is null " +
							"   and s.tipo = 'I' " +
							"   and t.status = 'ABERTO' " +
							"   and t.funcionarioSetorOrigem.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])

					protocolosAceitos = Protocolo.executeQuery(" select p from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is not null " +
							"   and s.tipo = 'I' " +
							"   and t.status <> 'FECHADO' " +
							"   and t.funcionarioSetorDestino.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])
					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()

					funcionariosSetor = FuncionarioSetor.executeQuery(" select fs from FuncionarioSetor fs, Pessoa p, Usuario u " +
							" where p.id = fs.funcionario.id " +
							"   and u.pessoa.id = p.id " +
							"   and p.id = " + session["pesid"])


					funcionarioSetorDestino = FuncionarioSetor.findAll()
				}else{


					protocolosEnviados = Protocolo.executeQuery(" select p from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is null " +
							"   and s.tipo = 'I' " +
							"   and t.status = 'ABERTO' " +
							"   and t.funcionarioSetorOrigem.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])

					protocolosAceitos = Protocolo.executeQuery(" select p from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is not null " +
							"   and s.tipo = 'I' " +
							"   and t.status <> 'FECHADO' " +
							"   and t.funcionarioSetorDestino.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])

					situacoes = Situacao.findAll()
					tipoDocumentos = TipoDocumento.findAll()

					funcionariosSetor = FuncionarioSetor.executeQuery(" select fs from FuncionarioSetor fs, Pessoa p, Usuario u " +
							" where p.id = fs.funcionario.id " +
							"   and u.pessoa.id = p.id " +
							"   and p.id = " + session["pesid"])

					funcionarioSetorDestino = FuncionarioSetor.findAll()
				}
				render(view:"/protocolo/listarProtocolo.gsp", model:[protocolosAceitos:protocolosAceitos, protocolosEnviados:protocolosEnviados, situacoes:situacoes, funcionariosSetor:funcionariosSetor, funcionarioSetorDestino:funcionarioSetorDestino , tipoDocumentos:tipoDocumentos, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def listarPendentes(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm1 || perm2) {

				def setorDestino
				def tramites

				setorDestino = FuncionarioSetor.executeQuery("select fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				tramites = Tramite.executeQuery("select t from Protocolo p, Tramite t " +
						" where t.protocolo.id = p.id and t.dataRecebimento is null "
						+ "   and t.funcionarioSetorDestino.id = :setorDestino", [setorDestino : setorDestino.id])

				render(view:"/protocolo/listarPendentes.gsp", model:[perm2:perm2, tramites:tramites])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def aceitarProtocolos(long id) {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm1 || perm2) {

				def tramite = Tramite.get(id)
				tramite.dataRecebimento = new Date()
				tramite.save(flush:true)

				render(view:"/protocolo/listarPendentes.gsp", model:[perm2:perm2,tramite:tramite])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def salvarTramite(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "SETOR", "2")

			if (perm1 || perm2) {

				println("params --- " + params)

				def funcionarioSetorOrigem = FuncionarioSetor.executeQuery("select fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ " where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])
				def funcionarioSetorOrigemObj = FuncionarioSetor.get(funcionarioSetorOrigem[0].id)
				println("FuncionarioSetorOrigem --- " + funcionarioSetorOrigemObj)

				def funcionarioSetorDestino = FuncionarioSetor.get(params.funcionarioSetorDestinoTramite.toString().toInteger())
				println("FuncionarioSetorDestino --- " + funcionarioSetorDestino)

				def protocolo = Protocolo.get(params.protocoloHidden.toString().toInteger())
				println("Protocolo --- " + protocolo)

				def tramiteAnterior = Tramite.executeQuery("select t from Tramite t " +
						" where t.dataRecebimento is not null " +
						"   and t.status = 'ABERTO' " +
						"   and t.protocolo.id = :protocoloId " +
						"   and t.funcionarioSetorDestino.id = :funcionarioSetorDestinoId ",
						[protocoloId:protocolo.id, funcionarioSetorDestinoId:funcionarioSetorOrigemObj.id])
				def tramiteAnteriorObj = Tramite.get(tramiteAnterior[0].id)
				println("tramiteAnterior --- " + tramiteAnteriorObj)


				tramiteAnteriorObj.status = "FECHADO"
				/*				if( tramiteAnteriorObj.save(flush:true)){
				 println("Tramite antigo editado ---- ")
				 }*/


				//Observação

				Observacao observacao = new Observacao()
				observacao.dataObservacao = new Date()
				observacao.protocolo = protocolo
				observacao.texto = params.observacao
				if(observacao.save(flush:true)){
					println("observacao salva -----")
				}

				//Anexos

				request.getFiles("arquivo[]").each { file ->

					println("Arquivo aqui ---+++ " + file.originalFilename)

					Anexo anexo = new Anexo()

					FileUploadServiceController fil = new  FileUploadServiceController()
					anexo.arquivo =  fil.uploadFile(file,file.originalFilename, "/anexos")
					anexo.dataAnexo = new Date()
					anexo.protocolo = protocolo
					if(anexo.save(flush:true)){
						println("anexo salva -----")
					}
				}

				//tramite

				Tramite tramite = new Tramite()
				tramite.dataDisponibilizacao = new Date()
				tramite.funcionarioSetorOrigem = funcionarioSetorOrigemObj
				tramite.funcionarioSetorDestino = funcionarioSetorDestino
				tramite.protocolo = protocolo
				tramite.status = "ABERTO"
				if(tramite.save(flush:true)){
					println("Tramite novo salvo  ----- ")
				}


				redirect(action: "listarProtocolo")

				//render(view:"/protocolo/listar.gsp", model:[perm2:perm2, tramite:tramite])
			}else{
				render(view:"/error403.gsp")
			}
		}



	}


	def downloadFile(long id) {

		println("Teste --- download" )
		
		println("URL --- " + grailsApplication.parentContext.getResource("/anexos/").file.toString() + "\\" + "bla.txt")
		
		def anexo = Anexo.get(id)
		//def file = new File("${sub.location}/${sub.fileName}")
		println("Anexo --- " + anexo.arquivo)
		def file = new File(grailsApplication.parentContext.getResource("/anexos/").file.toString() + "\\" + anexo.arquivo)
		if (file.exists())
		{
			response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
			//response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
			response.setHeader("Content-disposition", " attachment; filename=\\" + anexo.arquivo )
			response.outputStream << file.bytes
		}
		else render "Error!" // appropriate error handling


		//render file: new File("C:/Users/ieber.moura/Documents/workspace-ggts-3.6.3.RELEASE/projetoMetafora/web-app/anexos/bla.txt"), contentType: 'text/plain'

	}



	def downloadSampleZip() {
		response.setContentType('APPLICATION/OCTET-STREAM')
		response.setHeader('Content-Disposition', 'Attachment;Filename="example.zip"')

		ZipOutputStream zip = new ZipOutputStream(response.outputStream);
		def file1Entry = new ZipEntry('first_file.txt');
		zip.putNextEntry(file1Entry);
		zip.write("This is the content of the first file".bytes);
		def file2Entry = new ZipEntry('second_file.txt');
		zip.putNextEntry(file2Entry);
		zip.write("This is the content of the second file".bytes);
		zip.close();
	}

}



