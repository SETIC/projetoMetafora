package br.gov.rn.saogoncalo.protocolo

import groovy.sql.Sql

import java.sql.Driver
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.PessoaJuridica

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

				// ----- consulta ---

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")

				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)

				def sql = new Sql(conn)
				def protocolos
				def sqlString = " select * from (select max(t.id) as tramite, t.protocolo_id as protoc_id " +
						"                 from cadastro_unico_protocolo.tramite t " +
						"                group by t.protocolo_id) as t1 , cadastro_unico_protocolo.protocolo p, " +
						"                                                 cadastro_unico_protocolo.tramite tr, " +
						"                                                 cadastro_unico_protocolo.situacao s, " +
						"                                                 cadastro_unico_protocolo.setor se, " +
						"                                                 cadastro_unico_protocolo.funcionario_setor fs, " +
						"                                                 cadastro_unico_protocolo.assunto a " +
						" where p.id = t1.protoc_id " +
						"  and tr.id = t1.tramite " +
						"  and s.id = p.situacao_id " +
						"  and se.id = fs.setor_id " +
						"  and fs.id = p.funcionario_setor_id " +
						"  and a.id = p.assunto_id " + 
						"  and se.pessoa_juridica_id = " + session["escid"]

				if(params.tipoBusca == "numero"){
					sqlString = sqlString + " and p.numero = " + params.numeroProtocolo
					protocolos = sql.rows(sqlString)
				}
				if(params.tipoBusca == "data"){
					sqlString = sqlString + " and p.data_Emissao between'" + params.dataInicial + "' and '" + params.dataFinal +"'"
					protocolos = sql.rows(sqlString)
				}
				if(params.tipoBusca == "setor"){
					sqlString = sqlString + " and se.id = " + params.setor
					protocolos = sql.rows(sqlString)
				}
				
				if(params.tipoBusca == "interessado"){
					sqlString = sqlString + " and p.interessado like '%" + params.interessado + "%' "
					protocolos = sql.rows(sqlString)
				}

				//sqlString = " select * from cadastro_unico_protocolo.protocolo "
				// ------------------

				
				PessoaJuridica pessoajuridica = PessoaJuridica.get(session["escid"])
				def setor = Setor.findAllByPessoaJuridica(pessoajuridica)

				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select distinct fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				render(view:"/protocolo/pesquisarProtocolos.gsp", model:[protocolos:protocolos ,setor:setor, funcionarioSetorLogado: funcionarioSetorLogado, perm1:perm1])
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

				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select distinct fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				println("parametros " + params.arquivos)
				Protocolo protocolo = new Protocolo(params)
				protocolo.numero = params.numero.toLong()
				protocolo.numeroDocumento = params.numeroDocumento
				protocolo.dataProtocolo = params.dataProtocolo
				protocolo.dataEmissao = params.dataEmissao

				def funcionarioSetor = FuncionarioSetor.get(funcionarioSetorLogado.id)
				def tipoDocumento = TipoDocumento.get(params.tipoDocumento)
				def situacao = Situacao.get(params.situacao)
				def assunto = Assunto.get(params.assunto)	

				protocolo.tipoDocumento  = tipoDocumento
				protocolo.situacao = situacao
				protocolo.funcionarioSetor = funcionarioSetor
				protocolo.assunto = assunto

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

					request.getFiles("arquivo[]").each { file ->

						println("Arquivo aqui ---+++ " + file.originalFilename)

						Anexo anexo = new Anexo()
                       
						FileUploadServiceController fil = new  FileUploadServiceController()
						anexo.arquivo = fil.uploadFile(file,file.originalFilename, "/anexos/${protocolo.id}")
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
					
					}else{
					
						def erros
						tramite.errors.each { erros = it }
						print("erros: "+erros)
					}


					    redirect(controller:"Protocolo", action: "listarProtocolo", params: [msg: "Protocolo cadastrado com sucesso.", tipo:"ok"])
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
			msg = params.msg
			tipo= params.tipo

			if (perm1 || perm2) {

				//def protocolo = Protocolo.findAll()


				if (tipo == "ok" || params.tipo =="ok"){

					println("Teste render")
					render(view:"/protocolo/listarProtocolo.gsp", model:[ ok:msg, perm2:perm2])
				}else
					render(view:"/protocolo/listarProtocolo.gsp", model:[ erro:msg, perm2:perm2])
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
			def anexos

			if (perm2) {

				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select distinct fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])
               
			   
				situacoes = Situacao.findAll()
				Protocolo protocolo = Protocolo.get(id)
				println("Impressão de protocolo aqui =---" + protocolo)
				tipoDocumentos = TipoDocumento.findAll()
			    anexos = Anexo.findAllByProtocolo(protocolo)
				println("anexos do "+anexos)
				
				println("dados aqui " + protocolo.id )
								
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

				def assunto = Assunto.findAll()
				
				println("Tipo -- " + tipoEdicao)

				render (view:"/protocolo/editar.gsp", model:[protocolo:protocolo , situacoes:situacoes , tipoDocumentos:tipoDocumentos, tipoEdicao:tipoEdicao , anexos:anexos, assunto:assunto ])
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
				def assunto = Assunto.get(params.assunto)

				protocolos.numero = params.numero.toString().toInteger()
				if(params.dataProtocolo != null){
					protocolos.dataProtocolo = params?.dataProtocolo
				}
				if(params.dataEmissao != null){
					protocolos.dataEmissao = params?.dataEmissao
				}
				println("Datas: " +  params+ " - " + protocolos.dataEmissao)
				protocolos.numeroDocumento = params.numeroDocumento
								
				protocolos.assunto = assunto
				//tipoDocumentos = TipoDocumento.findAll()

				def situacao = Situacao.get(params.situacao)

				if(params.tipoDocumento != null){
					tipoDocumento = TipoDocumento.get(params?.tipoDocumento)
					protocolos.tipoDocumento = tipoDocumento
				}

				protocolos.situacao = situacao
				println ("assunto" +params.situacao)

				if(protocolos.save(flush:true)){
                   
					//atualização de tramites

					if(protocolos.situacao.tipo == "F"){

						Tramite tramite = new Tramite()
						tramite = Tramite.findByProtocoloAndStatus(protocolos,"ABERTO")

						println("status --- " +tramite)
						tramite.status = "FECHADO"
						tramite.save(flush:true)
					
					}else{

						Tramite tramite = new Tramite()
						def tramite1 = Tramite.executeQuery(" select t from Tramite t " +
								" where t.protocolo.id = :protocolo " +
								" order by t.id desc "
								, [protocolo : protocolos.id, max : 1])

						println("status +++ " +tramite1)
						tramite = Tramite.get(tramite1.id)
						tramite.status = "ABERTO"
						//tramite.save(flush:true)

					}
					
					//adicionarAnexo(request)
					//adicionara anexos --------------------
					
					request.getFiles("arquivo[]").each { file ->
						println("Arquivo do editar akikkkkkk ---+++ " + file.originalFilename)
						
						Anexo anexo = new Anexo()
												
						FileUploadServiceController fil = new  FileUploadServiceController()
						anexo.arquivo =  fil.uploadFile(file,file.originalFilename, "/anexos")
						anexo.dataAnexo = new Date()
						anexo.protocolo = protocolos
						if(anexo.save(flush:true)){
							println("anexo salvo -----")
						 }
						
					   //redirect(action:"editar" , params:[id:anexo.protocolo.id])
						}
					
					//--------------------------------------
					

					redirect(controller:"Protocolo", action:"listarProtocolo",params:[msg:"Protocolo atualizado com sucesso.",tipo:"ok"])
					//listarMensagem("Protocolo atualizado com sucesso", "ok")
				}else{
					
				    def erros
					protocolos.errors.each {erros = it}
					print("erros: "+erros)
					listarMensagem("Erro ao atualizar", "erro")
				}
			}
		}
	}


	def deletar(long id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm2) {

				Protocolo.deleteAll(Protocolo.get(id))

				redirect(action:"listarProtocolo", params:[msg:"Deletado com sucesso!", tipo:"ok"])
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
				def msg
				def tipo

				msg = params.msg
				tipo=params.tipo
				def funcionarioSetorLogado = FuncionarioSetor.executeQuery("select distinct fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				println(" Usuario - " + session["pesid"])
				
				println(" Funcionario setor logado ---- " + funcionarioSetorLogado)

				if (session["escid"] == 0) {

					//protocolo = Protocolo.findAll()
					protocolosEnviados = Protocolo.executeQuery(" select t from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is null " +
							"   and s.tipo = 'I' " +
							"   and t.status = 'ABERTO' " +
							"   and t.funcionarioSetorOrigem.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])

					protocolosAceitos = Protocolo.executeQuery(" select t from Protocolo p, Tramite t, Situacao s " +
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


					println("FuncionarioSetor ---- " + funcionarioSetorLogado.id)

					protocolosEnviados = Protocolo.executeQuery(" select t from Protocolo p, Tramite t, Situacao s " +
							" where p.id = t.protocolo.id " +
							"   and p.situacao.id = s.id " +
							"   and t.dataRecebimento is null " +
							"   and s.tipo = 'I' " +
							"   and t.status = 'ABERTO' " +
							"   and t.funcionarioSetorOrigem.id = :funcionarioSetorLogado", [funcionarioSetorLogado : funcionarioSetorLogado.id])

					protocolosAceitos = Protocolo.executeQuery(" select t from Protocolo p, Tramite t, Situacao s " +
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
				
				def assunto = Assunto.findAll()

				//envio de email
				//SendController sc = new SendController()
				//sc.send()

				render(view:"/protocolo/listarProtocolo.gsp", model:[ok:msg, protocolosAceitos:protocolosAceitos, protocolosEnviados:protocolosEnviados, situacoes:situacoes, 
					                                                 funcionariosSetor:funcionariosSetor, funcionarioSetorDestino:funcionarioSetorDestino , tipoDocumentos:tipoDocumentos, 
																	 assunto:assunto, perm2:perm2])
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

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm1 || perm2) {

				def setorDestino
				def tramites
				def msg

				msg = params.msg

				setorDestino = FuncionarioSetor.executeQuery("select distinct fs from Funcionario f, FuncionarioSetor fs, Usuario u, Setor s "
						+ "where u.pessoa.id = f.id "
						+ "and fs.funcionario.id = f.id "
						+ "and s.id = fs.setor.id "
						+ "and f.id = " + session["pesid"])

				tramites = Tramite.executeQuery("select t from Protocolo p, Tramite t " +
						" where t.protocolo.id = p.id and t.dataRecebimento is null "
						+ "   and t.funcionarioSetorDestino.id = :setorDestino", [setorDestino : setorDestino.id])

				render(view:"/protocolo/listarPendentes.gsp", model:[ok:msg, perm2:perm2, tramites:tramites])
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

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm1 || perm2) {

				def tramite = Tramite.get(id)
				tramite.dataRecebimento = new Date()
				tramite.save(flush:true)

				//render(view:"/protocolo/listarPendentes.gsp", model:[msg:"Aceito com sucesso", perm2:perm2,tramite:tramite])
				redirect(action:"listarPendentes", params:[msg:"Aceito com sucesso", tipo:"ok"])
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

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

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

				

				//tramite

				Tramite tramite = new Tramite()
				tramite.dataDisponibilizacao = new Date()
				tramite.funcionarioSetorOrigem = funcionarioSetorOrigemObj
				tramite.funcionarioSetorDestino = funcionarioSetorDestino
				tramite.protocolo = protocolo
				tramite.status = "ABERTO"
				
				
				//Anexos
				
				request.getFiles("arquivo[]").each { file ->

					println("Arquivo aqui ---+++ " + file.originalFilename)

					Anexo anexo = new Anexo()

					FileUploadServiceController fil = new  FileUploadServiceController()
					anexo.arquivo =  fil.uploadFile(file,file.originalFilename, "/anexos/${tramite.protocolo.id}")
					anexo.dataAnexo = new Date()
					anexo.protocolo = protocolo
					if(anexo.save(flush:true)){
						println("anexo salva -----")
					}
				}
				
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
		println("Anexo --- " + anexo.arquivo)
		def file = new File(grailsApplication.parentContext.getResource("/anexos/" + anexo.protocolo.id.toString()).file.toString() + "/" + anexo.arquivo)
		
		/*def date = new Date()
		AdministracaoController adm = new AdministracaoController()
		adm.salvaLog(session["usid"].toString().toInteger(), "Download de arquivo: " + grailsApplication.parentContext.getResource("/anexos/").file.toString() + "/" + anexo.arquivo , 
						"DOWNLOAD", "Anexo", date)*/
		
		if (file.exists())

		{

			response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
			//response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
			response.setHeader("Content-disposition", " attachment; filename=" + anexo.arquivo )
			response.outputStream << file.bytes
			response.outputStream.flush()
			response.outputStream.close()


		}

		else{
			
			def erros
			anexo.errors.each {erros = it}
			print("erros: "+erros)
			listarMensagem("Erro ao baixar o arquivo", "erro")
		}
	}
	
	
	//remover anexo no metodo editar
	
	def removerAnexo(long id){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Protocolo", act:"listar"])
		
		}else{
		  
		   println("parametros do anexo" +params.id)
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PROTOCOLO", "PROTOCOLO", "2")

			if (perm2){
				
                Anexo anexo = new Anexo()
				anexo = Anexo.get(id)
				Protocolo protocolo = new Protocolo()
				
				println(" Protocolo aqui ---  " + anexo.protocolo.id)
				protocolo = Protocolo.get(anexo.protocolo.id)
				
				//def idprotocolo = anexo.protocolo.id
			
				Anexo.deleteAll(anexo)
				def deletaAnexo = new File(grailsApplication.parentContext.getResource("/anexos/${protocolo.id}").file.toString() + "/" + anexo.arquivo).delete()
				
				def anexos = Anexo.findAllByProtocolo(protocolo)
				
				def situacoes = Situacao.findAll()
				def tipoDocumentos = TipoDocumento.findAll() 
				
				//atualizar(params)
				
                //render (view:"/protocolo/editar.gsp", model:[protocolo:protocolo, anexos:anexos , perm2:perm2])
				redirect(action:"editar", params:[id:protocolo.id, protocolo:protocolo, anexos:anexos, situacoes:situacoes, tipoDocumentos:tipoDocumentos, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def adicionarAnexo(request){
		
		request.getFiles("arquivo[]").each { file ->
		println("Arquivo do editar akikkkkkk ---+++ " + file.originalFilename)
		
		Anexo anexo = new Anexo()
		Protocolo protocolo = new Protocolo()
		protocolo = Protocolo.get(anexo.protocolo.id)
		
		FileUploadServiceController fil = new  FileUploadServiceController()
		anexo.arquivo =  fil.uploadFile(file,file.originalFilename, "/anexos")
		anexo.dataAnexo = new Date()
		anexo.protocolo = protocolo
		if(anexo.save(flush:true)){
			println("anexo salvo -----")
		 }	
		
       redirect(action:"editar" , params:[id:anexo.protocolo.id])
		}
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

	def getMyFile(){
		render file: new File ("anexos/im5.png"), fileName: 'im5.png'
	}

}



