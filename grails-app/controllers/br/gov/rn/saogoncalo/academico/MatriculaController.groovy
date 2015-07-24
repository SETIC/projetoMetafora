package br.gov.rn.saogoncalo.academico


import grails.converters.JSON
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Escola


class MatriculaController {

	def index() {
	}
	
	
	
	def pesquisarMatriculas(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")


			if (perm1 || perm2){
				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)
				
				def matricula
				def alunos
				def alunos1
				def escolas
				def series
				def parametro = params.pesquisa
				//session["escid"] == 0
				if (parametro != null || parametro != ""){	
					matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t, Pessoa as p " +
							"  where t.id = m.turma.id " +
							"    and p.escid ="+Long.parseLong(session["escid"].toString())+" and p.id = m.aluno.id" +
							"    and t.anoLetivo = ? "+
							"    and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')",[ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))
					series = Serie.findAll()
					
					alunos1 = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
						"  where p.id = a.id and p.escid = ? and p.status = 'Ativo' " +
						"    and a.id not in ( select m.aluno.id " +
						"  						 from Matricula as m, Turma as t " +
						" 					    where t.id = m.turma.id " +
						"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])

					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.escid =? and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ?  ) and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"') " , [session["escid"],ano])
					print("print matriculas "+ matricula )
				}else{
					matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
							"  where t.id = m.turma.id " +
							"  and p.escid ="+Long.parseLong(session["escid"].toString())+" and t.escola.id = ? and t.anoLetivo = ?",[Long.parseLong(session["escid"].toString()), ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))
					series = Serie.findAll()
					
					alunos1 = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
						"  where p.id = a.id and p.escid = ? and p.status = 'Ativo' " +
						"    and a.id not in ( select m.aluno.id " +
						"  						 from Matricula as m, Turma as t " +
						" 					    where t.id = m.turma.id " +
						"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])

					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.escid = ? and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])
				}

				render(view:"/matricula/listarMatricula.gsp", model:[escolas:escolas,series:series, alunos:alunos,alunos1:alunos1, matricula:matricula, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
		
		


	def listar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm1 || perm2) {

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)


				def matricula
				def alunos
				def escolas
				def alunos1
			
				if ((session["escid"] == 0) && ((session["master"] == true)) ) {

					//matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
					//		"  where t.id = m.turma.id " +
					//		"  and t.anoLetivo = ?",[ano])

					escolas = Escola.findAll()
					def series = Serie.findAll()
					
					alunos1 = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
						"  where p.id = a.id and p.escid = ?and p.escid ="+Long.parseLong(session["escid"].toString())+" and p.status = 'Ativo' " +
						"    and a.id not in ( select m.aluno.id " +
						"  						 from Matricula as m, Turma as t " +
						" 					    where t.id = m.turma.id " +
						"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])

					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.escid ="+Long.parseLong(session["escid"].toString())+" and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ? ) " , [ano])
				
					
					
					}else{

					//matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
					//		"  where t.id = m.turma.id " +
					//		"  and t.escola.id = ? and t.anoLetivo = ?",[Long.parseLong(session["escid"].toString()), ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))
				

					alunos1 = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
						"  where p.id = a.id and p.escid = ?and p.escid ="+Long.parseLong(session["escid"].toString())+" and p.status = 'Ativo' " +
						"    and a.id not in ( select m.aluno.id " +
						"  						 from Matricula as m, Turma as t " +
						" 					    where t.id = m.turma.id " +
						"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])
					
					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.escid = ?and p.escid ="+Long.parseLong(session["escid"].toString())+" and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])
							
				}

				def series = Serie.findAll()

				println("Escolas - " + escolas)

				render(view:"/matricula/listarMatricula.gsp", model:[matricula:matricula, escolas:escolas, alunos:alunos, alunos1:alunos1, series:series, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def listarMensagem(String msg, String tipo){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm1 || perm2) {

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def matricula
				def alunos
				def escolas
				
				if ((session["escid"] == 0) && ((session["master"] == true)) ) {

					matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
							"  where t.id = m.turma.id " +
							"  and t.anoLetivo = ?",[ano])

					escolas = Escola.findAll()


					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ? ) " , [ano])
				}else{

					matricula = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
							"  where t.id = m.turma.id " +
							"  and t.escola.id = ? and t.anoLetivo = ?",[Long.parseLong(session["escid"].toString()), ano])

					escolas = Escola.get(Long.parseLong(session["escid"].toString()))


					alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a  " +
							"  where p.id = a.id and p.escid = ? and p.status = 'Ativo' " +
							"    and a.id not in ( select m.aluno.id " +
							"  						 from Matricula as m, Turma as t " +
							" 					    where t.id = m.turma.id " +
							"   				     	and t.anoLetivo >= ? ) " , [session["escid"], ano])
				}

				def series = Serie.findAll()

				println("Escolas - " + escolas)

				if (tipo == "ok")

					render(view:"/matricula/listarMatricula.gsp", model:[matricula:matricula, escolas:escolas, alunos:alunos, series:series, ok:msg, perm2:perm2])
				else
					render(view:"/matricula/listarMatricula.gsp", model:[matricula:matricula, escolas:escolas, alunos:alunos, series:series, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm2) {

				Matricula.deleteAll(Matricula.get(id))

				//redirect(action:"listar" )
				//listarMensagem("Matrícula excluída com sucesso ", "ok")
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def editarMatricula(long id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm2) {

				def escolas = Escola.findAll()
				def series = Serie.findAll()
				Matricula matricula = Matricula.get(id)

				def turmas = Turma.findAllBySerieAndEscola(matricula.turma.serie, matricula.turma.escola)


				def aluno = Aluno.get(matricula.aluno.id)
				render (view:"/matricula/editarMatricula.gsp", model:[matriculas:matricula, escolas:escolas, aluno:aluno, series:series, turmas:turmas])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}



	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm2) {
				def matricula = Matricula.get(params.idMatricula)

				def aluno = Aluno.get(params.aluno)
				def turma = Turma.get(params.turma)


				matricula.aluno = aluno
				matricula.turma = turma

				matricula.dataDaMatricula = new Date()
				matricula.matricula = params.matricula


				//def matriculas = Matricula.findAll()
				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)
				/*def matriculas = Matricula.executeQuery(" select m from Matricula as m, Turma as t " +
				 "  where t.id = m.turma.id " +
				 "  and t.escola.id = ? and t.anoLetivo = ?",[ Long.parseLong(session["escid"].toString()), ano ])*/

				if(matricula.save(flush:true)){
					/*
					 render(view:"/matricula/listarMatricula.gsp", model:[
					 matricula:matriculas,
					 ok : "Matriucla atualizada com sucesso!"
					 ])*/


					listarMensagem("Matricula atualizada com sucesso", "ok")
					//redirect(action: "listar", params: [ok: "Teste OK params"])
				}else{
					/*render(view:"/matricula/listarMatricula.gsp", model:[matricula:matriculas,
					 erro : "Erro ao atualizar!"
					 ])*/


					listarMensagem("Erro ao Atualizar", "erro")
				}
			}
		}
	}

	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "MATRICULA", "2")

			if (perm2) {


				Matricula matriculaM = new Matricula(params)
				matriculaM.status = 'Ativo'

				def turma = Turma.findById(params.turma)
				def matriculados = Matricula.findAllByTurma(turma)
				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)


				if(matriculados.size() >= turma.vagas){

					listarMensagem("Turma não possui Vagas", "erro")
				}else{


					if(matriculaM.save(flush:true)){


						listarMensagem("Matrícula realizada com sucesso", "ok")

					}else{


						listarMensagem("Erro ao salvar Matrícula", "erro")
					}
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def  getMatriculaByIdParaRelatorio(long id){

		def matricula = Matricula.get(id)

		def result = ["nomeAluno":matricula.aluno.cidadao.pessoaFisica.pessoa.nome, "dataAluno" : matricula.aluno.cidadao.pessoaFisica.pessoa.dataDeNascimento , "serie":matricula.turma.serie.serie,
			"turma":matricula.turma.turma, "anoLetivo": matricula.turma.anoLetivo, "nacionalidade" : matricula.aluno.cidadao.nacionalidade]		

		render( result as JSON)

	}

}


