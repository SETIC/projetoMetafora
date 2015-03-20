package br.gov.rn.saogoncalo.academico

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
		
		def matriculas = Matricula.findAllByTurma(t)
		
		
		
		
		render (view:"/nota/listarNota.gsp", model:[turmaDisciplina:td, alunos:matriculas])
	}
	    
}
