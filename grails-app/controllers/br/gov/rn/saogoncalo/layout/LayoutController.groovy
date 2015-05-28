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

			// Define cURL process with correct arguments.
			//def proc = "http://cep.correiocontrol.com.br/59106130.json"
			//		   .execute()
			// cURL uses error output stream for progress output.
			//Thread.start { System.err << proc.err }
			// Wait until cURL process finished and continue with the loop.
			//proc.waitFor()

			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			
//			if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
//			(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {
			
				def alunos = Aluno.executeQuery("select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?", [session["escid"]])
				def funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				def professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id and p.escid = ?",[session["escid"]])
				
				Integer quantAlunos = alunos.size();
				Integer quantEscolas = Escola.count();
				Integer quantProfessores = professores.size();
				Integer quantFuncionarios = funcionarios.size();
				render(view:"/index.gsp", model:[quantAlunos:quantAlunos, quantEscolas:quantEscolas, quantProfessores:quantProfessores, quantFuncionarios:quantFuncionarios])
//			}else{
//				render(view:"/error403.gsp")
//			}
		}
	}
}
