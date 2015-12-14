package br.gov.rn.saogoncalo.pessoa
import grails.converters.JSON
import groovy.json.JsonSlurper

import java.sql.SQLException
import java.text.SimpleDateFormat

import br.gov.rn.saogoncalo.academico.Matricula
import br.gov.rn.saogoncalo.academico.Serie
import br.gov.rn.saogoncalo.academico.Turma
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.localizacao.Bairro
import br.gov.rn.saogoncalo.localizacao.DivisaoAdministrativa
import br.gov.rn.saogoncalo.localizacao.Estado
import br.gov.rn.saogoncalo.localizacao.Logradouro
import br.gov.rn.saogoncalo.localizacao.Municipio
import br.gov.rn.saogoncalo.localizacao.TipoLogradouro
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.protocolo.FileUploadServiceController

class AlunoController {

	def index() {
	}

	def cadastrar(){
	}

	def buscarCEP(String cep) {

		println("CEP --- " + cep)

		String urlCompleta
		String urlBase = "http://cep.correiocontrol.com.br/"
		//String urlBase = "http://api.postmon.com.br/"

		urlCompleta = urlBase + cep + ".json"

		print urlCompleta

		URL urlReferenteAAPI = new URL(urlCompleta)

		def dadosReferenteAoCep

		try {
			dadosReferenteAoCep = new JsonSlurper().parseText(urlReferenteAAPI.text)
			print "completo..."
		} catch(Exception e) {
			dadosReferenteAoCep = []
			print "vazio..."
		}
		print dadosReferenteAoCep
		render dadosReferenteAoCep as JSON
	}

