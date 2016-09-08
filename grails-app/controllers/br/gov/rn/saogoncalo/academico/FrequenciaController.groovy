package br.gov.rn.saogoncalo.academico

import groovy.sql.Sql

import java.sql.Driver
import java.text.SimpleDateFormat

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor

class FrequenciaController {

	def frequencia(){


		def p
		def dlpp
		def escola
		def date
		def formatAno
		def anoAtual
		def turmas
		def td


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Atividade", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "FREQUENCIA", "2")


			if (perm2) {



				if ((session["escid"] == 0) ) {

					p = Professor.executeQuery(" select pr from Atividade a, TurmaDisciplina td, " +
							" DisciplinaLecionadaPorProfessor dlpp, " +
							" Professor pr " +
							" where td.id = a.turmaDisciplina.id " +
							" and dlpp.id = td.disciplinaLecionadaPorProfessor.id " +
							" and pr.id = dlpp.professor.id " )

					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessorInList(p)
					escola = Escola.findAll()

					date = new Date()
					formatAno = new SimpleDateFormat("yyyy")
					//anoAtual = formatAno.format(date)
					anoAtual = "2015"

					turmas = Turma.findAllByAnoLetivoAndEscolaInList(anoAtual.toInteger(), escola)
					td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
				}else{

					p = Professor.get(Long.parseLong(session['pesid'].toString()))
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
					escola = Escola.get(session['escid'])

					date = new Date()
					formatAno = new SimpleDateFormat("yyyy")
					//anoAtual = formatAno.format(date)
					anoAtual = "2015"

					//turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
					//td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
					
					Calendar ca = Calendar.getInstance()
					int ano = ca.get(Calendar.YEAR)
					
					//---conexao---
					
										def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
										def props = new Properties()
										props.setProperty("user", "admin_db_sr")
										props.setProperty("password", "bgt54rfvcde3")
					
										def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)
					
										def sql = new Sql(conn)
										def sqlString = " select distinct td.id, t.id turmaId, t.turma, t.turno, t.vagas, s.serie, d.disciplina, " +
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

				//render (view:"/nota/notasTurma.gsp", model:[turmaDisciplina:td)
				render (view:"/aula/frequencia.gsp", model:[turmaDisciplina:td])
			}
		}
	}
}
