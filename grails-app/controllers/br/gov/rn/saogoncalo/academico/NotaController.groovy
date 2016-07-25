package br.gov.rn.saogoncalo.academico


import groovy.sql.Sql

import java.sql.Driver
import java.sql.SQLException
import java.text.SimpleDateFormat

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor

class NotaController {


	def listar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Sala", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "NOTA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "NOTA", "2")

			if (perm1 || perm2) {
				
				

				def notas = Nota.findAll()
				render (view:"/nota/listarNota.gsp", model:[notas:notas])
			}
		}
	}

	def notasTurma(){

		def p
		def dlpp
		def escola
		def date
		def formatAno
		def anoAtual
		def turmas
		def td


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
			anoAtual = formatAno.format(date)

			turmas = Turma.findAllByAnoLetivoAndEscolaInList(anoAtual.toInteger(), escola)
			td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
		}else{

			p = Professor.get(Long.parseLong(session['pesid'].toString()))
			dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
			escola = Escola.get(session['escid'])

			date = new Date()
			formatAno = new SimpleDateFormat("yyyy")
			anoAtual = formatAno.format(date)

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
		render (view:"/nota/notasTurma.gsp", model:[turmaDisciplina:td])
	}


	def boletim(int id){

		def p
		def dlpp
		def escola
		def date
		def formatAno
		def anoAtual
		def turmas
		def td
		def dadosAtividade

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
			anoAtual = formatAno.format(date)

			turmas = Turma.findAllByAnoLetivoAndEscolaInList(anoAtual.toInteger(), escola)
			td = TurmaDisciplina.findAllByIdAndDisciplinaLecionadaPorProfessorInListAndTurmaInList(params.turmadisciplina, dlpp, turmas)
		}else{

			p = Professor.get(Long.parseLong(session['pesid'].toString()))
			dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)

			escola = Escola.get(session['escid'])

			date = new Date()
			formatAno = new SimpleDateFormat("yyyy")
			anoAtual = formatAno.format(date)

			turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
			//td = TurmaDisciplina.findAllByIdAndDisciplinaLecionadaPorProfessorInListAndTurmaInList(params.turmadisciplina, dlpp, turmas)
		}


		
		Calendar ca = Calendar.getInstance()
		int ano = ca.get(Calendar.YEAR)

		def notas
		def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver

		def props = new Properties()
		props.setProperty("user", "admin_db_sr")
		props.setProperty("password", "bgt54rfvcde3")


		def conn = driver.connect("jdbc:postgresql://192.168.1.252:5667/db_sgg_testes", props)
		def sql = new Sql(conn)


		try {
			
			def sqlString = " select distinct td.id, t.id turmaId, t.turma, t.turno, t.vagas, s.serie, d.disciplina, "+
							" (select e.nome from cadastro_unico_pessoal.pessoa e where e.id = t.escola_id) escola "+
							" from educacao_academico.turma t, "+
							" educacao_academico.turma_disciplina td, "+ 
							" educacao_academico.disciplina d, "+
							" educacao_academico.disciplina_lecionada_por_professor dlpp, "+ 
							" cadastro_unico_pessoal.pessoa p, "+
							" cadastro_unico_pessoal.pessoa_escola pe, "+ 
							" educacao_academico.serie s "+
							" where t.id = td.turma_id "+
							" and d.id = dlpp.disciplina_id "+ 
							" and td.disciplina_lecionada_por_professor_id = dlpp.id "+ 
							" and p.id = dlpp.professor_id "+
							" and pe.pessoa_id = p.id "+
							" and s.id = t.serie_id "+
							" and t.ano_letivo = " + ano.toString() +  
							" and p.id = " + session["pesid"]
									
			td = sql.rows(sqlString)
			
			
			dadosAtividade = TurmaDisciplina.get(params.turmadisciplina)
			println("id aqui -- " + dadosAtividade)
			
			notas = sql.rows(consultaMediaAritmetica())
						
			

			render (view:"/nota/listarNota.gsp", model:[notas:notas, turmaDisciplina:td, dadosAtividade:dadosAtividade])
		}catch(SQLException ex){
			println ex.getMessage()
		}
		finally {
			sql.close()
			conn.close()
		}
	}





	def consultaMediaAritmetica(){

		return 	" select m.id, p.nome, "+
				"		( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id "+
				"		      and aa.bimestre = '1º BIMESTRE' "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as nota1, "+

				"		  ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id  "+
				"		      and aa.bimestre = '2º BIMESTRE'  "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as nota2, "+

				"		 ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id "+
				"		      and aa.bimestre = '3º BIMESTRE' "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as nota3, "+

				"		 ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id "+
				"		      and aa.bimestre = '4º BIMESTRE' "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as nota4, "+

				"		 (select nn.pontuacao from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id  "+
				"		      and aa.bimestre = 'RECUPERACAO' "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as notaRecuperacao, "+

				"		 (select nn.pontuacao from educacao_academico.atividade aa, educacao_academico.nota nn "+
				"		    where nn.atividade_id = aa.id "+
				"		      and aa.bimestre = 'PROVA FINAL' "+
				"		      and aa.turma_disciplina_id = " + params.turmadisciplina +
				"		      and nn.matricula_id = m.id ) as provaFinal "+

				" from educacao_academico.matricula m "+
				"  left join educacao_academico.nota n on n.matricula_id = m.id "+
				"  left join educacao_academico.atividade a on n.atividade_id = a.id "+
				" inner join cadastro_unico_pessoal.pessoa p on p.id = m.aluno_id "+
				"  left join educacao_academico.turma_disciplina td on a.turma_disciplina_id = td.id "+

				" where m.turma_id = " + params.turma +
				" group by m.id, p.nome "
	}
}
