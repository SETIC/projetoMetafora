package br.gov.rn.saogoncalo.academico

import java.text.SimpleDateFormat

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
		
					turmas = Turma.findAllByAnoLetivoAndEscola(anoAtual.toInteger(), escola)
					td = TurmaDisciplina.findAllByDisciplinaLecionadaPorProfessorInListAndTurmaInList(dlpp, turmas)
				}
		
				//render (view:"/nota/notasTurma.gsp", model:[turmaDisciplina:td)
				render (view:"/professor/frequencia.gsp", model:[turmaDisciplina:td])
			}
	
}
