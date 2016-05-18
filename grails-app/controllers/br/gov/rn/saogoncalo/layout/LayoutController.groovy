package br.gov.rn.saogoncalo.layout
import org.apache.tools.ant.types.Quantifier;

import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Pessoa
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

			def quantAlunos
			def quantEscolas
			def quantProfessores
			def quantFuncionarios
			
			def sessao = session["escid"]
			if(sessao == 0 ||sessao == 29){
			

				quantAlunos = Aluno.count()
				quantEscolas = Escola.count()
				quantProfessores = Professor.count()
				quantFuncionarios = Funcionario.count()
				
				
			}else{
			
				def pessoaIdList = Pessoa.findAllByEscid(session["escid"]).id

				quantAlunos = Aluno.countByIdInList(pessoaIdList)
				quantProfessores =  Professor.countByIdInList(pessoaIdList)
				quantFuncionarios =  Funcionario.countByIdInList(pessoaIdList)
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
		//dadosDoGrafico2();
		List<String> alunoByEscola = new ArrayList();


		//verificar com matriculas

		alunoByEscola = sql.rows("select count(pe.id) total, pe.escid, (select ps.nome from cadastro_unico_pessoal.pessoa as ps " +
		    " where ps.id = pe.escid) as escola,(select count(pp.id) from cadastro_unico_pessoal.pessoa as pp, cadastro_unico_pessoal.aluno as a, " +
			" educacao_academico.matricula as m where a.id = pp.id " +
		            " and m.aluno_id = a.id " +
		            " and m.status = 'Ativo' " +
		            " and pp.escid = pe.escid ) as totalAluno, " +
		        " (select count(pp.id) from cadastro_unico_pessoal.pessoa as pp, cadastro_unico_pessoal.professor as pr " +
		          " where pr.id = pp.id " +
		            " and pp.escid = pe.escid ) as totalProfessor, " +
		        " (select count(pp.id) from cadastro_unico_pessoal.pessoa as pp, cadastro_unico_pessoal.funcionario as f " +
		          " where f.id = pp.id " +
			            " and pp.escid = pe.escid ) as totalFuncionario " +
			 " from cadastro_unico_pessoal.pessoa as pe " +
			 " where pe.escid <> 0 " +
			 " group by pe.escid " +
			 " order by escid");


		def result = []

		def i = 0

		def resultAluno = []
		def resultProfessor = []
		def resultFuncionario = []

		result = [];
       
		for (aluno in alunoByEscola){
			def cor = gerarCor()
			resultAluno[i] = ["label":aluno.escola, "value":aluno.totalaluno, "color":cor, "highlight":cor]
			resultProfessor[i] = ["label":aluno.escola, "value":aluno.totalprofessor, "color":cor, "highlight":cor]
			resultFuncionario[i] = ["label":aluno.escola, "value":aluno.totalfuncionario, "color":cor, "highlight":cor]

			i++
		}
		result[0] = resultAluno
		result[1] = resultProfessor
		result[2] = resultFuncionario
		//println("result"+result[0] )
		//println("result"+result[1] )
		//println("result"+result[2] )

		render( result as JSON)
		conn.close();
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
