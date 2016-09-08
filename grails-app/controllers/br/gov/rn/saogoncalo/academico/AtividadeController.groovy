package br.gov.rn.saogoncalo.academico

import groovy.sql.Sql

import java.sql.Driver
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

				def p
				def dlpp
				def escola
				def date
				def formatData
				def formatAno
				def dataAtual
				def anoAtual
				def turmas
				def td
				def atividade

				if (session["escid"] == 0 ) {

					//existe uma escola valida escid
					p = Professor.findAll()
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessorInList(p)
					escola = Escola.findAll()
					date = new Date()
					formatData = new SimpleDateFormat("yyyy-MM-dd")
					formatAno = new SimpleDateFormat("yyyy")
					dataAtual = formatData.format(date)
					//anoAtual = formatAno.format(date);
					anoAtual = "2015"
					turmas = Turma.findAllByAnoLetivoAndEscolaInList(anoAtual.toInteger(), escola)
					td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
					atividade = Atividade.findAllByTurmaDisciplinaInList(td)

					println(" teste --- Aqui")


				}else{


					p = Professor.get(Long.parseLong(session['pesid'].toString()))
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
					escola = Escola.get(session['escid'])
					date = new Date()
					formatData = new SimpleDateFormat("yyyy-MM-dd")
					formatAno = new SimpleDateFormat("yyyy")
					dataAtual = formatData.format(date)
					//anoAtual = formatAno.format(date);
					anoAtual = "2015"
					turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
					//td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
					//atividade = Atividade.findAllByTurmaDisciplinaInList(td)

					Calendar ca = Calendar.getInstance()
					int ano = ca.get(Calendar.YEAR)
					
					//---conexao---

					def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
					def props = new Properties()
					props.setProperty("user", "admin_db_sr")
					props.setProperty("password", "bgt54rfvcde3")

					def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)

					def sql = new Sql(conn)
					def sqlString = " select distinct t.id, t.turma, t.turno, t.vagas, s.serie, " +
							" (select e.nome from cadastro_unico_pessoal.pessoa e where e.id = t.escola_id) escola " +
							" from educacao_academico.turma t, " +
							" educacao_academico.turma_disciplina td, " +
							" educacao_academico.disciplina d, " +
							" educacao_academico.disciplina_lecionada_por_professor dlpp, " +
							" cadastro_unico_pessoal.pessoa p, " +
							" cadastro_unico_pessoal.pessoa_escola pe, " +
							" educacao_academico.serie s " +
							" where t.id = td.turma_id " +
							" and d.id = dlpp.disciplina_id " +
							" and td.disciplina_lecionada_por_professor_id = dlpp.id " +
							" and p.id = dlpp.professor_id " +
							" and pe.pessoa_id = p.id " +
							" and s.id = t.serie_id " +
							" and t.ano_letivo = " + ano.toString() + 
							" and p.id = " + session["pesid"] 
													
					td = sql.rows(sqlString)
					sql.close()
					conn.close()

					//---conexao---


				}

				//render (view:"/atividade/listarAtividade.gsp", model:[turmaDisciplina:td, dataAtual:dataAtual,atividade:atividade, escola:escola, professor:p])
				render (view:"/atividade/listarAtividade.gsp", model:[turmaDisciplina:td, dataAtual:dataAtual, escola:escola, professor:p])
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



				def p
				def dlpp
				def escola
				def date
				def formatData
				def formatAno
				def dataAtual
				def anoAtual
				def turmas
				def td
				def atividade


				if (session["escid"] == 0 ) {

					//existe uma escola valida escid
					p = Professor.findAll()
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessorInList(p)
					escola = Escola.findAll()
					date = new Date()
					formatData = new SimpleDateFormat("yyyy-MM-dd")
					formatAno = new SimpleDateFormat("yyyy")
					dataAtual = formatData.format(date)
					anoAtual = formatAno.format(date);
					turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
					td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
					atividade = Atividade.findAllByTurmaDisciplinaInList(td)

					println(" teste --- Aqui")


				}else{

					p = Professor.get(Long.parseLong(session['pesid'].toString()))
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
					escola = Escola.get(session['escid'])
					date = new Date()
					formatData = new SimpleDateFormat("yyyy-MM-dd")
					formatAno = new SimpleDateFormat("yyyy")
					dataAtual = formatData.format(date)
					anoAtual = formatAno.format(date);
					turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
					//td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
					//atividade = Atividade.findAllByTurmaDisciplinaInList(td)
					
					Calendar ca = Calendar.getInstance()
					int ano = ca.get(Calendar.YEAR)
					
					//---conexao---

					def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
					def props = new Properties()
					props.setProperty("user", "admin_db_sr")
					props.setProperty("password", "bgt54rfvcde3")

					def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)

					def sql = new Sql(conn)
					def sqlString = " select distinct t.id, t.turma, t.turno, t.vagas, s.serie, " +
							" (select e.nome from cadastro_unico_pessoal.pessoa e where e.id = t.escola_id) escola " +
							" from educacao_academico.turma t, " +
							" educacao_academico.turma_disciplina td, " +
							" educacao_academico.disciplina d, " +
							" educacao_academico.disciplina_lecionada_por_professor dlpp, " +
							" cadastro_unico_pessoal.pessoa p, " +
							" cadastro_unico_pessoal.pessoa_escola pe, " +
							" educacao_academico.serie s " +
							" where t.id = td.turma_id " +
							" and d.id = dlpp.disciplina_id " +
							" and td.disciplina_lecionada_por_professor_id = dlpp.id " +
							" and p.id = dlpp.professor_id " +
							" and pe.pessoa_id = p.id " +
							" and s.id = t.serie_id " +
							" and t.ano_letivo = " + ano.toString() +
							" and p.id = " + session["pesid"]
													
					td = sql.rows(sqlString)
					sql.close()
					conn.close()

					//---conexao---
				}

				if (tipo == "ok")

					render(view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, ok:msg, turmaDisciplina:td, dataAtual:dataAtual, escola:escola, professor:p])

				else
					render(view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, erro:msg, turmaDisciplina:td, dataAtual:dataAtual, escola:escola, professor:p])
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
				//println("params aqui " + params)
				
				if (novaAtividade.save(flush:true)) {
					listarMensagem("Atividade cadastrada com sucesso", "ok")
				}else{
					novaAtividade.errors.each { println it }
					listarMensagem("Erro ao cadastrar atividade", "erro")
				}


			}
		}
	}


	def lancarNota(long id) {

		def atividade = Atividade.get(id)
		println("Atividade -- " + atividade)


		//if (atividade.turmaDisciplina.disciplinaLecionadaPorProfessor.professor.id == Long.parseLong(session['pesid'].toString())){

			def alunos = atividade.turmaDisciplina.turma.matricula

			println "MATRICULASSS ----  " + alunos
			def notas = Nota.findAllByAtividade(atividade)

			println("NOTAS EXISTENTES --- " + notas)


			render (view:"/atividade/lancarNota.gsp", model:[alunos:alunos, atividade:atividade, notas:notas])
		//}
	}

	def salvarNota(){

		println "PARAMS SIZE() "+params.size()
		println(" Params aqui ---" + params)

		for(int i = 0; i < params.size() -3; i++){

			def idMat
			if (params.keySet()[i].toString() != "atividadeId") {
				idMat = Integer.parseInt(params.keySet()[i].toString().replaceAll("mat-", ""))
				//def idMatricula = Long.parseLong(params.atividadeId)
				println(" IdMatricula --- " + idMat)

			}

			def matricula = Matricula.get(idMat)

			def idAtividade = Long.parseLong(params.atividadeId)
			def atividade = Atividade.get(idAtividade)

			def attNota = Nota.findByAtividadeAndMatricula(atividade, matricula)

			def nota = Float.parseFloat(params.get(params.keySet()[i])[0])

			def descricao = params.get(params.keySet()[i])[1]

			//println "tamanho de att nota ---- " (attNota.size().toString())

			Nota finNota = null

			if (attNota == null){

				def newNota = new Nota()
				newNota.pontuacao = nota
				newNota.observacao = descricao
				newNota.matricula = matricula
				newNota.atividade = atividade

				finNota = newNota

			}else{

				attNota.pontuacao = nota
				attNota.observacao = descricao

				finNota = attNota
			}


			if (finNota.save(flush:true)){

				listarMensagem ("Notas da atividade atualizada com sucesso!" , "ok")
			}else{

				listarMensagem ("Erro ao atualizar nota!" , "erro")	}


		}


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

	def listarAtividadeSerie(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "ATIVIDADE", "2")

			if (perm2) {

				Turma turma = Turma.get(id)

				if(turma.serie.serie == '1 serie'){


					/*Atividade atividade = new Atividade()
					 atividade.descricaoAtividade =  params.descricaoAtividade
					 atividade.bimestre =  params.bimestre
					 */					


				}else{

					//def turmaDisciplina = TurmaDisciplina.findAllByTurma(turma)


					//---conexao---

					def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
					def props = new Properties()
					props.setProperty("user", "admin_db_sr")
					props.setProperty("password", "bgt54rfvcde3")

					def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)

					def sql = new Sql(conn)
					def sqlString = " select td.id, t.turma, d.disciplina, s.serie from educacao_academico.turma_disciplina td, "+
							" educacao_academico.disciplina_lecionada_por_professor dlpp, "+
							" educacao_academico.disciplina d, cadastro_unico_pessoal.pessoa p, "+
							" educacao_academico.turma t, educacao_academico.serie s "+
							" where dlpp.id = td.disciplina_lecionada_por_professor_id "+
							" and d.id = dlpp.disciplina_id "+
							" and p.id = dlpp.professor_id "+
							" and t.id = td.turma_id "+
							" and s.id = t.serie_id "+
							" and p.id = " + session["pesid"] +
							" and td.turma_id = " + id.toString() 


					def turmaDisciplina = sql.rows(sqlString)
					sql.close()
					conn.close()

					//---conexao---


					def listarAtividadeSerie = Atividade.executeQuery("select a from Atividade a , TurmaDisciplina td, Turma t "+
							" where a.turmaDisciplina.id = td.id"+
							" and t.id = td.turma.id" +
							" and t.id = "+id.toString())

					render (view:"/atividade/listarAtividadeSerie.gsp", model:[turmaDisciplina:turmaDisciplina, listarAtividadeSerie:listarAtividadeSerie])

				}

			}
		}
	}
}





