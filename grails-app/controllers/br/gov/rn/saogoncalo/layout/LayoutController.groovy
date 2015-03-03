package br.gov.rn.saogoncalo.layout
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Funcionario
import br.gov.rn.saogoncalo.pessoa.Professor
class LayoutController {

	def index() {
	
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Layout", act:"index"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			
//			if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
//			(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {

				Integer quantAlunos = Aluno.count();
				Integer quantEscolas = Escola.count();
				Integer quantProfessores = Professor.count();
				Integer quantFuncionarios = Funcionario.count();
				render(view:"/index.gsp", model:[quantAlunos:quantAlunos, quantEscolas:quantEscolas, quantProfessores:quantProfessores, quantFuncionarios:quantFuncionarios])
//			}else{
//				render(view:"/error403.gsp")
//			}
		}
	}
}
