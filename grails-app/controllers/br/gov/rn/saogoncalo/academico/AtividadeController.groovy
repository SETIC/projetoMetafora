package br.gov.rn.saogoncalo.academico

import java.text.SimpleDateFormat

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor

class AtividadeController {

	def listar() {

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "ATIVIDADE", "1")
			def perm2 = usuario.getPermissoes(user, pass,  "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm1 || perm2) {


				def p = Professor.get(Long.parseLong(session['pesid'].toString()))
				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
				def escola = Escola.get(session['escid'])
				def date = new Date()
				def formatData = new SimpleDateFormat("yyyy-MM-dd")
				def formatAno = new SimpleDateFormat("yyyy")
				def dataAtual = formatData.format(date)
				def anoAtual = formatAno.format(date);
				def turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
				def td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)

				def atividade = Atividade.findAllByTurmaDisciplina(td)


				render (view:"/atividade/listarAtividade.gsp", model:[turmaDisciplina:td, dataAtual:dataAtual,atividade:atividade])
			}
		}
	}



	def listarMensagem (String msg , String tipo){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "ATIVIDADE", "1")
			def perm2 = usuario.getPermissoes(user, pass,  "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm1 || perm2) {

				def p = Professor.get(Long.parseLong(session['pesid'].toString()))
				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
				def escola = Escola.get(session['escid'])
				def date = new Date()
				def formatData = new SimpleDateFormat("yyyy-MM-dd")
				def formatAno = new SimpleDateFormat("yyyy")
				def dataAtual = formatData.format(date)
				def anoAtual = formatAno.format(date);
				def turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
				def td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)

				def atividade = Atividade.findAllByTurmaDisciplina(td)

				if (tipo == "ok")

					render (view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, ok:msg])

				else
					render (view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, erro:msg])
			}
		}
	}

	def salvar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm2) {


				def novaAtividade = new Atividade(params)

				if (novaAtividade.save(flush:true)) {
					listarMensagem("Atividade cadastrada com sucesso", "ok")
				}else{
					novaAtividade.errors.each { println it }
					listarMensagem("Erro ao cadastrar atividade", "erro")
				}

				//listarMensagem("Atividade cadastrada com sucesso", "ok")
				//render(view:"Atividade/listarAtividade.gsp")
			}
		}
	}


	def lancarNota() {
		render (view:"/atividade/lancarNota.gsp")
	}



	def verInfoAtividade (long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "ATIVIDADE", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm1 || perm2) {

				Atividade atividade = Atividade.get(id)

				render (view:"/atividade/verInfoAtividade.gsp", model:[atividade:atividade])
			}
		}
	}



	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm2) {

				Atividade.deleteAll(Atividade.get(id))

				//redirect(action:"listar" )
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}
		}
	}

	def editarAtividade(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm2) {

				def p = Professor.get(Long.parseLong(session['pesid'].toString()))
				def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
				def escola = Escola.get(session['escid'])
				def date = new Date()
				def formatData = new SimpleDateFormat("yyyy-MM-dd")
				def formatAno = new SimpleDateFormat("yyyy")
				def dataAtual = formatData.format(date)
				def anoAtual = formatAno.format(date);
				def turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
				def td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)

				Atividade atividade = Atividade.get(id)

				render (view:"/atividade/editarAtividade.gsp", model:[atividade:atividade,turmaDisciplina:td])
			}
		}
	}

	def atualizar(){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")


			if (perm2) {


				print("veja aqui o params "+params)
				def atividade = Atividade.get(params.id)
				atividade.nomeAtividade= params.nomeAtividade
				atividade.tipoAtividade= params.tipoAtividade
				atividade.dataInicio = params.dataInicio
				atividade.dataFim = params.dataFim
				atividade.pesoAtividade =Integer.parseInt(params.pesoAtividade)
				atividade.turmaDisciplina = TurmaDisciplina.get(Long.parseLong(params.turmaDisciplina))
				atividade.notaMaxima = Float.parseFloat(params.notaMaxima)
				atividade.bimestre = params.bimestre
				atividade.descricaoAtividade = params.descricaoAtividade


				if(atividade.save(flush:true)){

					listarMensagem("Atividade atualizada com sucesso!", "ok")
				}else{

					listarMensagem("Erro ao atualizar!", "erro")
				}
			}
		}
	}
}
