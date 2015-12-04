package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.academico.Disciplina
import br.gov.rn.saogoncalo.academico.DisciplinaLecionadaPorProfessor
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.organizacao.Cargo
import br.gov.rn.saogoncalo.organizacao.Lotacao



class ProfessorController {

	def index() {
	}
	
	def pesquisarProfessores(){
		
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2){

				def professores
				def parametro = params.pesquisa
				if (session["escid"] == 0){
					professores = Professor.executeQuery("select a from Pessoa as p , Professor as a "+
							"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"') " + 
							"    and p.escid = "+Long.parseLong(session["escid"].toString()) )

					print("print professores "+ professores )
				}else{
					professores = Professor.executeQuery("select a from Pessoa as p , Professor as a "+
							"where p.id = a.id and p.escid = "+session["escid"]+" and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"') " +
							"    and p.escid = "+Long.parseLong(session["escid"].toString()))

				}

				render(view:"/professor/listarProfessor.gsp", model:[professores:professores, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
		
		
	

	def listar (){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			def professores
			
			if (perm1 || perm2) {
				
				if (session["escid"] == 0)
				{
					//professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id ")
				}else{
					//professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id and p.escid = ?",[session["escid"]])
				
				}
				
				
				render (view:"/professor/listarProfessor.gsp", model:[professores:professores, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def listarMensagem(String msg, String tipo){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			if (perm1 || perm2) {

				def professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id and p.escid = ?",[session["escid"]])
				if (tipo == "ok")
					render(view:"/professor/listarProfessor.gsp", model:[professores:professores, ok:msg, perm2:perm2])
				else
					render(view:"/professor/listarProfessor.gsp", model:[professores:professores, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")
			if (perm2) {
				Pessoa.deleteAll(Pessoa.get(id))
				
				Professor professores = Professor.get(id)
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "professor deletado " + professores.funcionario.cidadao.pessoaFisica.pessoa.id.toString(),"deletar", "Professor", date)
				

				//redirect(action:"listar" )
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def verInfoProfessor (long id){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			if (perm1 || perm2) {
				Professor professores = Professor.get(id)


				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(professores)

				def dlppl =  dlpp.disciplina.id

				def disc  = Disciplina.findAll()

				render (view:"/professor/verInfoProfessor.gsp", model:[professores:professores, dlppl:dlppl, disc:disc])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def editarProfessor(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			if (perm2) {
				Professor professores = Professor.get(id)


				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(professores)

				def dlppl =  dlpp.disciplina.id

				def disc  = Disciplina.findAll()
				
							

				render (view:"/professor/editarProfessor.gsp", model:[professores:professores, dlppl:dlppl, disc:disc])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			if (perm2) {
				def pessoa = Pessoa.get(params.id)

				println("Parmas - " + params)
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

				def cidadao = Cidadao.get(params.id)
				cidadao.nacionalidade = params.nacionalidade
				cidadao.estadoCivil = params.estadoCivil
				cidadao.profissao = params.profissao

				def funcionario = Funcionario.get(params.id)
				funcionario.cargaHoraria = params.cargaHoraria
				funcionario.matricula = params.matricula

				def professor = Professor.get(params.id)
				professor.identificacao = params.identificacao


				///////////////////////////////////////////////////////////////////


				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(professor)
				def dp = dlpp.disciplina.id
				def disciplinaNovo = params.disciplinaLecionadaPorProfessor
				def idDisc


				println(" disciiplinaNovo - " + disciplinaNovo)

				if (disciplinaNovo.getClass() != java.lang.String)
				{

					for (int i=0; i<disciplinaNovo.size(); i++){

						idDisc = disciplinaNovo[i]

						if (!dp.contains(idDisc.toLong())){
							DisciplinaLecionadaPorProfessor professorDisciplina = new DisciplinaLecionadaPorProfessor()

							def dpi = Disciplina.get(idDisc)

							professorDisciplina.professor = professor
							professorDisciplina.disciplina = dpi
							professorDisciplina.data = new Date()
							professorDisciplina.situacao = "ATIVA"

							professorDisciplina.save(flush:true)


						}
					}

				}else{

					idDisc = disciplinaNovo

					if (!dp.contains(idDisc.toLong())){
						DisciplinaLecionadaPorProfessor professorDisciplina = new DisciplinaLecionadaPorProfessor()

						def dpi = Disciplina.get(idDisc)

						professorDisciplina.professor = professor
						professorDisciplina.disciplina = dpi
						professorDisciplina.data = new Date()
						professorDisciplina.situacao = "ATIVA"

						professorDisciplina.save(flush:true)
     
					}

				}
				

				if (disciplinaNovo.getClass() != java.lang.String) {
					for (int i=0; i<dp.size(); i++){

						def cont = 0
						for (int j = 0;j<disciplinaNovo.size(); j++) {
							if (dp[i].toString() == disciplinaNovo[j].toString()){
								cont = cont+1
							}
							idDisc = dp[i]
						}

						if (cont == 0){
							def disc = Disciplina.get(idDisc)
							def dlppl = DisciplinaLecionadaPorProfessor.findByDisciplinaAndProfessor(disc, professor)

							dlppl.delete()
						}
					}
				}else {
					for (int i=0; i<dp.size(); i++){
						def cont = 0
						if (dp[i].toString() == disciplinaNovo){
							cont = cont+1
						}
						idDisc = dp[i]

						if (cont == 0){

							def disc = Disciplina.get(idDisc)
							def dlppl = DisciplinaLecionadaPorProfessor.findByDisciplinaAndProfessor(disc, professor)

							dlppl.delete()
						}
					}
				}

				println('Professor - ' + professor)

				if(professor.save(flush:true)){

					listarMensagem("Professor salvo com sucesso", "ok")


				}else{

					listarMensagem("Erro ao salvar", "erro")

				}
				
				 //log
				 def date = new Date()
				 professor = Professor.get(params.id)
				 AdministracaoController adm = new AdministracaoController()
				 adm.salvaLog(session["usid"].toString().toInteger(), "professor atualizado " + professor.funcionario.cidadao.pessoaFisica.pessoa.id.toString(),"atualizar", "Professor", date)
				 
 

			}
		}
	}


	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "PROFESSOR", "2")

			if (perm2) {


				Pessoa pessoa = new Pessoa(params)
				pessoa.escid = session["escid"]
				pessoa.nome = params.nome.toString().toUpperCase()

				if (pessoa.save(flush:true)){

					PessoaFisica pessoaFisica = new PessoaFisica(params)
					pessoaFisica.pessoa = pessoa
					pessoaFisica.save(flush:true)
					pessoaFisica.errors.each{println it}

					Cidadao cidadao = new Cidadao(params)
					cidadao.pessoaFisica = pessoaFisica
					cidadao.save(flush:true)
					cidadao.errors.each{println it}

					Funcionario funcionario = new Funcionario(params)
					funcionario.cidadao = cidadao
					funcionario.save(flush:true)
					funcionario.errors.each{println it}

					Professor professor = new Professor(params)
					professor.funcionario = funcionario


					if(professor.save(flush:true)){


						DisciplinaLecionadaPorProfessor disciplinaProfessor = new DisciplinaLecionadaPorProfessor()
						Disciplina disciplina

						for (var in params.disciplinaProf) {

							disciplinaProfessor = new DisciplinaLecionadaPorProfessor()
							disciplina = new Disciplina()

							//disciplina = Disciplina.get(Integer.parseInt(var))
							disciplina = Disciplina.get(var)


							disciplinaProfessor.professor = professor
							disciplinaProfessor.disciplina = disciplina

							disciplinaProfessor.data = new Date()


							disciplinaProfessor.situacao = "ATIVA"
							disciplinaProfessor.save(flush:true)
							
							
							def date = new Date()
							AdministracaoController adm = new AdministracaoController()
							adm.salvaLog(session["usid"].toString().toInteger(), "professor cadastrado " + professor.funcionario.cidadao.pessoaFisica.pessoa.id.toString(),"cadastrado", "Professor", date)
							


						}
						
						
						Cargo cargo= Cargo.findByCargo("PROFESSOR")
						
						Lotacao lotacao = new Lotacao()
						lotacao.cargo= cargo
						lotacao.funcionario = funcionario
						lotacao.situacao="Ativo"
						lotacao.vinculo= "EFETIVO"
						lotacao.funcao= "PROFESSOR"
						lotacao.turno = "MTN"
						lotacao.dataInicio = new Date()
						lotacao.dataTermino = new Date()
						lotacao.save(flush:true)
						



						/*				def professores = Professor.findAll()
						 render(view:"/professor/listarProfessor.gsp", model:[
						 professores:professores,
						 ok : "Professor cadastrado com sucesso!" ])*/

						listarMensagem("Professor salvo com sucesso", "ok")

					}else{

						listarMensagem("Erro ao salvar", "erro")

						/*				def professores = Professor.findAll()
						 professor.errors.each{println it}
						 render(view:"/professor/listarProfessor.gsp", model:[
						 professores:professores,
						 erro : "Erro ao Salvar Professor!" ])*/
					}





				}else{

					def erros

					println("Erros ----- " + erros.toString())

					if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
						erros = "CPF J� est� cadastrado no sistema"}

					/*def professores = Professor.findAll()
					 render(view:"/professor/listarProfessor.gsp", model:[
					 professores:professores,
					 erro : erros ]) */

					listarMensagem("Erro ao salvar", "erro")

				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}
