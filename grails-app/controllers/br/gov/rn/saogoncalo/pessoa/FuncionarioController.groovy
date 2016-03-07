package br.gov.rn.saogoncalo.pessoa
import grails.converters.JSON
import groovy.sql.Sql

import java.sql.Driver

import br.gov.rn.saogoncalo.academico.Disciplina
import br.gov.rn.saogoncalo.academico.DisciplinaLecionadaPorProfessor
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.organizacao.Cargo
import br.gov.rn.saogoncalo.organizacao.Lotacao



class FuncionarioController {

	def index() { }

	def gerarRelatorio(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{


			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			def perm1 = usuario.getPermissoes(user, pass , "ADMINISTRACAO_REGISTRO", "LOG", "1")
			def perm2 = usuario.getPermissoes(user, pass, "ADMINISTRACAO_REGISTRO", "LOG", "2")

			if (perm1 || perm2){

				def funcionario
				def lotacao
				def cargo	
				def year = Calendar.getInstance().get(Calendar.YEAR)
				funcionario = Funcionario.executeQuery("select f from Pessoa p, Funcionario f,Lotacao l,Cargo c " +
						" where p.id = f.id "+
						" and l.cargo.id = c.id "+
						" and f.id = l.funcionario.id " +
						" order by p.id ")


				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")

				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
				def sql = new Sql(conn)

				def horasDisciplinas = sql.rows(" select d.disciplina, pe.nome, d.carga_horaria, (sum((length(substring(h.horario,3,length(h.horario))) * 45 )/60.0)* 4) as soma " +
						" from educacao_academico.disciplina d, educacao_academico.disciplina_lecionada_por_professor dlpp, " +
						" cadastro_unico_pessoal.professor p, cadastro_unico_pessoal.pessoa pe, educacao_academico.horario h, " +
						" educacao_academico.turma_disciplina td, educacao_academico.turma t, educacao_academico.serie s " +
						" where dlpp.disciplina_id = d.id " +
						"   and dlpp.professor_id = p.id " +
						"   and pe.id = p.id " +
						"   and h.turma_disciplina_id = td.id " +
						"   and dlpp.id = td.disciplina_lecionada_por_professor_id " +
						"   and td.turma_id = t.id " +
						"   and s.id = t.serie_id " +
						//"   and t.ano_letivo = '2014' " +
						"   and t.ano_letivo = " + year.toString() +
						//"   and pe.id = 2100" + //+ id.toString() +
						" group by d.disciplina, pe.nome, d.carga_horaria");


				println("Aqui -- " + horasDisciplinas)

				def escolas = Escola.findAll()


				render (view:"/funcionario/gerarRelatorio.gsp", model:[funcionario:funcionario, lotacao:lotacao, cargo:cargo, escolas:escolas, horasDisciplinas: horasDisciplinas])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}



	/*def gerarRelatorioByEscola(){
	 if((session["user"] == null) || (session["pass"] == null) ){
	 render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
	 }else{
	 def user = session["user"]
	 def pass = session["pass"]
	 def usuario = new UsuarioController()
	 def perm1 = usuario.getPermissoes(user, pass , "ADMINISTRACAO_REGISTRO", "LOG", "1")
	 def perm2 = usuario.getPermissoes(user, pass, "ADMINISTRACAO_REGISTRO", "LOG", "2")
	 if (perm1 || perm2){
	 def funcionario
	 def lotacao
	 def cargo
	 funcionario = Funcionario.executeQuery("select f from Pessoa p, Funcionario f,Lotacao l,Cargo c " +
	 " where p.id = f.id "+
	 " and l.cargo.id = c.id "+
	 " and f.id = l.funcionario.id " +
	 " order by p.id ")
	 def escolas = Escola.findAll()
	 println("aaaaaaaaaaaa"+funcionario)
	 render (view:"/funcionario/gerarRelatorio.gsp", model:[funcionario:funcionario,lotacao:lotacao,cargo:cargo, escolas:escolas])
	 }else{
	 render(view:"/error403.gsp")
	 }
	 }
	 }
	 */


	def pesquisarFuncionarios(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2){

				def funcionarios
				def cargos
				def lotacao
				def parametro = params.pesquisa
				if (session["escid"] == 0){
					funcionarios = Funcionario.executeQuery("select a from Pessoa as p , Funcionario as a "+
							"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

					//cargos = Cargo.findAll()
					//print("printcargos "+ cargos )

				}else{
					funcionarios = Funcionario.executeQuery("select a from Pessoa as p , Funcionario as a "+
							"where p.id = a.id and p.escid = "+session["escid"]+" and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")
				}

				//lotacao = Lotacao.findAll()
				cargos= Cargo.findAll()

				render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def pesquisarFuncionariosByEscola(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2){


				println("params aqui --- +++ " + params)

				def funcionarios
				def cargos
				def lotacao


				def parametro = params.escola

				/*						if (session["escid"] == 0){
				 funcionarios = Funcionario.executeQuery("select f from Pessoa p, Funcionario f,Lotacao l,Cargo c " +
				 " where p.id = f.id "+
				 " and l.cargo.id = c.id "+
				 " and f.id = l.funcionario.id " +
				 " order by p.nome ")
				 }else{*/

				/*							funcionarios = Funcionario.executeQuery("select f from Pessoa p, Funcionario f, Lotacao l,Cargo c " +
				 " where p.id = f.id "+
				 " and l.cargo.id = c.id "+
				 " and f.id = l.funcionario.id " +
				 " and p.escid = " + parametro +
				 " order by p.nome ")*/
				//}


				// ----- consulta ---

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")

				def endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";

				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
				def sql = new Sql(conn)
				//dadosDoGrafico2();
				List<String> alunoByEscola = new ArrayList();


				//verificar com matriculas
				funcionarios = sql.rows(" select p.escid, p.nome, f.matricula, f.id, c.cargo, l.turno, l.funcao, l.vinculo, "+
						" (select e.nome from cadastro_unico_pessoal.pessoa e " +
						" where e.id = p.escid ) as escola ,  " +
						" (select e.id from cadastro_unico_pessoal.pessoa e " +
						" where e.id = p.escid ) as escolaId " +
						" from cadastro_unico_pessoal.Pessoa p, cadastro_unico_pessoal.Funcionario f, " +
						" administracao_organizacao.Lotacao l, administracao_organizacao.Cargo c "+
						" where p.id = f.id "+
						" and l.cargo_id = c.id "+
						" and f.id = l.funcionario_id "+
						" and p.escid = " + params.escola +
						" order by p.nome");

				// ------------------
					
				def year = Calendar.getInstance().get(Calendar.YEAR)

				def horasDisciplinas = sql.rows(" select d.disciplina, pe.nome, d.carga_horaria, (sum((length(substring(h.horario,3,length(h.horario))) * 45 )/60.0)* 4) as soma " +
						" from educacao_academico.disciplina d, educacao_academico.disciplina_lecionada_por_professor dlpp, " +
						" cadastro_unico_pessoal.professor p, cadastro_unico_pessoal.pessoa pe, educacao_academico.horario h, " +
						" educacao_academico.turma_disciplina td, educacao_academico.turma t, educacao_academico.serie s " +
						" where dlpp.disciplina_id = d.id " +
						"   and dlpp.professor_id = p.id " +
						"   and pe.id = p.id " +
						"   and h.turma_disciplina_id = td.id " +
						"   and dlpp.id = td.disciplina_lecionada_por_professor_id " +
						"   and td.turma_id = t.id " +
						"   and s.id = t.serie_id " +
						//"   and t.ano_letivo = '2015' " +
						"   and t.ano_letivo = " + year.toString() +
						"   and pe.id = 2100" + //+ id.toString() +
						" group by d.disciplina, pe.nome, d.carga_horaria");



				cargos= Cargo.findAll()
				def escolas = Escola.findAll()


				println("Teste : " + params + funcionarios)

				render(view:"/funcionario/gerarRelatorio.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2, escolas:escolas, horasDisciplinas:horasDisciplinas])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def editarFuncionario(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			def cargo
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			def lotacao

			if (perm2) {
				Funcionario funcionarios = Funcionario.get(id)

				cargo = Cargo.findAll()

				lotacao = Lotacao.findByFuncionario(funcionarios)

				def charManha = ""
				def charTarde = ""
				def charNoite = ""

				if(lotacao != null) {

					if( lotacao.turno.toString().contains("M")){

						charManha="M"
					}

					if( lotacao.turno.toString().contains("T")){

						charTarde="T"
					}
					if( lotacao.turno.toString().contains("N")){

						charNoite="N"
					}
				}



				Cargo cargoProfessor = Cargo.get(lotacao.cargo.id)
				def dlpp, dlppl, disc
				Professor professores = new Professor()

				if (cargoProfessor.cargo == "PROFESSOR" || cargoProfessor.cargo == "PROFESSOR PI G") {
					professores = Professor.get(id)
					dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(professores)
					dlppl =  dlpp.disciplina.id
					disc  = Disciplina.findAll()
				}


				render (view:"/funcionario/editarFuncionario.gsp", model:[funcionarios:funcionarios,lotacao:lotacao,cargo:cargo,charManha:charManha,charTarde:charTarde,charNoite:charNoite, professores:professores, dlppl:dlppl, disc:disc])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def verInfoFuncionario(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")


			if (perm1 || perm2) {
				Funcionario funcionarios = Funcionario.get(id)
				Lotacao lotacao = Lotacao.findByFuncionario(funcionarios)

				render (view:"/funcionario/verInfoFuncionario.gsp", model:[funcionarios:funcionarios,lotacao:lotacao])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")

			if (perm2) {

				def pessoa = Pessoa.get(params.id)
				pessoa.nome = params.nome
				pessoa.dataDeNascimento = params.dataDeNascimento
				if (!params.cpfCnpj.trim().equals(''))
					pessoa.cpfCnpj = params.cpfCnpj
				else
					pessoa.cpfCnpj = null

				def pessoaFisica = PessoaFisica.get(params.id)
				pessoaFisica.rcNumero = params.rcNumero
				pessoaFisica.rcNomeDoCartorio = params.rcNomeDoCartorio
				pessoaFisica.rcNomeDoLivro = params.rcNomeDoLivro
				pessoaFisica.rcFolhaDoLivro = params.rcFolhaDoLivro
				pessoaFisica.sexo = params.sexo

				def cidadao = Cidadao.get(params.id)
				cidadao.nacionalidade = params.nacionalidade
				cidadao.estadoCivil = params.estadoCivil
				cidadao.profissao = params.funcao

				def funcionario = Funcionario.get(params.id)
				funcionario.cargaHoraria = params.cargaHoraria
				funcionario.matricula = params.matricula
				funcionario.observacao = params.observacao.toString().toUpperCase()


				//def funcionarios = Funcionario.findAll()

				def professor = Professor.get(params.id)

				if(funcionario.save(flush:true)){

					//			render(view:"/funcionario/listarFuncionario.gsp", model:[
					//				funcionarios:funcionarios,
					//				ok : "Funcionário atualizado com sucesso!"
					//
					//			])


					def turnoCompleto = ""
					if (params.opcao1 != null ){
						turnoCompleto = turnoCompleto + params.opcao1
						turnoCompleto = turnoCompleto + ""
					}
					if (params.opcao2 != null ){
						turnoCompleto = turnoCompleto + params.opcao2
					}else{
						turnoCompleto = turnoCompleto + ""
					}
					if (params.opcao3 != null ){
						turnoCompleto = turnoCompleto + params.opcao3
					}
					else{
						turnoCompleto = turnoCompleto + ""
					}
					println("opcao1 "+params.opcao1)
					println("opcao2 "+params.opcao2)
					println("opcao3 "+params.opcao3)

					println("turnoCompleto"+turnoCompleto)


					//codigo pra lotação
					def cargos
					def lotacao = Lotacao.findByFuncionario(funcionario)

					if(lotacao == null){

						Lotacao newLotacao = new Lotacao()
						newLotacao.vinculo = params.vinculo
						newLotacao.cargo = Cargo.get(params.cargo)
						newLotacao.funcao = params.funcao
						newLotacao.funcionario = funcionario
						newLotacao.situacao = "ATIVO"
						newLotacao.turno = turnoCompleto
						newLotacao.dataInicio = new Date()
						newLotacao.dataTermino = new Date()

						if (newLotacao.save(flush:true)){
							println("newLotacao --- " + newLotacao)
						}else{
							listarMensagem("Erro ao atualizar lotação!", "erro")
						}

						cargos = Cargo.findAll()
						println("cargos "+ cargos)


						def funcionarios

						//render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2])
						listarMensagem("Funcionário atualizado com sucesso!", "ok")
					}else{


						lotacao.vinculo = params.vinculo
						lotacao.cargo = Cargo.get(params.cargo)

						println("params "+params)


						lotacao.turno = turnoCompleto
						lotacao.funcao = params.funcao
						lotacao.save(flush:true)

						println("Lotação - " + lotacao)
						listarMensagem("Funcionário atualizado com sucesso!", "ok")
					}


					// ----------- disciplina lecionada por professor


					def dlpp = DisciplinaLecionadaPorProfessor.findAllByProfessor(professor)
					def dp = dlpp.disciplina.id
					def disciplinaNovo = params.disciplinaLecionadaPorProfessor
					def idDisc


					println(" disciiplinaNovo - " + disciplinaNovo)

					if ((disciplinaNovo.getClass() != java.lang.String) && (disciplinaNovo != null))
					{

						for (int i=0; i<disciplinaNovo.size(); i++){

							idDisc = disciplinaNovo[i]

							if (!dp.contains(idDisc.toLong())){
								DisciplinaLecionadaPorProfessor professorDisciplina = new DisciplinaLecionadaPorProfessor()

								def dpi = Disciplina.get(idDisc)

								professorDisciplina.professor = professor
								professorDisciplina.disciplina = dpi
								professorDisciplina.data = new Date()
								professorDisciplina.situacao = "ATIVA"

								professorDisciplina.save(flush:true)


							}
						}



					}else{


						idDisc = disciplinaNovo

						if(idDisc != null){
							if (!dp.contains(idDisc.toLong()) ){
								DisciplinaLecionadaPorProfessor professorDisciplina = new DisciplinaLecionadaPorProfessor()

								def dpi = Disciplina.get(idDisc)

								professorDisciplina.professor = professor
								professorDisciplina.disciplina = dpi
								professorDisciplina.data = new Date()
								professorDisciplina.situacao = "ATIVA"

								professorDisciplina.save(flush:true)


							}
						}
					}


					if (disciplinaNovo.getClass() != java.lang.String) {
						for (int i=0; i<dp.size(); i++){

							def cont = 0
							for (int j = 0;j<disciplinaNovo.size(); j++) {
								if (dp[i].toString() == disciplinaNovo[j].toString()){
									cont = cont+1
								}
								idDisc = dp[i]
							}

							if (cont == 0){
								def disc = Disciplina.get(idDisc)
								def dlppl = DisciplinaLecionadaPorProfessor.findByDisciplinaAndProfessor(disc, professor)

								dlppl.delete()
							}
						}
					}else {
						for (int i=0; i<dp.size(); i++){
							def cont = 0
							if (dp[i].toString() == disciplinaNovo){
								cont = cont+1
							}
							idDisc = dp[i]

							if (cont == 0){

								def disc = Disciplina.get(idDisc)
								def dlppl = DisciplinaLecionadaPorProfessor.findByDisciplinaAndProfessor(disc, professor)

								dlppl.delete()
							}
						}
					}

					// -----------------------------------------------



					//listarMensagem("Funcionário atualizado com sucesso!", "ok")
				}else{
					//			render(view:"/funcionario/editarFuncionario.gsp", model:[funcionarios:funcionarios,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar!", "erro")
				}




			}
		}

		/*	def cargos
		 def lotacao = Lotacao.findByFuncionario(funcionario)
		 if(lotacao == null){
		 Lotacao newLotacao = new Lotacao()
		 newLotacao.vinculo = params.vinculo
		 newLotacao.cargo = Cargo.get(params.cargo)
		 newLotacao.funcao = params.funcao
		 newLotacao.funcionario = funcionario
		 newLotacao.situacao = "ATIVO"
		 newLotacao.dataInicio = new Date()
		 newLotacao.dataTermino = new Date()
		 if (newLotacao.save(flush:true)){
		 println("newLotacao --- " + newLotacao)
		 }else{
		 listarMensagem("Erro ao atualizar lotação!", "erro")
		 }
		 cargos = Cargo.findAll()
		 println("cargos "+ cargos)
		 render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2])
		 }else{
		 lotacao.vinculo = params.vinculo
		 lotacao.cargo = Cargo.get(params.cargo)
		 println("params "+params)
		 def turnoCompleto = ""
		 if (params.opcao1 != null ){
		 turnoCompleto = turnoCompleto + params.opcao1
		 }else{
		 turnoCompleto = turnoCompleto + ""
		 }
		 if (params.opcao2 != null ){
		 turnoCompleto = turnoCompleto + params.opcao2
		 }else{
		 turnoCompleto = turnoCompleto + ""
		 }
		 if (params.opcao3 != null ){
		 turnoCompleto = turnoCompleto + params.opcao3
		 }
		 else{
		 turnoCompleto = turnoCompleto + ""
		 }
		 println("opcao1 "+params.opcao1)
		 println("opcao2 "+params.opcao2)
		 println("opcao3 "+params.opcao3)
		 println("turnoCompleto"+turnoCompleto)
		 lotacao.turno = turnoCompleto
		 lotacao.funcao = params.funcao
		 lotacao.save(flush:true)
		 def date = new Date()
		 AdministracaoController adm = new AdministracaoController()
		 adm.salvaLog(session["usid"].toString().toInteger(), "funcionario atualizado " + funcionario.cidadao.pessoaFisica.pessoa.id.toString(),"atualizar", "Funcionario", date)
		 }
		 }
		 }*/

	}


	def listar() {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def cargos
			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")

			def funcionarios

			def lotacao
			if (perm1 || perm2) {
				// def msg="Funcionario cadastrado com sucesso"
				if (session["escid"] == "0") {
					//funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id ")
					//lotacao = Lotacao.findAll()

				}else{
					//	funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				}

				//lotacao = Lotacao.findAll()
				funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				cargos = Cargo.findAll()
				render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2])
			}
		}
	}


	def listarMensagem(String msg, String tipo) {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			msg="Funcionario cadastrado com sucesso"

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			def funcionarios
			//def lotacao
			def cargos
			if (perm1 || perm2) {

				if (session["escid"] == "0") {
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id ")
					//cargos = Cargo.findAll()
					//lotacao = Lotacao.findAll()

				}else{
					//cargos = Cargo.findAll()
					//lotacao = Lotacao.findAll()
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				}
				tipo= params.tipo
				msg = params.msg

				cargos = Cargo.findAll()
				print ">>>>>>>>>>>>>>>>>>>" + funcionarios.lotacao.cargo.cargo
				/*for (fun in funcionarios.lotacao.cargo.cargo) {
				 if (fun.isEmpty()) {
				 print "CARGO NÃO VAZIO >>>" + fun
				 }else {
				 fun = " a"
				 print "CARGO VAZIO >>>" + fun
				 }	
				 }*/
				if (tipo == "ok"){
					render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios, ok:msg,perm2:perm2, cargos:cargos])
				}else{
					render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios, erro:msg, perm2:perm2, cargos:cargos])
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def  getFuncionarioByIdParaRelatorio(long id){
		def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
		def props = new Properties()
		
		props.setProperty("user", "admin_db_sr")
		props.setProperty("password", "bgt54rfvcde3")
		List <String> lista = new ArrayList();
		def year = Calendar.getInstance().get(Calendar.YEAR)
		def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
		def sql = new Sql(conn)
		//verificar com matriculas
		def horario= sql.rows("select p.id, p.nome, td.turma_id, dis.disciplina, hr.horario, " +
				" hr.hora_aula, length(substring(hr.horario, 3, length(hr.horario))) as qtd " +
				" from cadastro_unico_pessoal.pessoa as p, cadastro_unico_pessoal.professor as prof, " +
				" educacao_academico.disciplina as dis, " +
				" educacao_academico.disciplina_lecionada_por_professor as dlpp, " +
				" educacao_academico.turma_disciplina as td, educacao_academico.horario as hr " +
				" where p.id = prof.id " +
				" and prof.id = dlpp.professor_id " +
				" and dlpp.disciplina_id = dis.id " +
				" and td.disciplina_lecionada_por_professor_id = dlpp.id " +
				" and hr.turma_disciplina_id = td.id " +
				" and p.id = " + id.toString())


		def listaDisciplina = sql.rows("select t.turma, d.disciplina,"+
				"sum((length(substring(h.horario,3,length(h.horario))))) as quantidade_aulas,"+
				"dds.quantidade_aula_semanal "+

				"from educacao_academico.disciplina d, educacao_academico.disciplina_lecionada_por_professor dlpp,"+
				"cadastro_unico_pessoal.professor p, cadastro_unico_pessoal.pessoa pe, educacao_academico.horario h,"+
				"educacao_academico.turma_disciplina td, educacao_academico.turma t, educacao_academico.serie s,"+
				"educacao_academico.dados_disciplina_serie dds "+

				" where dlpp.disciplina_id = d.id"+
				" and dlpp.professor_id = p.id"+
				" and pe.id = p.id"+
				" and h.turma_disciplina_id = td.id"+
				" and dlpp.id = td.disciplina_lecionada_por_professor_id"+
				" and td.turma_id = t.id"+
				" and s.id = t.serie_id"+
				" and dds.disciplina_id = d.id"+
				" and dds.serie_id = s.id"+

				//" and t.ano_letivo = '2016' "+
				" and t.ano_letivo = " + year.toString() +
				
				" and substring(dds.turno,1,1) = substring(h.horario,2,1)"+
				" and pe.id = "+ id.toString() +

				" group by t.id, d.id, pe.id, dds.quantidade_aula_semanal"+
				" order by t.id")




		//println("dados da lista"+horario)
		def funcionario = Funcionario.get(id)
		def escola = Escola.get(funcionario.cidadao.pessoaFisica.pessoa.escid)

		def result = ["nomeFuncionario":funcionario.cidadao.pessoaFisica.pessoa.nome, "escola":escola.pessoaJuridica.pessoa.nome,
			"cargaHoraria":funcionario.cargaHoraria, "cargo":funcionario.lotacao.cargo.cargo, "funcao":funcionario.lotacao.funcao,
			"horario":horario, "listaDisciplina":listaDisciplina ]

		render( result as JSON)

	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			if (perm2) {
				Pessoa.deleteAll(Pessoa.get(id))

				def pessoa = Pessoa.findAll()

				def funcionarios = Funcionario.findAll()

				Funcionario func = Funcionario.get(id)
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "funcionario deletado " + func.cidadao.pessoaFisica.pessoa.id.toString(),"deletar", "Funcionario", date)


				redirect(action:"listarMensagem", params:[msg:"deletado com sucesso!", tipo: "ok" ]  )
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			if (perm2) {

				println("params ------ "+params)

				Pessoa pessoa = new Pessoa(params)
				pessoa.escid = session["escid"]
				pessoa.nome = params.nome.toString().toUpperCase()

				if (pessoa.save(flush:true)){
					println("Salvou pessoa")

					PessoaFisica pessoaFisica = new PessoaFisica(params)

					pessoaFisica.pessoa = pessoa
					pessoaFisica.save(flush:true)
					pessoaFisica.errors.each{ println it }

					Cidadao cidadao = new Cidadao(params)
					cidadao.pessoaFisica = pessoaFisica
					cidadao.save(flush:true)
					cidadao.errors.each{ println it }

					Funcionario funcionario = new Funcionario(params)
					funcionario.observacao = params.observacao.toString().toUpperCase()
					funcionario.cidadao = cidadao

					if(funcionario.save(flush:true)){
						funcionario.errors.each{ println it }

						def dataAtual=new Date()

						Cargo cargo= Cargo.get(params.cargoId)

						if (cargo.cargo == "PROFESSOR" || cargo.cargo == "PROFESSOR PI G") {
							def professor = new Professor()
							professor.identificacao = ""
							professor.funcionario = funcionario

							if(professor.save(flush:true)){
								DisciplinaLecionadaPorProfessor disciplinaProfessor = new DisciplinaLecionadaPorProfessor()
								Disciplina disciplina

								for (var in params.disciplinaProf) {

									disciplinaProfessor = new DisciplinaLecionadaPorProfessor()
									disciplina = new Disciplina()

									//disciplina = Disciplina.get(Integer.parseInt(var))
									disciplina = Disciplina.get(var)


									disciplinaProfessor.professor = professor
									disciplinaProfessor.disciplina = disciplina

									disciplinaProfessor.data = new Date()


									disciplinaProfessor.situacao = "ATIVA"
									disciplinaProfessor.save(flush:true)
								}
							}
						}



						Lotacao lotacao = new Lotacao()
						lotacao.cargo= cargo
						lotacao.funcionario = funcionario
						lotacao.situacao="Ativo"
						lotacao.vinculo=params.vinculo
						lotacao.funcao=params.funcao

						def turnoCompleto=""
						if (params.opcao1 != null ){
							turnoCompleto = turnoCompleto + params.opcao1
						}else{

							turnoCompleto = turnoCompleto + ""
						}
						if (params.opcao2 != null ){
							turnoCompleto = turnoCompleto + params.opcao2
						}else{
							turnoCompleto = turnoCompleto + ""
						}
						if (params.opcao3 != null ){
							turnoCompleto = turnoCompleto + params.opcao3
						}
						else{
							turnoCompleto = turnoCompleto + ""
						}


						lotacao.turno = turnoCompleto
						lotacao.dataInicio = dataAtual
						lotacao.dataTermino = dataAtual
						lotacao.save(flush:true)
						println("Salvou lotação")

						def date = new Date()
						AdministracaoController adm = new AdministracaoController()
						adm.salvaLog(session["usid"].toString().toInteger(), "funcionario cadastrado " + funcionario.cidadao.pessoaFisica.pessoa.id.toString(),"cadastrado", "Funcionario", date)


						lotacao.errors.each{ println it }

						println("opcao1 "+params.opcao1)
						println("opcao2 "+params.opcao2)
						println("opcao3 "+params.opcao3)



						println("turnoCompleto"+turnoCompleto)

						println("Lotação --- " + lotacao)


						//				def funcionarios = Funcionario.findAll()
						//				render(view:"/funcionario/listarFuncionario.gsp", model:[
						//					funcionarios:funcionarios,
						//					ok : "Funcionário cadastrado com sucesso!"
						//
						//				])
						//listarMensagem("Funcionário cadastrado com sucesso!","ok")
						def ok
						def ti
						redirect(controller: "Funcionario", action: "listarMensagem", params:[msg:"Funcionário cadastrado com sucesso!", tipo:"ok"])
						//listar()
						println("listar do if")
					}else{

						//				def funcionarios = Funcionario.findAll()
						//				render(view:"/funcionario/listarFuncionario.gsp", model:[
						//					funcionarios:funcionarios,
						//					erro : "Erro ao Salvar Funcionário!"
						//				])
						//listarMensagem("Erro ao Salvar Funcionário! 1","erro")
						redirect(controller: "Funcionario", action: "listar" , namespace: "publishing")
						//listar()
						println("listar do else")
					}
					/*}else{
					 if (pessoa.save(flush:true)){
					 PessoaFisica pessoaFisica = new PessoaFisica(params)
					 pessoaFisica.pessoa = pessoa
					 pessoaFisica.save(flush:true)
					 pessoaFisica.errors.each{ println it }
					 Cidadao cidadao = new Cidadao(params)
					 cidadao.pessoaFisica = pessoaFisica
					 cidadao.save(flush:true)
					 cidadao.errors.each{ println it }
					 Funcionario funcionario = new Funcionario(params)
					 funcionario.cidadao = cidadao
					 if(funcionario.save(flush:true)){
					 funcionario.errors.each{ println it }
					 def dataAtual=new Date()
					 //Cargo cargo= Cargo.get(params.cargoId)
					 Lotacao lotacao= new Lotacao()
					 lotacao.cargo = cargo
					 lotacao.funcionario=funcionario
					 lotacao.situacao="Ativo"
					 lotacao.vinculo=params.vinculo
					 lotacao.funcao=params.funcao
					 lotacao.dataInicio=dataAtual
					 lotacao.dataTermino=dataAtual
					 lotacao.save(flush:true)
					 //				def funcionarios = Funcionario.findAll()
					 //				render(view:"/funcionario/listarFuncionario.gsp", model:[
					 //					funcionarios:funcionarios,
					 //					ok : "Funcionário cadastrado com sucesso!"
					 //
					 //				])
					 //listarMensagem("Funcionário cadastrado com sucesso!","ok")
					 listar()
					 }else{
					 //				def funcionarios = Funcionario.findAll()
					 //				render(view:"/funcionario/listarFuncionario.gsp", model:[
					 //					funcionarios:funcionarios,
					 //					erro : "Erro ao Salvar Funcionário!"
					 //				])
					 //listarMensagem("Erro ao Salvar Funcionário!","erro")
					 listar()
					 }
					 }else{
					 def erros
					 pessoa.errors.each{ erros = it }
					 if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
					 erros = "CPF Já está cadastrado no sistema"
					 }
					 //			def funcionarios = Funcionario.findAll()
					 //			render(view:"/funcionario/listarFuncionario.gsp", model:[
					 //				funcionarios:funcionarios,
					 //				erro : erros
					 //			])
					 //listarMensagem("Erro ao Salvar Funcionário!","erro")
					 listar()
					 }
					 def erros
					 pessoa.errors.each{ erros = it }
					 if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
					 erros = "CPF Já está cadastrado no sistema"
					 }
					 //			def funcionarios = Funcionario.findAll()
					 //			render(view:"/funcionario/listarFuncionario.gsp", model:[
					 //				funcionarios:funcionarios,
					 //				erro : erros
					 //			])
					 //listarMensagem("Erro ao Salvar Funcionário! 2","erro")
					 listar()*/
				}
			}
		}
	}

	def gerarRelatorioListarProfessores(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Funcionario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			if (perm2) {


				println("escola params --- " + params)

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver
				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")
				List <String> lista = new ArrayList();
				def year = Calendar.getInstance().get(Calendar.YEAR)

				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
				def sql = new Sql(conn)
				//verificar com matriculas

				def listaDisciplina = sql.rows("select pe.escid, pe.nome, t.turma, d.disciplina,"+
						"sum((length(substring(h.horario,3,length(h.horario))))) as quantidade_aulas,"+
						"dds.quantidade_aula_semanal "+

						"from educacao_academico.disciplina d, educacao_academico.disciplina_lecionada_por_professor dlpp,"+
						"cadastro_unico_pessoal.professor p, cadastro_unico_pessoal.pessoa pe, educacao_academico.horario h,"+
						"educacao_academico.turma_disciplina td, educacao_academico.turma t, educacao_academico.serie s,"+
						"educacao_academico.dados_disciplina_serie dds "+

						" where dlpp.disciplina_id = d.id"+
						" and dlpp.professor_id = p.id"+
						" and pe.id = p.id"+
						" and h.turma_disciplina_id = td.id"+
						" and dlpp.id = td.disciplina_lecionada_por_professor_id"+
						" and td.turma_id = t.id"+
						" and s.id = t.serie_id"+
						" and dds.disciplina_id = d.id"+
						" and dds.serie_id = s.id"+

						//" and t.ano_letivo = '2016' "+
						" and t.ano_letivo = " + year.toString() + 
						" and substring(dds.turno,1,1) = substring(h.horario,2,1)"+
						" and pe.escid = " +id.toString() +

						" group by t.id, d.id, pe.id, dds.quantidade_aula_semanal"+
						" order by t.id")




				render (view:"/funcionario/gerarRelatorioListarProfessores.gsp", model:[listaDisciplina:listaDisciplina])






			}
		}

	}

}
