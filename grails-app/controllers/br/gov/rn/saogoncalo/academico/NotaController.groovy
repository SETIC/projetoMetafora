package br.gov.rn.saogoncalo.academico

import groovy.sql.Sql

import java.sql.Driver
import java.sql.SQLException
import java.text.SimpleDateFormat

import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor

class NotaController {


	def listar(){

		def notas = Nota.findAll()
		render (view:"/nota/listarNota.gsp", model:[notas:notas])
	}
	def notasTurma(){

		def p = Professor.get(Long.parseLong(session['pesid'].toString()))
		def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)
		def escola = Escola.get(session['escid'])

		def date = new Date()
		def formatAno = new SimpleDateFormat("yyyy")
		def anoAtual = formatAno.format(date);

		def turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
		def td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)


		render (view:"/nota/notasTurma.gsp", model:[turmaDisciplina:td])
	}

	
	def boletim(int id){

		def p = Professor.get(Long.parseLong(session['pesid'].toString()))
		def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(p)

		def escola = Escola.get(session['escid'])

		def date = new Date()
		def formatAno = new SimpleDateFormat("yyyy")
		def anoAtual = formatAno.format(date);

		def turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)

		def td = TurmaDisciplina.findAllByIdAndDisciplinaLecionadaPorProfessorInListAndTurmaInList(id, dlpp, turmas)

		def t = td[0].turma


		def notas
		def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver

		def props = new Properties()
		props.setProperty("user", "admin_db_sr")
		props.setProperty("password", "bgt54rfvcde3")


		def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
		def sql = new Sql(conn)


		try {
			notas = sql.rows(consultaMediaAritmetica())


			println("Notas  ---- " + notas)

			render (view:"/nota/listarNota.gsp", model:[notas:notas, turmaDisciplina:td])
		}catch(SQLException ex){
			println ex.getMessage()
		}
		finally {
			sql.close()
			conn.close()
		}
	}

	def consultaMediaAritmetica(){
		return " select n.matricula_id, p.nome,  "+
		 
		 "( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
		  "  where nn.atividade_id = aa.id "+
		   "   and aa.bimestre = '1º BIMESTRE'  "+
		    "  and nn.matricula_id = n.matricula_id ) as nota1, "+
		 " ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
		  "  where nn.atividade_id = aa.id  "+
		   "   and aa.bimestre = '2º BIMESTRE'  "+
		    "  and nn.matricula_id = n.matricula_id ) as nota2, "+
		" ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
		 "   where nn.atividade_id = aa.id "+
		  "    and aa.bimestre = '3º BIMESTRE' "+
		   "   and nn.matricula_id = n.matricula_id ) as nota3, "+
		" ( select sum(nn.pontuacao) from educacao_academico.atividade aa, educacao_academico.nota nn "+
		 "   where nn.atividade_id = aa.id "+
		  "    and aa.bimestre = '4º BIMESTRE'  "+
		   "   and nn.matricula_id = n.matricula_id ) as nota4, "+
		
	"	 (select nn.pontuacao from educacao_academico.atividade aa, educacao_academico.nota nn "+
	"	    where nn.atividade_id = aa.id  "+
	"	      and aa.bimestre = 'RECUPERACAO' "+
	"	      and aa.turma_disciplina_id = " + params.id  +
	"	      and nn.matricula_id = n.matricula_id ) as notaRecuperacao, "+
		      
	"	 (select nn.pontuacao from educacao_academico.atividade aa, educacao_academico.nota nn "+
	"	    where nn.atividade_id = aa.id  "+
	"	      and aa.bimestre = 'PROVA FINAL' "+
	"	      and aa.turma_disciplina_id = " + params.id  +
	"	      and nn.matricula_id = n.matricula_id ) as provaFinal "+
		
	"	 from educacao_academico.atividade a, educacao_academico.nota n, educacao_academico.matricula m, cadastro_unico_pessoal.pessoa p "+
	"	 where n.atividade_id = a.id " +
	"	  and a.turma_disciplina_id = " + params.id  +
	"	  and p.id = m.aluno_id "+
	"	  and n.matricula_id = m.id "+
	"	  group by n.matricula_id, p.nome "
	}
}
