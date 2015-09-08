package br.gov.rn.saogoncalo.layout
import org.apache.tools.ant.types.Quantifier;

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Funcionario
import br.gov.rn.saogoncalo.pessoa.Professor
import grails.converters.JSON
import groovy.sql.Sql
import java.sql.Driver
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
			
			//if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
		//(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {
			
				def alunos = Aluno.executeQuery("select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?", [session["escid"]])
				def funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				def professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id and p.escid = ?",[session["escid"]])
				
				def quantAlunos 
				def quantEscolas
				def quantProfessores
				def quantFuncionarios
				def sessao = session["escid"]
				if(sessao == 0){
					//def alunos = Aluno.executeQuery("select a from Pessoa as p, Aluno as a where p.id = a.id")
					//def funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id")
					//def professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id ")
					 
					 quantAlunos = "indisponível"
					 quantEscolas = "indisponível"
					 quantProfessores = "indisponível"
					 quantFuncionarios = "indisponível"
				}else{
					 alunos = Aluno.executeQuery("select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?", [session["escid"]])
					 funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
					 professores = Professor.executeQuery(" select pr from Pessoa as p, Professor as pr where p.id = pr.id and p.escid = ?",[session["escid"]])
					 
					 quantAlunos = alunos.size();
					 quantEscolas = Escola.count();
					 quantProfessores = professores.size();
					 quantFuncionarios = funcionarios.size();
				}
				
				render(view:"/index.gsp", model:[quantAlunos:quantAlunos, quantEscolas:quantEscolas, quantProfessores:quantProfessores, quantFuncionarios:quantFuncionarios, sessao:sessao ])
			//}else{
			//	render(view:"/error403.gsp")
			//}
		}
		
	}
	def dadosDoGrafico(){
		def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
		def props = new Properties()
		props.setProperty("user", "admin_db_sr")
		props.setProperty("password", "bgt54rfvcde3")


		def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
		def sql = new Sql(conn)
	
		List<String> alunoByEscola = new ArrayList();
	
		//verificar com matriculas
		alunoByEscola = sql.rows("SELECT p.escid, (select nome from cadastro_unico_pessoal.pessoa as pi where pi.id = p.escid) as escola, count(*) as Alunos"+
			" FROM educacao_academico.matricula as m, educacao_academico.turma as t, cadastro_unico_pessoal.pessoa as p" + 
			" where m.aluno_id= p.id "+
			" and m.turma_id= t.id "+
			" and m.status ='Ativo'"+
			"group by p.escid");
		
		
		def result = []
		
		def i = 0
		
		
		println(alunoByEscola)
		
		for (aluno in alunoByEscola){
			def cor = gerarCor()
			result[i] = ["label":aluno.escola, "value":aluno.alunos, "color":cor, "highlight":cor]
			
			i++
		}
		
		
		
		render( result as JSON)
	}
	
	def gerarCor(){
		Random sort = new Random()
		int R = sort.nextInt(255)
		int G = sort.nextInt(255)
		int B = sort.nextInt(255)
		String hex = String.format("#%02x%02x%02x", R, G, B)
		
		return hex;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
