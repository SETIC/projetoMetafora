package br.gov.rn.saogoncalo.academico
//import grails.converters.*

import grails.converters.JSON
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Pessoa
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController



class TurmaController {

	def index() {
	}


	def listar() {


		if((session["user"] == null) || (session["pass"] == null) ){

			redirect(uri: "/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
			//render (view:"/usuario/Login.gsp")
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "TURMA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm1 || perm2)
			{

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def turmas
				def disciplinas
				def escolas
				
				
				
				if ((session["escid"] == 0) )
				{

					 turmas = Horario.executeQuery(" select t from Turma as t " +
							"  where  t.anoLetivo >= ? ", [ano])

					 escolas = Escola.executeQuery(" select e from Escola e, Pessoa p where p.id = e.id and p.status = 'Ativo' ")

					 disciplinas = DisciplinaLecionadaPorProfessor.executeQuery(" select dlpp from DisciplinaLecionadaPorProfessor dlpp ")

				}else{

					 turmas = Horario.executeQuery(" select t from Turma as t " +
							"  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])

					 escolas = Escola.get(Long.parseLong(session["escid"].toString()))

					 disciplinas = DisciplinaLecionadaPorProfessor.executeQuery(" select dlpp from DisciplinaLecionadaPorProfessor dlpp where "+
							"dlpp.professor.id in (select p.id from Pessoa p where escid = ?) ", [Integer.parseInt(session["escid"].toString())])

				}


				render (view:"/turma/listarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, escolas:escolas, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}

		}
	}


	def getTurmaByEscola (long id) {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/Login.gsp")
		}else{


			Escola escola = Escola.get(params.id)

			def result = ["id":escola?.turma.id, "turma":escola?.turma.turma]

			render( result as JSON)
			//}

		}
	}

	def getTurmaByEscolaAndSerie(long idEscola, long idSerie) {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/Login.gsp")
		}else{

			Calendar ca = Calendar.getInstance()
			int ano = ca.get(Calendar.YEAR)

			def turmas = Turma.executeQuery(" select t from Turma as t " +
					"  where t.escola.id = ? and t.anoLetivo >= ? and t.serie.id = ? ", [idEscola, ano, idSerie])

			def result = ["id":turmas?.id, "turma":turmas?.turma]


			render (result as JSON)

		}

	}


	def listarMensagem(String msg, String tipo) {


		if((session["user"] == null) || (session["pass"] == null) ){
			//render (view:"/usuario/Login.gsp")
			redirect(uri: "/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "TURMA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm1 || perm2)
			{

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)
				
				
				def turmas
				def disciplinas
				def escolas

				if ((session["escid"] == 0))
				{

					 turmas = Horario.executeQuery(" select t from Turma as t " +
							"  where  t.anoLetivo >= ? ", [ano])

					 escolas = Escola.findAll()

					 disciplinas = DisciplinaLecionadaPorProfessor.executeQuery(" select dlpp from DisciplinaLecionadaPorProfessor dlpp ")

				}else{
				
				 turmas = Horario.executeQuery(" select t from Turma as t " +
						"  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])

				 escolas = Escola.get(Long.parseLong(session["escid"].toString()))

				 disciplinas = DisciplinaLecionadaPorProfessor.executeQuery(" select dlpp from DisciplinaLecionadaPorProfessor dlpp where "+
						"dlpp.professor.id in (select p.id from Pessoa p where escid = ?) ", [Integer.parseInt(session["escid"].toString())])
				}

				
				//render (view:"/turma/listarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, escolas:escolas])
				if (tipo == "ok") {
					render (view:"/turma/listarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, escolas:escolas, ok:msg, perm2:perm2])
				} else {
					render (view:"/turma/listarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, escolas:escolas, erro:msg, perm2:perm2])
				}
			}else{
				render(view:"/error403.gsp")


			}
		}
	}

	def verInfoTurma (long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "TURMA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm1 || perm2)
			{


				Turma turmas = Turma.get(id)
				def turmaDisc = TurmaDisciplina.findAllByTurma(turmas)
				def td = turmaDisc.disciplinaLecionadaPorProfessor.id

				def dlpp = DisciplinaLecionadaPorProfessor.findAll()

				def matriculados = Pessoa.executeQuery(" select p from Matricula m, Turma t, " +
						" Aluno a, Pessoa p " +
						" where t.id = m.turma.id " +
						"   and p.id = a.id " +
						"   and m.aluno.id = a.id " +
						"   and t.id = ? " +
						" order by p.nome " , [id])

				//println("Matriculados - - " + id + " " + matriculados)

				def disciplinas = DisciplinaLecionadaPorProfessor.findAll()
				render (view:"/turma/verInfoTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, td:td, dlpp:dlpp, matriculados:matriculados])

			}else{
				render(view:"/error403.gsp")


			}
		}
	}

	def editarTurma(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm2)
			{
				Turma turmas = Turma.get(id)
				def turmaDisc = TurmaDisciplina.findAllByTurma(turmas)
				def td = turmaDisc.disciplinaLecionadaPorProfessor.id

				def dlpp = DisciplinaLecionadaPorProfessor.findAll()

				def disciplinas = DisciplinaLecionadaPorProfessor.findAll()
				render (view:"/turma/editarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas, td:td, dlpp:dlpp])

			}else{
				render(view:"/error403.gsp")


			}
		}
	}

	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm2)
			{

				def turma = Turma.get(params.id)
				turma.turma = params.turma
				turma.vagas = Integer.parseInt(params.vagas)
				turma.turno= params.turno

				def serie = Serie.get(params.serie)
				turma.serie = serie


				def turmaDisc = TurmaDisciplina.findAllByTurma(turma)
				def td = turmaDisc.disciplinaLecionadaPorProfessor.id

				def disciplinaNovo = params.disciplina
				def erros
				def idDisc
				turma.save(flush:true)

				//inserir
				for (int i=0; i<disciplinaNovo.size(); i++){

					idDisc = disciplinaNovo[i]

					if (!td.contains(idDisc)) {
						TurmaDisciplina turmaDisciplina = new TurmaDisciplina()
						turmaDisciplina.turma = turma


						def dp =  DisciplinaLecionadaPorProfessor.get(idDisc)
						turmaDisciplina.disciplinaLecionadaPorProfessor = dp
						turmaDisciplina.dataInicio = new Date()
						turmaDisciplina.dataTermino = new Date()
						turmaDisciplina.identificacao = "Automatico - "+ turma.id + " - " + idDisc + " - " + i.toString()
						turmaDisciplina.save(flush:true)
					}
				}


				//deletar
				if (disciplinaNovo.getClass() != java.lang.String) {
					for (int i=0; i<td.size(); i++){

						def cont = 0
						for (int j = 0;j<disciplinaNovo.size(); j++) {
							if (td[i].toString() == disciplinaNovo[j].toString()){
								cont = cont+1
							}
							idDisc = td[i]
						}

						if (cont == 0){
							def dlpp = DisciplinaLecionadaPorProfessor.get(idDisc)
							def tm = TurmaDisciplina.findByTurmaAndDisciplinaLecionadaPorProfessor(turma, dlpp)
							tm.delete()

						}
					}
				}else {
					for (int i=0; i<td.size(); i++){
						def cont = 0
						if (td[i].toString() == disciplinaNovo){
							cont = cont+1
						}
						idDisc = td[i]

						if (cont == 0){
							def dlpp = DisciplinaLecionadaPorProfessor.get(idDisc)
							def tm = TurmaDisciplina.findByTurmaAndDisciplinaLecionadaPorProfessor(turma, dlpp)
							tm.delete()
						}
					}
				}



				if(turma.save(flush:true)){

					/*Calendar ca = Calendar.getInstance()
					 int ano = ca.get(Calendar.YEAR)
					 def turmas = Horario.executeQuery(" select t from Turma as t " +
					 "  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])*/

					//			render(view:"/turma/listarTurma.gsp", model:[
					//				turmas:turmas,
					//				ok : "Turma atualizada com sucesso!"
					//
					//			])
					
					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), "Atualizar Turma: " + params.id.toString(), "UPDATE", "Turma", date)

					listarMensagem("Turma atualizada com sucesso!", "ok")
				}else{

					Calendar ca = Calendar.getInstance()
					int ano = ca.get(Calendar.YEAR)

					def turmas = Horario.executeQuery(" select t from Turma as t " +
							"  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])

					turma.errors.each{render it}
					//			render(view:"/turma/editarTurma.gsp", model:[turmas:turmas,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar!","erro")
				}
			}

		}
	}

	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm2)
			{

				Turma.deleteAll(Turma.get(id))

				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "Deletar Turma: " + id.toString(), "DELETE", "Turma", date)

				
				//redirect(action:"listar" )
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
				//listarMensagem("Turma excluída com sucesso", "ok")
			}else{
				render(view:"/error403.gsp")
			}
		}
	}



	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "TURMA", "2")

			if (perm2) {

				Turma turma = new Turma(params)

				Calendar cal = Calendar.getInstance()
				int year = cal.get(Calendar.YEAR)
				turma.anoLetivo = year

				//println params


				def verifica = true
				TurmaDisciplina t

				def disciplinas = DisciplinaLecionadaPorProfessor.findAll()
				def erros


				if(turma.save(flush:true)){
					
					
					if (params.disciplinas.getClass() != java.lang.String) {


						for (i in 0..params.disciplinas.size()-1){


							t = new TurmaDisciplina()
							t.turma = turma

							DisciplinaLecionadaPorProfessor dlpp = DisciplinaLecionadaPorProfessor.get(Integer.parseInt(params.disciplinas[i]))

							t.disciplinaLecionadaPorProfessor = dlpp
							t.dataInicio = new Date()
							t.dataTermino = new Date()
							t.identificacao = "Automatico - "+ turma.id + " - " + params.disciplinas[i] + " - " + i.toString()

							if (!t.save(flush:true)) {
								erros = t.errors
								verifica = false
							}
						}



					}else{

						t = new TurmaDisciplina()
						t.turma = turma

						DisciplinaLecionadaPorProfessor dlpp = DisciplinaLecionadaPorProfessor.get(Integer.parseInt(params.disciplinas))

						t.disciplinaLecionadaPorProfessor = dlpp
						t.dataInicio = new Date()
						t.dataTermino = new Date()
						t.identificacao = "Automatico - "+ turma.id + " - " + params.disciplinas + " - 0"
						if (!t.save(flush:true)) {
							erros = t.errors
							verifica = false
						}

					}
					if (verifica) {
						Calendar ca = Calendar.getInstance()
						int ano = ca.get(Calendar.YEAR)

						def turmas = Horario.executeQuery(" select t from Turma as t " +
								"  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])


						//				render(view:"/turma/listarTurma.gsp", model:[
						//					turmas:turmas,disciplinas:disciplinas,
						//					ok : "Turma cadastrada com sucesso!"
						//
						//				])
						//				redirect(action:"listar" )
						
						def date = new Date()
						AdministracaoController adm = new AdministracaoController()
						adm.salvaLog(session["usid"].toString().toInteger(), "Criar Turma: " + turma.id.toString(), "CREATE", "Turma", date)
						
						listarMensagem("Turma cadastrada com sucesso!", "ok")

					}else{


						Calendar ca = Calendar.getInstance()
						int ano = ca.get(Calendar.YEAR)

						def turmas = Horario.executeQuery(" select t from Turma as t " +
								"  where t.escola.id = ? and t.anoLetivo >= ? ", [Long.parseLong(session["escid"].toString()), ano])


						turma.errors.each {println it}
						//				render(view:"/turma/listarTurma.gsp", model:[turmas:turmas, disciplinas:disciplinas,
						//					erro : erros
						//				])
						listarMensagem("erro ao Salvar", "erro")
					}



				}
				else{
					render turma.errors
				}
			}else{
				render(view:"/error403.gsp")
			}

		}
	}
}

