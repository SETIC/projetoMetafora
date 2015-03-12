package br.gov.rn.saogoncalo.academico

import java.text.SimpleDateFormat

import javax.swing.text.View;

import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Professor

class AtividadeController {

	def listar() {
		def atividade = Atividade.findAll()

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
		println("Turma Disciplina --- " + td)
		render (view:"/atividade/listarAtividade.gsp", model:[turmaDisciplina:td, dataAtual:dataAtual,atividade:atividade])
	}

	def listarMensagem (String msg , String tipo){

		def atividade = Atividade.findAll()
		//render (view:"/disciplina/listarDisciplina.gsp", model:[disciplinas:disciplinas])
		if (tipo == "ok")

			render (view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, ok:msg])

		else
			render (view:"/atividade/listarAtividade.gsp", model:[atividade:atividade, erro:msg])
	}


	def salvar(){

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

	def lancarNota() {
		render (view:"/atividade/lancarNota.gsp")
	}
	
	
	def verInfoAtividade (long id){

		Atividade atividade = Atividade.get(id)

		render (view:"/atividade/verInfoAtividade.gsp", model:[atividade:atividade])
	}



	def deletar(int id){

		Atividade.deleteAll(Atividade.get(id))

		//redirect(action:"listar" )
		redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])


	}
}
