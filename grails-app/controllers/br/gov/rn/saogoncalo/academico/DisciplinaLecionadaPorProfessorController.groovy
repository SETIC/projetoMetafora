package br.gov.rn.saogoncalo.academico
import grails.converters.JSON
import br.gov.rn.saogoncalo.login.UsuarioController

class DisciplinaLecionadaPorProfessorController {

	def index() {
	}

	//	def listar (){
	//
	//		if((session["user"] == null) || (session["pass"] == null) ){
	//			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
	//		}else{
	//			def user = session["user"]
	//			def pass = session["pass"]
	//
	//			def usuario = new UsuarioController()
	//
	//			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "1")
	//			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")
	//
	//			if (perm1 || perm2) {
	//
	//				def disciplinaLecionadaPorProfessor = DisciplinaLecionadaPorProfessor.findAll()
	//				render (view:"/disciplinaPorProfessor/listarDisciplinaPorProfessor.gsp", model:[disciplinaLecionadaPorProfessor:disciplinaLecionadaPorProfessor])
	//			}else{
	//				render(view:"/error403.gsp")
	//			}
	//		}
	//	}

	def getProfessorDisciplinaByTurma(long idTurma) {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Professor", act:"listar"])
		}else{


			def turma = Turma.get(idTurma)
			def turmaDisciplina = TurmaDisciplina.findAllByTurma(turma)

			def result = ["id":turmaDisciplina?.id,
				"professor":turmaDisciplina?.disciplinaLecionadaPorProfessor.professor.funcionario.cidadao.pessoaFisica.pessoa.nome,
				"disciplina":turmaDisciplina?.disciplinaLecionadaPorProfessor.disciplina.disciplina
			]

			render result as JSON
		}
	}
}