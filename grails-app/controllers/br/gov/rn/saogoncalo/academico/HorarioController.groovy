package br.gov.rn.saogoncalo.academico

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController

class HorarioController {

	def index() {
	}

	def listar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "HORARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm1 || perm2) {

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def horarios
				def escolas
				
				if (session["escid"] == 0)
				{
					
					horarios = Horario.executeQuery(" select h from Horario as h, " +
						"     Sala as s " +
						"  where s.id = h.sala.id " +
						"    and h.turmaDisciplina.turma.anoLetivo = ?", [ano])

					escolas = Escola.findAll()
					
				}else{
								
					horarios = Horario.executeQuery(" select h from Horario as h, " +
						"     Sala as s " +
						"  where s.id = h.sala.id " +
						"   and s.escola.id = ? and h.turmaDisciplina.turma.anoLetivo = ?", [Long.parseLong(session["escid"].toString()), ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))
				
				}

				def professores = Professor.findAll()
				def series = Serie.findAll()
				render (view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series, escolas:escolas, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def listarMensagem(String msg , String tipo){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "HORARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm1 || perm2) {

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def horarios
				def escolas
				
				if (session["escid"] == 0)
				{
					
					horarios = Horario.executeQuery(" select h from Horario as h, " +
						"     Sala as s " +
						"  where s.id = h.sala.id " +
						"    and h.turmaDisciplina.turma.anoLetivo = ?", [ano])

					escolas = Escola.findAll()
					
				}else{
								
					horarios = Horario.executeQuery(" select h from Horario as h, " +
						"     Sala as s " +
						"  where s.id = h.sala.id " +
						"   and s.escola.id = ? and h.turmaDisciplina.turma.anoLetivo = ?", [Long.parseLong(session["escid"].toString()), ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))
				
				}

				def professores = Professor.findAll()
				def series = Serie.findAll()
				//render (view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series, escolas:escolas])
				if (tipo == "ok")

					render (view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series, escolas:escolas, ok:msg, perm2:perm2])
				else
					render (view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series, escolas:escolas, erro:msg, perm2:perm2])
			}
			else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm2) {
				Horario.deleteAll(Horario.get(id))
				
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "Deletar Horario: " + id.toString(), "DELETE", "Horario", date)
				
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
				//redirect(action:"listar" )
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm2) {
				Horario horarioL = new Horario()

				def sala  = Sala.get(params.sala)
				def horario = params.descHorario

				def tm = TurmaDisciplina.get(params.comboProfessorDisciplina)

				def horaDeAula1 = params.horaDeAula
				print("hora de aula ->>>>>> "+horaDeAula1)
				horarioL.sala = sala
				horarioL.turmaDisciplina = tm
				horarioL.horario = horario
				horarioL.horaAula = horaDeAula1

				if (horarioL.save(flush:true)){
					//			def horarios = Horario.findAll()
					//			render(view:"/horario/listarHorario.gsp", model:[horarios:horarios,
					//				ok : "Horário cadastrado com sucesso!"
					//			])
					
					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), "Criar Horario: " + horarioL.id.toString(), "CREATE", "Horario", date)
					
					listarMensagem("Horário cadastrado com sucesso!", "ok")
				}
				else{
					def erros  
					horarioL.errors.each { erros = it}
					print("erros "+erros)
					def horarios = Horario.findAll()
					def professores = Professor.findAll()
					//			def series = Serie.findAll()
					//			render(view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series,
					//				erro:erros])
					listarMensagem("Erro ao cadastrar!", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def editarHorario(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm2) {
				Horario horarioL = Horario.get(id)
				def escola = Escola.findAll()
				def series = Serie.findAll()
				def turma = Turma.findAllByEscolaAndSerie(horarioL.turmaDisciplina.turma.escola, horarioL.turmaDisciplina.turma.serie)
				def turmaDisciplina = TurmaDisciplina.findAllByTurma(horarioL.turmaDisciplina.turma)

				def dia = horarioL.horario[0]
				def turno = horarioL.horario[1]
				def horario = horarioL.horario[2..horarioL.horario.size()-1]

				render (view:"/horario/editarHorario.gsp", model:[horarioL:horarioL, escola:escola, series:series, turma:turma,
					turmaDisciplina:turmaDisciplina, dia:dia, turno:turno, horario:horario])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "HORARIO", "2")

			if (perm2) {

				Horario horarioL = Horario.get(params.id)

				def sala  = Sala.get(params.sala)
				def horario = params.descHorario

				def tm = TurmaDisciplina.get(params.comboProfessorDisciplina)

				horarioL.sala = sala
				horarioL.turmaDisciplina = tm
				horarioL.horario = horario

				if (horarioL.save(flush:true)){
					//			def horarios = Horario.findAll()
					//			render(view:"/horario/listarHorario.gsp", model:[horarios:horarios,
					//				ok : "Horário atualizado com sucesso!"
					//			])
					
					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), "Atualizar Horario: " + horarioL.id.toString(), "UPDATE", "Horario", date)
					
					listarMensagem("Horário atualizado com sucesso!", "ok")
				}
				else{
					def erros = horarioL.errors
					def horarios = Horario.findAll()
					def professores = Professor.findAll()
					//			def series = Serie.findAll()
					//			render(view:"/horario/listarHorario.gsp", model:[horarios:horarios, professores:professores, series:series,
					//				erro:erros])
					listarMensagem("Erro ao cadastrar!", "erro")
				}
			}
		}
	}
}

