package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.academico.Matricula
import br.gov.rn.saogoncalo.academico.Serie
import br.gov.rn.saogoncalo.localizacao.Bairro
import br.gov.rn.saogoncalo.localizacao.Logradouro
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Parentesco
import grails.converters.JSON
import groovy.json.JsonSlurper

class AlunoController {

	def index() {
	}

	def cadastrar(){
	}

	def buscarCEP(String cep) {
		String urlCompleta
		String urlBase = "http://cep.correiocontrol.com.br/"

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

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")){

				Aluno alunos = Aluno.get(id)

				render (view:"/aluno/editarAluno.gsp", model:[alunos:alunos])
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

				def pessoa = Pessoa.get(params.id)
				pessoa.nome = params.nome
				pessoa.dataDeNascimento = params.dataDeNascimento
				if (!params.cpfCnpj.trim().equals(''))
					pessoa.cpfCnpj = params.cpfCnpj
				else
					pessoa.cpfCnpj = null

				def pessoaFisica = PessoaFisica.get(params.id)
				pessoaFisica.rcNumero = params.rcNumero
				pessoaFisica.rcNomeDoCartorio = params.rcNomeDoCartorio
				pessoaFisica.rcNomeDoLivro = params.rcNomeDoLivro
				pessoaFisica.rcFolhaDoLivro = params.rcFolhaDoLivro
				pessoaFisica.sexo = params.sexo


				println("Dados --- Id -- " + params.id + " | nacionalidade - " + params.nacionalidade + " | estado civil  " + params.estadoCivil)
				def cidadao = Cidadao.get(params.id)
				cidadao.nacionalidade = params.nacionalidade
				cidadao.estadoCivil = params.estadoCivil

				def aluno = Aluno.get(params.id)
				aluno.numeroDeInscricao = params.numeroDeInscricao

				//def alunos = Aluno.findAll()
				def alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?",[session["escid"]])

				if(aluno.save(flush:true)){

					/*			render(view:"/aluno/listarAluno.gsp", model:[
					 alunos:alunos,
					 ok : "Aluno atualizado com sucesso!" ])*/
					listarMensagem("Aluno atualizado com sucesso", "ok")
				}else{
					/*			render(view:"/aluno/editarAluno.gsp", model:[alunos:alunos,
					 erro : "Erro ao atualizar!" ])*/
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


				//def pessoas = Pessoa.executeQuery(" select p from Pessoa p " +
				//			                      "  where p.id not in (select e.id from Escola e) ")

				def alunos

				if (session["escid"] == 0)
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





				render (view:"/aluno/listarAluno.gsp", model:[perm2:perm2, escolas:escolas, series:series, pHomens:pHomens, pMulheres:pMulheres])
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

				def alunos
				def parametro = params.pesquisa
				if (session["escid"] == 0){
					alunos = Aluno.executeQuery("select a from Pessoa as p , Aluno as a "+
							"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

					print("print alunossss "+ alunos )
				}else{
					alunos = Aluno.executeQuery("select a from Pessoa as p , Aluno as a "+

							//"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

							"where p.id = a.id and p.escid = "+session["escid"]+" and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

				}

				render(view:"/aluno/listarAluno.gsp", model:[alunos:alunos, perm2:perm2]) 
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


			if (perm1 || perm2)
			{

				def alunos

				if (session["escid"] == 0)
				{
					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id ")
				}else{
					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?",[session["escid"]])
				}



				//render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos])
				if (tipo == "ok")
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, ok:msg, perm2:perm2])
				else
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, erro:msg, perm2:perm2])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm2){
				Pessoa.deleteAll(Pessoa.get(id))
				//redirect(action:"listar" )
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

				def alunos = Aluno.get(id)


				render (view:"/aluno/verInfoAluno.gsp", model:[alunos:alunos])
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

				def reg = Pessoa.executeQuery("SELECT MAX(id) FROM Pessoa")
				def value = reg[0]+1
				def year = Calendar.getInstance().get(Calendar.YEAR);



				if (pessoa.save(flush:true)){
					pessoa.errors.each{println it}

					PessoaFisica pessoaFisica = new PessoaFisica(params)
					pessoaFisica.pessoa = pessoa
					pessoaFisica.save(flush:true)
					pessoaFisica.errors.each{println it}

					Cidadao cidadao = new Cidadao(params)
					cidadao.pessoaFisica = pessoaFisica
					cidadao.save(flush:true)
					cidadao.errors.each{println it}


					Aluno aluno = new Aluno(params)
					aluno.cidadao = cidadao

					aluno.numeroDeInscricao = year+""+value



					/*//codigo pra inserir o reside  
					 def estado = new Estado()
					 estado.abreviacao = params.uf
					 estado.estado = params.estado //verificar aqui
					 //estado.save(flush:true)
					 def municipio = new Municipio()
					 municipio.municipio = params.municipio
					 municipio.estado = estado
					 //municipio.save(flush:true)
					 def divisaoAdministrativa = new DivisaoAdministrativa()
					 divisaoAdministrativa.nome = params.divisaoAdministrativa
					 divisaoAdministrativa.municipio = municipio
					 //divisaoAdministrativa.save(flush:true)
					 def bairro = new Bairro()  
					 bairro.municipio = municipio
					 bairro.bairro =	params.bairro
					 //bairro.save(flush:true)
					 def tipoLogradouro = new TipoLogradouro()
					 tipoLogradouro.tipoLogradouro = params.tipoLogradouro
					 //tipoLogradouro.save(flush:true)
					 def logradouro = new Logradouro()
					 logradouro.logradouro = params.logradouro
					 logradouro.tipoLogradouro = tipoLogradouro
					 //logradouro.save(flush:true)
					 def reside = new Reside()
					 reside.bairro = bairro
					 reside.logradouro = logradouro

					/*
					 //codigo pra inserir o reside  
					 def reside = new Reside()
					 reside.bairro = Bairro.get(params.bairro)
					 reside.logradouro = Logradouro.get(params.logradouro)
					 
					 reside.pessoa = pessoa
					 reside.numero = params.numero
					 reside.complemento = parmams.complemento
					 reside.cep = params.cep
					 if(reside.save(flush:true)){

					 }*/



					
					Parentesco parentescoPai = new Parentesco()
					Parentesco parentescoMae = new Parentesco()
					
					def idPai = Pessoa.get(params.idPai)
					def idMae = Pessoa.get(params.idMae)
					
					parentescoPai.pessoaFisica = pessoaFisica
					parentescoPai.pessoa = idPai
					parentescoPai.parentesco = "PAI"
					parentescoPai.save(flush:true)
										
					parentescoMae.pessoaFisica = pessoaFisica
					parentescoMae.pessoa = idMae
					parentescoMae.parentesco = "MÃE"
					parentescoMae.save(flush:true)
					
					println("Params aqui ---- " + params)
					

					def idBairro = Bairro.executeQuery("select b from Bairro as b where b.bairro = ?",[params.bairro])
					def idLogradouro = Logradouro.executeQuery(" select l " +
							"  from Logradouro as l, TipoLogradouro as tl " +
							"  where l.tipoLogradouro.id = tl.id " +
							"  and (tl.tipoLogradouro || ' ' || l.logradouro) = ? ", [params.endereco])


					if (idBairro.isEmpty() || idLogradouro.isEmpty()) {
						listarMensagem("Bairro ou Logradouro não encontrado.", "erro")
					}else{

						def reside = new Reside()
						reside.bairro = idBairro
						reside.logradouro = idLogradouro
						reside.pessoa = pessoa
						reside.numero = params.numero
						reside.complemento = params.complemento
						reside.cep = params.cep
						reside.save(flush:true)

					}

					if(aluno.save(flush:true)){
						aluno.errors.each{println it}

						/*				def alunos = Aluno.findAll()
						 render(view:"/aluno/listarAluno.gsp", model:[
						 alunos:alunos,
						 ok : "Aluno cadastrado com sucesso!" ])*/
						listarMensagem("Aluno salvo com sucesso", "ok")

					}else{
						/*				def alunos = Aluno.findAll()
						 render(view:"cadastrar", model:[
						 erro : "Erro ao Salvar!" ])*/
						listarMensagem("Erro ao salvar", "erro")
					}
				}else{

					def erros
					pessoa.errors.each{erros = it}


					if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
						erros = "CPF J� est� cadastrado no sistema"
					}

					def alunos = Aluno.findAll()
					render(view:"/aluno/listarAluno.gsp", model:[
						alunos:alunos,
						erro : erros
					])
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def cadastrarPai(){

		Pessoa pessoa = new Pessoa()

		pessoa.nome = params.nome

		if(pessoa.save(flush:true)){

			PessoaFisica pf = new PessoaFisica()

			pf.pessoa = pessoa
			pf.sexo = "MASCULINO"

			if (pf.save(flush:true)){
				def vetorPais = []
				vetorPais = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'MASCULINO'")
				render(view:"/aluno/listarAluno.gsp", model:[vetorpais:vetorPais])

				def result = [];

				for (int i=0; i<vetorPais.size();i++) {
					print "<<< FOR >>>"
					result[i] = ["id":vetorPais[i].id, "nome":vetorPais[i].nome]
					print "RESULT >>> "+result[i]
				}

				render result as JSON
			}

		}else{
			listarMensagem("Erro ao salvar", "erro")
		}
	}
	def cadastrarMae(){

		Pessoa pessoa = new Pessoa()

		pessoa.nome = params.nomeMae

		if(pessoa.save(flush:true)){

			PessoaFisica pf = new PessoaFisica()

			pf.pessoa = pessoa
			pf.sexo = "FEMININO"

			if (pf.save(flush:true)){
				def vertorMae = []
				vertorMae = Pessoa.executeQuery(" select p from Pessoa p, PessoaFisica pf " +
						" where p.id not in (select e.id from Escola e) " +
						" and pf.id = p.id " +
						" and pf.sexo = 'FEMININO'")

				render(view:"/aluno/listarAluno.gsp", model:[vetorMae:vertorMae])

				def result = [];

				for (int i=0; i<vertorMae.size();i++) {
					result[i] = ["id":vertorMae[i].id, "nome":vertorMae[i].nome]

				}

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

				if (session["escid"] == 0)
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




}