	def editarAluno(long id){
		println("o id está aqui "+id)
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")){

				Aluno alunos = Aluno.get(id)
				println("objeto alunos aquiiiiiiiiiiiiiii------ "+alunos)
				def pHomens = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'MASCULINO' ")

				println("objeto pHomens aquiiiiiiiiiiiiiii------ "+pHomens)

				def pMulheres = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'FEMININO' ")
				println("objeto pMulheres aquiiiiiiiiiiiiiii------ "+pMulheres)

				def reside = Reside.findByPessoa(alunos.cidadao.pessoaFisica.pessoa)
				def documentosAluno = Documento.findAllByAluno(alunos)

				def parentescoPai = Parentesco.findByPessoaFisicaAndParentesco(alunos.cidadao.pessoaFisica, "PAI")
				def parentescoMae = Parentesco.findByPessoaFisicaAndParentesco(alunos.cidadao.pessoaFisica, "MÃE")



				println("objeto parentescoPai aquiiiiiiiiiiiiiii------ "+parentescoPai)
				println("objeto parentescoMae aquiiiiiiiiiiiiiii------ "+parentescoMae)
				
				PessoaFisica pessoaFisica = PessoaFisica.get(id)
				def pessoaFisicaNecessidadesEspeciais = PessoaFisicaNecessidadesEspeciais.findAllByPessoaFisica(pessoaFisica)
				
				def pfne = pessoaFisicaNecessidadesEspeciais.necessidadesEspeciais.id
				
				def necessidadesEspeciais = NecessidadesEspeciais.findAll()

				render (view:"/aluno/editarAluno.gsp", model:[alunos:alunos, pHomens:pHomens, pMulheres:pMulheres, reside:reside, parentescoPai:parentescoPai, parentescoMae:parentescoMae , 
					    documentosAluno:documentosAluno, pfne:pfne, necessidadesEspeciais:necessidadesEspeciais])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{


			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")){

				//Atualizando a pessoa

				//Parentesco parentescoPai = new Parentesco()
				//Parentesco parentescoMae = new Parentesco()

				def pessoa = Pessoa.get(params.id)
				pessoa.nome = params.nome.toString().toUpperCase()
				pessoa.dataDeNascimento = params.dataDeNascimento
				if (!params.cpfCnpj.trim().equals(''))
					pessoa.cpfCnpj = params.cpfCnpj
				else
					pessoa.cpfCnpj = null
				if(pessoa.save(flush:true)){
					println("salvou pessoa");
				}else{
					println(" não salvou pessoa");
					listarMensagem("Erro ao salvar pessoa", "erro")
				}

				def pessoaFisica = PessoaFisica.get(params.id)
				pessoaFisica.rcNumero = params.rcNumero
				pessoaFisica.rcNomeDoCartorio = params.rcNomeDoCartorio
				pessoaFisica.rcNomeDoLivro = params.rcNomeDoLivro
				pessoaFisica.rcFolhaDoLivro = params.rcFolhaDoLivro
				pessoaFisica.rcDataDoRegistro = params.rcDataDoRegistro
				pessoaFisica.rcCidade = params.rcCidade
				pessoaFisica.cor = params.corRaca
				pessoaFisica.sexo = params.sexo
				if(pessoaFisica.save(flush:true)){
					println("salvou pessoa física");
				}else{
					println(" não salvou pessoa física");
				}

				//atualizando parentesco da pessoa

				println("Id Pessoa fisica " + pessoaFisica.id)
				println("Id Pessoa  " + pessoa)

				//def parentescoPai = Parentesco.executeQuery("select p "+
				//	" from Parentesco p where p.parentesco ='PAI' and p.pessoaFisica.id = "+ pessoaFisica.id)

				def parentescoPai
				def parentescoMae
				parentescoPai = Parentesco.findByParentescoAndPessoaFisica("PAI",pessoaFisica)
				//if(parentescoPai == null){
				//	Parentesco newParentescoPai = new Parentesco()


				//}

				//def parentescoMae = Parentesco.executeQuery("select p "+
				//	" from Parentesco as p where p.parentesco ='MÃE' and p.pessoaFisica.id = "+ pessoaFisica.id)
				parentescoMae = Parentesco.findByParentescoAndPessoaFisica("MÃE",pessoaFisica)

				//Parentesco newParentescoMae = new Parentesco()
				println("parentesco pai aquiiiiii "+parentescoPai)
				println("parentesco Mae aquiiiiii "+parentescoMae)
				//Parentesco parentescoMae = new Parentesco()
				def idPai
				def idMae

				println("nomepai Input --- " + params.nomePaiInput)

				if((params.pai != 0) || (params.nomePaiInput != "")){

					if(params.nomePaiInput == "" || params.nomePaiInput == null ){
						println("id pessoa pai "+Pessoa.get(params.pai))
						idPai = Pessoa.get(params.pai)
						println("if do pai "+idPai)

						if(parentescoPai == null){
							Parentesco newParentescoPai = new Parentesco()
							newParentescoPai.parentesco = "PAI"
							newParentescoPai.pessoa = pessoa.get(params.pai)
							newParentescoPai.pessoaFisica = PessoaFisica.get(pessoa.id)
							newParentescoPai.save(flush:true)

						}else{
							parentescoPai.pessoa = idPai
							parentescoPai.save(flush:true)
						}
					}else{
						idPai = Pessoa.get(params.nomePaiInput)
						println("if do paiInput "+params.nomePaiInput)
						parentescoPai.pessoa = idPai
						parentescoPai.save(flush:true)
					}
				}

				if((params.mae != 0) || (params.nomeMaeInput != "")){
					if(params.nomeMaeInput == "" || params.nomeMaeInput == null ){
						idMae = Pessoa.get(params.mae)
						println("if do Mae "+idMae)

						if(parentescoMae == null){
							Parentesco newParentescoMae = new Parentesco()
							newParentescoMae.parentesco = "MÃE"
							newParentescoMae.pessoa = pessoa.get(params.mae)
							newParentescoMae.pessoaFisica = PessoaFisica.get(pessoa.id)
							newParentescoMae.save(flush:true)

						}else{

							parentescoMae.pessoa = idMae
							parentescoMae.save(flush:true)
						}
					}else{
						idMae = Pessoa.get(params.nomeMaeInput)
						println("if do maeInput "+params.nomeMaeInput)
						parentescoMae.pessoa = idMae
						parentescoMae.save(flush:true)
					}
				}
				//println("parentencoPai.parentesco "+parentescoPai.parentesco)
				//println("idPai "+idPai.nome)


				//bloco de endereço


				TipoLogradouro tipoLogradouro = new TipoLogradouro()
				Logradouro logradouro = new Logradouro()
				Bairro bairro = new Bairro()
				Municipio municipio = new Municipio()
				Estado estado = new Estado()
				Reside newReside = new Reside()

				if(params.endereco != ""){

					def tipoLogradouroSimple
					def logradouroSimple

					if (params.endereco.toString().indexOf(" ") != -1) {
						tipoLogradouroSimple = params.endereco.toString().substring(0, params.endereco.toString().indexOf(" "))
						logradouroSimple = params.endereco.toString().substring((params.endereco.toString().indexOf(" ")+1) , params.endereco.toString().size())
					}else{
						tipoLogradouroSimple = "RUA"
						logradouroSimple = params.endereco
					}

					println("Teste tipo --- " + tipoLogradouroSimple + " Logradouro --- " + logradouroSimple)


					tipoLogradouro = TipoLogradouro.findByTipoLogradouro(tipoLogradouroSimple.toUpperCase())
					if(tipoLogradouro == null){
						TipoLogradouro newTipoLogradouro = new TipoLogradouro()
						newTipoLogradouro.tipoLogradouro = tipoLogradouroSimple
						newTipoLogradouro.save(flush:true)
						println("TipoLogradouro --- " + newTipoLogradouro.tipoLogradouro)
						tipoLogradouro = newTipoLogradouro
					}


					logradouro = Logradouro.findByLogradouro(logradouroSimple.toUpperCase())
					if(logradouro == null){
						Logradouro newLogradouro = new Logradouro()
						newLogradouro.logradouro = logradouroSimple
						newLogradouro.tipoLogradouro = tipoLogradouro
						newLogradouro.save(flush:true)
						println("Logradouro --- " + newLogradouro.logradouro)
						logradouro = newLogradouro
					}
				}

				estado = Estado.findByAbreviacao(params.uf.toString().toUpperCase())
				if(estado == null){
					Estado newEstado = new Estado()
					newEstado.estado = params.uf.toString().toUpperCase()
					newEstado.abreviacao = params.uf.toString().toUpperCase()
					newEstado.save(flush:true)
					println("UF --- "+newEstado.abreviacao)
					estado = newEstado
				}

				municipio = Municipio.findByMunicipio(params.municipio.toString().toUpperCase())
				if(municipio == null){
					Municipio newMunicipio = new Municipio()
					newMunicipio.municipio = params.municipio.toString().toUpperCase()
					newMunicipio.estado = estado
					newMunicipio.save(flush:true)
					println("Municipio --- " + newMunicipio.municipio)
					municipio = newMunicipio
				}

				bairro = Bairro.findByBairro(params.bairro.toString().toUpperCase())
				if(bairro == null){
					Bairro newBairro = new Bairro()
					newBairro.bairro = params.bairro.toString().toUpperCase()
					newBairro.municipio = municipio
					newBairro.save(flush:true)
					println("Bairro --- " + newBairro.bairro)
					bairro = newBairro
				}

				newReside.bairro = bairro
				newReside.logradouro = logradouro
				newReside.pessoa = pessoa
				newReside.numero = params.numero
				newReside.complemento = params.complemento
				newReside.cep = params.cep
				if(newReside.save(flush:true) == false){
					listarMensagem("Erro ao salvar reside", "erro")
				}
				println("reside --- " + newReside.id)



				/*				//atualizando reside
				 Bairro bairro = new Bairro()
				 bairro = Bairro.findByBairro(params.bairro.toString().toUpperCase())
				 //def idBairro = Bairro.executeQuery("select b from Bairro as b where b.bairro = '"+params.bairro.toString().toUpperCase()+"'")
				 String t = params.endereco.toString().toUpperCase()
				 String tr = t.substring((t.indexOf(' ')+1), t.length())
				 println("Substring --- " + tr)
				 Logradouro idLogradouro = new Logradouro()
				 idLogradouro = Logradouro.findByLogradouro(tr)
				 def idLogradouro = Logradouro.executeQuery(" select l " +
				 "  from Logradouro as l, TipoLogradouro as tl " +
				 "  where l.tipoLogradouro.id = tl.id " +
				 "  and (tl.tipoLogradouro || ' ' || l.logradouro) = '" + params.endereco.toString().toUpperCase()+"'")
				 if (idBairro.isEmpty() || idLogradouro.isEmpty()) {
				 listarMensagem("Bairro ou Logradouro não encontrado.", "erro")
				 }else{
				 def reside = Reside.findByPessoa(pessoa)
				 println("reside aquillll "+reside )
				 println("idBairro "+bairro)
				 println("idLogradouro "+idLogradouro)
				 reside.bairro = bairro
				 reside.logradouro = idLogradouro
				 reside.pessoa = pessoa
				 reside.numero = params.numero
				 reside.complemento = params.complemento
				 reside.cep = params.cep
				 reside.save(flush:true)*/

				//}
				//fim do reside


				println("Dados --- Id -- " + params.id + " | nacionalidade - " + params.nacionalidade + " | estado civil  " + params.estadoCivil)
				def cidadao = Cidadao.get(params.id)
				cidadao.nacionalidade = params.nacionalidade
				cidadao.estadoCivil = params.estadoCivil
				cidadao.rgNumero = params.rgNumero
				cidadao.rgDataDeEmissao = params.rgDataDeEmissao
				cidadao.rgOrgaoExpedidor = params.rgOrgaoExpedidor
				cidadao.rgComplemento = params.rgComplemento
				

				def aluno = Aluno.get(params.id)
				aluno.numeroDeInscricao = params.numeroDeInscricao

				//def alunos = Aluno.findAll()
				//def alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?",[session["escid"]])
				
				
				//------------- Necessidades Especiais -----------------
				
				
				def pfne = PessoaFisicaNecessidadesEspeciais.findAllByPessoaFisica(pessoaFisica)
				def dp = pfne.necessidadesEspeciais.id
				def necessidadesEspeciaisNovo = params.necessidadesEspeciais
				def idNe
				
				
				//---- Insert -----
				
				if (necessidadesEspeciaisNovo.getClass() != java.lang.String) 
				{
                      println("necessidades especiais" +necessidadesEspeciaisNovo)
					for (int i=0; i<necessidadesEspeciaisNovo.size(); i++){

						idNe = necessidadesEspeciaisNovo[i]

						if (!dp.contains(idNe.toLong())){
							

							def necessidadesEspeciais = NecessidadesEspeciais.get(idNe)
							PessoaFisicaNecessidadesEspeciais pessoaFisicaNecessidadesEspeciais = new PessoaFisicaNecessidadesEspeciais()
							pessoaFisicaNecessidadesEspeciais.pessoaFisica = pessoaFisica
							pessoaFisicaNecessidadesEspeciais.necessidadesEspeciais = necessidadesEspeciais
							pessoaFisicaNecessidadesEspeciais.observacao = ""
							
							pessoaFisicaNecessidadesEspeciais.save(flush:true)


						}
					}

				}else{

					idNe = necessidadesEspeciaisNovo

					if (!dp.contains(idNe.toLong())){
						
							def necessidadesEspeciais = NecessidadesEspeciais.get(idNe)
							PessoaFisicaNecessidadesEspeciais pessoaFisicaNecessidadesEspeciais = new PessoaFisicaNecessidadesEspeciais()
							pessoaFisicaNecessidadesEspeciais.pessoaFisica = pessoaFisica
							pessoaFisicaNecessidadesEspeciais.necessidadesEspeciais = necessidadesEspeciais
							pessoaFisicaNecessidadesEspeciais.observacao = ""
							
							pessoaFisicaNecessidadesEspeciais.save(flush:true)
	 
					}

				}
				
				// ---------------
				
				
				// --- Delete ---
				if (necessidadesEspeciaisNovo.getClass() != java.lang.String) {
					for (int i=0; i<dp.size(); i++){

						def cont = 0
						for (int j = 0;j<necessidadesEspeciaisNovo.size(); j++) {
							if (dp[i].toString() == necessidadesEspeciaisNovo[j].toString()){
								cont = cont+1
							}
							idNe = dp[i]
						}

						if (cont == 0){
							def necessidadesEspeciais = NecessidadesEspeciais.get(idNe)
							def neDel = PessoaFisicaNecessidadesEspeciais.findByNecessidadesEspeciaisAndPessoaFisica(necessidadesEspeciais, pessoaFisica)

							neDel.delete()
						}
					}
				}else {
					for (int i=0; i<dp.size(); i++){
						def cont = 0
						if (dp[i].toString() == necessidadesEspeciaisNovo){
							cont = cont+1
						}
						idNe = dp[i]

						if (cont == 0){
							
							def necessidadesEspeciais = NecessidadesEspeciais.get(idNe)
							def neDel = PessoaFisicaNecessidadesEspeciais.findByNecessidadesEspeciaisAndPessoaFisica(necessidadesEspeciais, pessoaFisica)
							

							neDel.delete()
						}
					}
				}
				
				//-----------------------
				
				//------------------------------------------------------
				
				
				
				
				
				

				if(aluno.save(flush:true)){

					//salvar documento
					println("documento akiiiiiiii" +aluno)
					request.getFiles("documentos[]").each { file ->
						println("documento do atualizar akikkkkkk ---+++ " + file.originalFilename)

						Documento documento = new Documento()
						FileUploadServiceController fil = new  FileUploadServiceController()
						documento.arquivo = fil.uploadFile(file,file.originalFilename, "/documentos/${aluno.id}")
						documento.dataDocumento = new Date()
						documento.aluno = aluno
						if(documento.save(flush:true)){
							println("documento salvo -----")
						}
					}

					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), "aluno atualizado " + aluno.id.toString(), "atualizar" , "Aluno", date)

					listarMensagem("Aluno atualizado com sucesso", "ok")
				
				    }else{

					listarMensagem("Erro ao Atualizar", "erro")
				}
			}
		}

	}

	def listar() {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2)
			{
				def escolas = Escola.get(Long.parseLong(session["escid"].toString()))

				def series = Serie.findAll()

				def necessidadesEspeciais = NecessidadesEspeciais.findAll()


				//def pessoas = Pessoa.executeQuery(" select p from Pessoa p " +
				//			                      "  where p.id not in (select e.id from Escola e) ")

				def alunos

				if (session["escid"] == 0 ||session["escid"] == 29)
				{
					//alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id ", [max: 10, offset: 0])

				}else{

					//alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?", [session["escid"]])
				}


				def pHomens = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'MASCULINO' ")


				def pMulheres = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'FEMININO' ")

				render (view:"/aluno/listarAluno.gsp", model:[perm2:perm2, escolas:escolas, series:series, pHomens:pHomens, pMulheres:pMulheres, necessidadesEspeciais:necessidadesEspeciais])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def pesquisarAlunos(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm1 || perm2){
				def escolas
				def alunos
				def parametro = params.pesquisa

				if (session["escid"] == 0 || session["escid"] == 29 ){
					alunos = Aluno.executeQuery("select a from Pessoa as p , Aluno as a "+
							"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

					print("print alunossss "+ alunos )
					render(view:"/aluno/listarAluno.gsp", model:[alunos:alunos, perm2:perm2])
				}else{

					alunos = Aluno.executeQuery("select a from Pessoa as p , Aluno as a "+

							//"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

							"where p.id = a.id and p.escid = "+session["escid"]+" and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")
					render(view:"/aluno/listarAluno.gsp", model:[alunos:alunos, escolas:escolas, perm2:perm2])
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def listarMensagem(String msg, String tipo) {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listarMensagem"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			def pHomens = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
					" where p.id not in (select e.id from Escola e) " +
					" and pf.id = p.id " +
					" and pf.sexo = 'MASCULINO' ")


			def pMulheres = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
					" where p.id not in (select e.id from Escola e) " +
					" and pf.id = p.id " +
					" and pf.sexo = 'FEMININO' ")


			if (perm1 || perm2)
			{

				def alunos

				if (session["escid"] == 0 ||session["escid"] == 29)
				{
					//alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id ")
				}else{
					//alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?",[session["escid"]])
				}

				//render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos])
				if (tipo == "ok")
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, pHomens:pHomens, pMulheres:pMulheres, ok:msg, perm2:perm2])
				else
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, pHomens:pHomens, pMulheres:pMulheres, erro:msg, perm2:perm2])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm2){
				Aluno aluno  = Aluno.get(id)
                def documentos  = Documento.findAllByAluno(aluno)
			   for(def i = 0; i < documentos.size();i++){
				   def deletaDocumento = new File(grailsApplication.parentContext.getResource("/documentos/${aluno.id}").file.toString() + "/" + documentos[i].arquivo).delete()
				   
				   }
					
				//def deletaDocumento = new File(grailsApplication.parentContext.getResource("/documentos/").file.toString() + "/" + documento.arquivo).delete()
				Pessoa.deleteAll(Aluno.get(id))
				
				
				//redirect(action:"listar" )
               
				//log
				
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "aluno deletado " + aluno.cidadao.pessoaFisica.pessoa.id.toString(),"deletar", "Aluno", date)

				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def verInfoAluno (long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2)
			{

				Aluno alunos = Aluno.get(id)

				Parentesco parentescoPai = Parentesco.findByPessoaFisicaAndParentesco(PessoaFisica.get(alunos.id), "PAI")
				Parentesco parentescoMae = Parentesco.findByPessoaFisicaAndParentesco(PessoaFisica.get(alunos.id), "MÃE")

				Reside reside = Reside.findByPessoa(alunos.cidadao.pessoaFisica.pessoa)

				def documentosAluno  = Documento.findAllByAluno(alunos)

				println("Reside -- " + reside)
				
				
				PessoaFisica pessoaFisica = PessoaFisica.get(id)
				def pessoaFisicaNecessidadesEspeciais = PessoaFisicaNecessidadesEspeciais.findAllByPessoaFisica(pessoaFisica)


				render (view:"/aluno/verInfoAluno.gsp", model:[alunos:alunos,  parentescoPai:parentescoPai, parentescoMae:parentescoMae, reside:reside , 
					    documentosAluno:documentosAluno, pessoaFisicaNecessidadesEspeciais:pessoaFisicaNecessidadesEspeciais])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def salvar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm2)
			{

				Pessoa pessoa = new Pessoa(params)
				pessoa.escid = session["escid"]
				pessoa.nome = params.nome.toString().toUpperCase()

				def reg = Pessoa.executeQuery("SELECT MAX(id) FROM Pessoa")
				def value = reg[0]+1
				def year = Calendar.getInstance().get(Calendar.YEAR);

				if (pessoa.save(flush:true)){

					pessoa.errors.each{println it}

					def datet = new Date()
					PessoaFisica pessoaFisica = new PessoaFisica(params)
					pessoaFisica.pessoa = pessoa
					//pessoaFisica.sexo = params.sexo
					//pessoaFisica.cor = params.corRaca
					pessoaFisica.rcDataDoRegistro = params.rcDataDoRegistro
					//pessoaFisica.rcDataDoRegistro = datet
					//pessoaFisica.rcCidade = params.rcCidade
					
		
/*
					  PessoaFisica.withTransaction{ status ->
					 try{
					 pessoaFisica.save(flush:true)
					 }catch(Exception exp){
					 pessoa.errors.reject( 'Erro em pessoa' )
					 status.setRollbackOnly()
					 }
					 }
*/					
					try {

						if(pessoaFisica.save(flush:true)){
							
							pessoaFisica.errors.each{println it}
							println("params akiiii" +params)
							if(params.deficiencia == "S"){
								//adicionar necessidades Especiais
		
								for (var in params.necessidadesEspeciais) {
		
									def necessidadesEspeciais = NecessidadesEspeciais.get(var.toString().toInteger())
								    PessoaFisicaNecessidadesEspeciais pessoaFisicaNecessidadesEspeciais = new PessoaFisicaNecessidadesEspeciais()
									println("necessidaespecia " +var)
									
									pessoaFisicaNecessidadesEspeciais.pessoaFisica = pessoaFisica
									pessoaFisicaNecessidadesEspeciais.necessidadesEspeciais = necessidadesEspeciais
									pessoaFisicaNecessidadesEspeciais.observacao = ""
									println("pessoa fisica  akiiii " + pessoaFisica)
									
						            			
									if(pessoaFisicaNecessidadesEspeciais.save(flush:true)){
										
										def date = new Date()
										AdministracaoController adm = new AdministracaoController()
										adm.salvaLog(session["usid"].toString().toInteger(), "PessoaFisicaNecessidadesEspeciais " + 
											         pessoaFisicaNecessidadesEspeciais.id.toString(),"cadastrado", "PessoaFisicaNecessidadesEspeciais", date)
										
									}else{
										pessoaFisicaNecessidadesEspeciais.errors.each{println it}
									
									}
		
								}
		
							}
											
						}else{
						pessoaFisica.errors.each{println it}
											
						}
					
				   } catch (SQLException e) {
					  while(e.getNextException() != null) {
						  println ("ERROOOOOOO --------  ");
						 println (e.getNextException());
					  }
				   }


					Cidadao cidadao = new Cidadao(params)
					cidadao.pessoaFisica = pessoaFisica
					cidadao.rgNumero = params.rgNumero
					cidadao.rgDataDeEmissao = params.rgDataDeEmissao
					cidadao.rgOrgaoExpedidor = params.rgOrgaoExpedidor
					cidadao.rgComplemento = params.rgComplemento

					cidadao.save(flush:true)
					cidadao.errors.each{println it}


					Aluno aluno = new Aluno()
					//aluno.cidadao = cidadao
                   
					aluno.numeroDeInscricao = year+""+value
					println("Pessoa --- " + params)

					//parentesco
					Parentesco parentescoPai = new Parentesco()
					Parentesco parentescoMae = new Parentesco()

					Pessoa idPai = new Pessoa()
					Pessoa idMae = new Pessoa()

					println(" params.nomePaiInput -- " + params.nomePaiInput + " params.nomePai -- " + params.nomePai + " params.idNomePai -- " + params.idNomePai)
					println(" params.nomeMaeInput -- " + params.nomeMaeInput + " params.nomeMae -- " + params.nomeMae + " params.idNomeMae -- " + params.idNomeMae)

					//alteração de id pai e mae
					if(params.nomePaiInput == "" || params.nomePaiInput == null){
						idPai = Pessoa.get(params.pai)
					}else{
						idPai = Pessoa.get(params.idNomePai)
					}

					if(params.nomeMaeInput == "" || params.nomeMaeInput == null){
						idMae = Pessoa.get(params.mae)
					}else{
						idMae = Pessoa.get(params.idNomeMae)
					}


					if((params.pai != 0) || (params.nomePaiInput != "")){

						parentescoPai.pessoaFisica = pessoaFisica
						parentescoPai.pessoa = idPai
						parentescoPai.parentesco = "PAI"
						parentescoPai.save(flush:true)
					}

					if((params.mae != 0) || (params.nomeMaeInput != "")){

						parentescoMae.pessoaFisica = pessoaFisica
						parentescoMae.pessoa = idMae
						parentescoMae.parentesco = "MÃE"
						parentescoMae.save(flush:true)
					}

					//endereço

					TipoLogradouro tipoLogradouro = new TipoLogradouro()
					Logradouro logradouro = new Logradouro()

					Bairro bairro = new Bairro()
					Municipio municipio = new Municipio()
					Estado estado = new Estado()
					Reside newReside = new Reside()
					def tipoLogradouroSimple
					def logradouroSimple

					if(params.endereco != ""){
						//def tipoLogradouroSimple = params.endereco.toString().substring(0, params.endereco.toString().indexOf(" "))
						//def logradouroSimple = params.endereco.toString().substring((params.endereco.toString().indexOf(" ")+1) , params.endereco.toString().size())


						if (params.endereco.toString().indexOf(" ") != -1) {
							tipoLogradouroSimple = params.endereco.toString().substring(0, params.endereco.toString().indexOf(" "))
							logradouroSimple = params.endereco.toString().substring((params.endereco.toString().indexOf(" ")+1) , params.endereco.toString().size())
						}else{
							tipoLogradouroSimple = "RUA"
							logradouroSimple = params.endereco
						}


						println("Teste tipo --- " + tipoLogradouroSimple + " Logradouro --- " + logradouroSimple)

						tipoLogradouro = TipoLogradouro.findByTipoLogradouro(tipoLogradouroSimple.toUpperCase())
						if(tipoLogradouro == null){
							TipoLogradouro newTipoLogradouro = new TipoLogradouro()
							newTipoLogradouro.tipoLogradouro = tipoLogradouroSimple
							newTipoLogradouro.save(flush:true)
							println("TipoLogradouro --- " + newTipoLogradouro.tipoLogradouro)
							tipoLogradouro = newTipoLogradouro
						}

						logradouro = Logradouro.findByLogradouro(logradouroSimple.toUpperCase())
						if(logradouro == null){
							Logradouro newLogradouro = new Logradouro()
							newLogradouro.logradouro = logradouroSimple
							newLogradouro.tipoLogradouro = tipoLogradouro
							newLogradouro.save(flush:true)
							println("Logradouro --- " + newLogradouro.logradouro)
							logradouro = newLogradouro
						}
					}

					println("UF aqui -- " + params.uf)
					if(params.uf != ""){
						estado = Estado.findByAbreviacao(params.uf.toString().toUpperCase())
						if(estado == null){
							Estado newEstado = new Estado()
							newEstado.estado = params.uf.toString().toUpperCase()
							newEstado.abreviacao = params.uf.toString().toUpperCase()
							newEstado.save(flush:true)
							println("Estado --- " + newEstado.estado)
							estado = newEstado
						}
					}

					if(params.municipio != ""){
						municipio = Municipio.findByMunicipio(params.municipio.toString().toUpperCase())
						if(municipio == null){
							Municipio newMunicipio = new Municipio()
							newMunicipio.municipio = params.municipio.toString().toUpperCase()
							newMunicipio.estado = estado
							newMunicipio.save(flush:true)
							println("Municipio --- " + newMunicipio.municipio)
							municipio = newMunicipio
						}
					}

					if(params.bairro != ""){
						bairro = Bairro.findByBairro(params.bairro.toString().toUpperCase())
						if(bairro == null){
							Bairro newBairro = new Bairro()
							newBairro.bairro = params.bairro.toString().toUpperCase()
							newBairro.municipio = municipio
							newBairro.save(flush:true)
							println("Bairro --- " + newBairro.bairro)
							bairro = newBairro

							DivisaoAdministrativa newDivisaoAdministrativa = new DivisaoAdministrativa()
							newDivisaoAdministrativa

						}
					}

					newReside.bairro = bairro
					newReside.logradouro = logradouro
					newReside.pessoa = pessoa
					newReside.numero = params.numero
					newReside.complemento = params.complemento
					newReside.cep = params.cep
					if(newReside.save(flush:true) == false){
						listarMensagem("Erro ao salvar reside", "erro")
					}
					println("reside --- " + newReside.id)



					if(aluno.save(flush:true)){
						println("salvou o aluno kkkkkkk")
						println("Data --- " + params.datanascimento)


						aluno.errors.each{println it}

						println("params matricula ---- " + params)

						if (params.realizarMatricula == "SIM") {

							Matricula matriculaM = new Matricula(params)
							matriculaM.aluno = Aluno.get(aluno.id)
							matriculaM.turma = Turma.get(Integer.parseInt(params.turma))

							//formatando a tada para java.util.date
							SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy")
							java.sql.Date data = new java.sql.Date(format.parse(params.dataDaMatricula_day+"/"+params.dataDaMatricula_month+"/"+params.dataDaMatricula_year).getTime())

							matriculaM.dataDaMatricula = data

							matriculaM.matricula = params.matricula
							matriculaM.status = 'Ativo'

							if(matriculaM.save(flush:true)){

								println("salvou matricula")
							}

						}


						//documento

						request.getFiles("documentos[]").each { file ->

							println("Documentos aqui ---+++ " + file.originalFilename)

							Documento documento = new Documento()
							FileUploadServiceController fc = new FileUploadServiceController()
							documento.arquivo = fc.uploadFile(file,file.originalFilename, "/documentos/${aluno.id}")
							documento.dataDocumento = new Date()
							documento.aluno = aluno

							if(documento.save(flush:true)){
								println("documento salvo")

							}

							else{

								def erros
								documento.errors.each {erros = it}
								print("erros: "+erros)
								listarMensagem("Erro ao salvar o documento", "erro")
							}
						}


						def date = new Date()
						AdministracaoController adm = new AdministracaoController()
						adm.salvaLog(session["usid"].toString().toInteger(), "aluno matriculado " + aluno.id.toString(),"cadastrar", "Aluno", date)


						/*				def alunos = Aluno.findAll()
						 render(view:"/aluno/listarAluno.gsp", model:[
						 alunos:alunos,
						 ok : "Aluno cadastrado com sucesso!" ])*/
						listarMensagem("Aluno salvo com sucesso", "ok")

					}else{
						/*				def alunos = Aluno.findAll()
						 render(view:"cadastrar", model:[
						 erro : "Erro ao Salvar!" ])*/
						listarMensagem("Erro ao salvar aluno", "erro")
					}
				}else{

					def erros
					pessoa.errors.each{erros = it}


					if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
						erros = "CPF J� est� cadastrado no sistema"
					}

					def alunos = Aluno.findAll()

					def pHomens = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
							" where p.id not in (select e.id from Escola e) " +
							" and pf.id = p.id " +
							" and pf.sexo = 'MASCULINO' ")


					def pMulheres = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
							" where p.id not in (select e.id from Escola e) " +
							" and pf.id = p.id " +
							" and pf.sexo = 'FEMININO' ")

					render(view:"/aluno/listarAluno.gsp", model:[alunos:alunos,	erro : erros, pHomens:pHomens, pMulheres:pMulheres	])
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def cadastrarPai(){

		Pessoa pessoa = new Pessoa()

		pessoa.nome = params.nome
		if (params.cpf != "0"){
			pessoa.cpfCnpj = params.cpf
		}

		println(" cpf " + params.cpf + " " + params.nome)

		if(pessoa.save(flush:true)){

			PessoaFisica pf = new PessoaFisica()
			pf.pessoa = pessoa
			pf.sexo = "MASCULINO"

			if (pf.save(flush:true)){

				//	def vetorPais = []
				//vetorPais = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
				//		" where p.id not in (select e.id from Escola e) " +
				//			" and pf.id = p.id " +
				//			" and pf.sexo = 'MASCULINO'")
				//render(view:"/aluno/listarAluno.gsp", model:[vetorpais:vetorPais])

				Cidadao cidadao = new Cidadao()
				cidadao.estadoCivil = params.estadoCivilPai
				cidadao.profissao = params.profissaoPai
				cidadao.pessoaFisica = PessoaFisica
				
				cidadao.save(flush:true)
				
				
				def result = []

				result[0] = ["id":pessoa.id, "nome":pessoa.nome]

				println result

				//for (int i=0; i<vetorPais.size();i++) {
				//	print "<<< FOR >>>"
				//	result[i] = ["id":vetorPais[i].id, "nome":vetorPais[i].nome]
				//	print "RESULT >>> "+result[i]
				//}


				render result as JSON
			}

		}else{
			listarMensagem("Erro ao salvar", "erro")
		}
	}


	def cadastrarMae(){

		Pessoa pessoa = new Pessoa()

		pessoa.nome = params.nome
		if (params.cpf != "0"){
			pessoa.cpfCnpj = params.cpf
		}

		if(pessoa.save(flush:true)){

			PessoaFisica pf = new PessoaFisica()

			pf.pessoa = pessoa
			pf.sexo = "FEMININO"

			if (pf.save(flush:true)){
				
				Cidadao cidadao = new Cidadao()
				cidadao.estadoCivil = params.estadoCivilMae
				cidadao.profissao = params.profissaoMae
				cidadao.pessoaFisica = PessoaFisica
				
				cidadao.save(flush:true)
				
				/*	def vertorMae = []
				 vertorMae = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
				 " where p.id not in (select e.id from Escola e) " +
				 " and pf.id = p.id " +
				 " and pf.sexo = 'FEMININO'")
				 render(view:"/aluno/listarAluno.gsp", model:[vetorMae:vertorMae])*/

				def result = [];

				result[0] = ["id":pessoa.id, "nome":pessoa.nome]

				/*for (int i=0; i<vertorMae.size();i++) {
				 result[i] = ["id":vertorMae[i].id, "nome":vertorMae[i].nome]
				 }
				 */
				render result as JSON
			}

		}else{
			listarMensagem("Erro ao salvar", "erro")
		}

	}


	def transferencia(long id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm2)
			{


				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def aluno = Aluno.get(id)

				def matricula
				def escolas

				if (session["escid"] == 0 || session["escid"] == 29)
				{
					matricula = Matricula.executeQuery(
							" select m from Matricula m, Aluno a, "+
							"               Pessoa p, Turma t "+
							" where a.id = m.aluno.id "+
							" and a.id = p.id "+
							" and t.id = m.turma.id "+
							" and t.anoLetivo = ? "+
							" and p.id = ? " +
							" and m.status = 'Ativo' ", [ano, id])

					escolas = Escola.executeQuery("select e from Escola e, Pessoa p where "+
							" e.id = p.id and p.status = 'Ativo' ")
				}else{

					matricula = Matricula.executeQuery(
							" select m from Matricula m, Aluno a, "+
							"               Pessoa p, Turma t "+
							" where a.id = m.aluno.id "+
							" and a.id = p.id "+
							" and t.id = m.turma.id "+
							" and t.escola.id = ? "+
							" and t.anoLetivo = ? "+
							" and p.id = ? " +
							" and m.status = 'Ativo' ", [session["escid"].toString().toLong(), ano, id])

					escolas = Escola.executeQuery("select e from Escola e, Pessoa p where "+
							" e.id = p.id and p.status = 'Ativo' and e.id != ?", [session["escid"].toString().toLong()])

				}


				render (view:"/transferencia/transferir.gsp", model:[aluno:aluno, matricula:matricula, escolas:escolas])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def getPessoaMasculino() {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/Login.gsp")
		}else{

			def pais = []


			//pais = PessoaFisica.findAllBySexo("MASCULINO")
			pais = PessoaFisica.findAllBySexo("MASCULINO")

			//	pais = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
			//			" where p.id not in (select e.id from Escola e) " +
			//			" and pf.id = p.id " +
			//			" and pf.sexo = 'MASCULINO'")



			def result = ["id":pais?.id, "pessoa":pais?.pessoa?.nome]
			println("pais[pais.size]->> "+pais[(pais.size-1)]?.pessoa?.nome)
			render (result as JSON)

		}

	}


	def adicionarDocumento(request){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm2)

			{

				
			request.getFiles("arquivo[]").each { file ->
			println("Arquivo do editar akikkkkkk ---+++ " + file.originalFilename)
			
			Documento documento = new Documento()
			Aluno aluno = new Aluno()
		    aluno = Aluno.get(documento.aluno.id)
			
			FileUploadServiceController fil = new  FileUploadServiceController()
		    documento.arquivo =  fil.uploadFile(file,file.originalFilename, "/documentos/" + aluno.id.toString())
			documento.dataDocumento = new Date()
			documento.aluno = aluno
			if(documento.save(flush:true)){
				println("documento salvo -----")
			  }
			
		   redirect(action:"editarAluno" , params:[id:documento.aluno.id])
			
      		 }	
	   
		   }
		 }
	  }

	// documentos referentes a view de editar
	def removerDocumento(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm2)

			{

			  Documento documento = new Documento()	
		      documento = Documento.get(id)	
			  Aluno aluno  = new Aluno()
			  aluno = Aluno.get(documento.aluno.id)
			  documento.deleteAll(documento)
			  def deletaDocumento = new File(grailsApplication.parentContext.getResource("/documentos/${aluno.id}").file.toString() + "/" + documento.arquivo).delete()
			  
			  def documentosAluno = Documento.findAllByAluno(aluno)
			  
			  
			  redirect(action:"editarAluno", params:[id:aluno.id, aluno:aluno, documento:documento , perm2:perm2])
			

			}else{

				render(view:"/error403.gsp")
			}

		}
	}



	
	    def downloadDocumento(long id) {
	
				println("URL --- " + grailsApplication.parentContext.getResource("/documentos/").file.toString() + "\\" + "bla.txt")
				
				Documento documento = Documento.get(id)
				println("documento"+documento)
				def file = new File(grailsApplication.parentContext.getResource("/documentos/" + documento.aluno.id.toString()).file.toString() + "/" + documento.arquivo)
				
				/*def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "Download de arquivo: " + grailsApplication.parentContext.getResource("/anexos/").file.toString() + "/" + anexo.arquivo ,
								"DOWNLOAD", "Anexo", date)*/
				
				if (file.exists())
		
				{
		
					response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
					//response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
					response.setHeader("Content-disposition", " attachment; filename=" + documento.arquivo )
					response.outputStream << file.bytes
					response.outputStream.flush()
					response.outputStream.close()
		
				}
		
				else{
					
					def erros
					documento.errors.each {erros = it}
					print("erros: "+erros)
					listarMensagem("Erro ao baixar o arquivo", "erro")
				}
			}
	}



