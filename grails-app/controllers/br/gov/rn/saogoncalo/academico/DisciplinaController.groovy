package br.gov.rn.saogoncalo.academico

import br.gov.rn.saogoncalo.login.UsuarioController

class DisciplinaController {

	def index() { }

	def listar (){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm1 || perm2) {
				def disciplinas = Disciplina.findAll()
				render (view:"/disciplina/listarDisciplina.gsp", model:[disciplinas:disciplinas, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def listarMensagem (String msg , String tipo){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm1 || perm2) {
				def disciplinas = Disciplina.findAll() 
				//render (view:"/disciplina/listarDisciplina.gsp", model:[disciplinas:disciplinas])
				if (tipo == "ok")

					render (view:"/disciplina/listarDisciplina.gsp", model:[disciplinas:disciplinas, ok:msg, perm2:perm2])

				else
					render (view:"/disciplina/listarDisciplina.gsp", model:[disciplinas:disciplinas, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm2) {
				Disciplina.deleteAll(Disciplina.get(id))

				//redirect(action:"listar" )
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def editarDisciplina(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm2) {
				Disciplina disciplinas = Disciplina.get(id)
				render (view:"/disciplina/editarDisciplina.gsp", model:[disciplinas:disciplinas])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def atualizar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm2) {
				def disciplina = Disciplina.get(params.id)

				disciplina.disciplina = params.disciplina
				disciplina.cargaHoraria = params.cargaHoraria

				def disciplinas = Disciplina.findAll()


				if(disciplina.save(flush:true)){

					//			render(view:"/disciplina/listarDisciplina.gsp", model:[
					//				disciplinas:disciplinas,
					//				ok : "Disciplina atualizada com sucesso!"
					//
					//			])
					listarMensagem("Disciplina atualizada com sucesso!", "ok")
				}else{
					//			render(view:"/disciplina/editarDisciplina.gsp", model:[disciplinas:disciplinas,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar", "erro")
				}
			}
		}
	}


	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Disciplina", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "DISCIPLINA", "2")

			if (perm2) {

				Disciplina disciplina = new Disciplina()

				disciplina.disciplina = params.disciplina
				disciplina.cargaHoraria = params.cargaHoraria

				def disciplinas = Disciplina.findAll()

				if(disciplina.save(flush:true)){

					//			render(view:"/disciplina/listarDisciplina.gsp", model:[
					//				disciplinas:disciplinas,
					//				ok : "Disciplina cadastrada com sucesso!"
					//
					//			])
					listarMensagem("Disciplina cadastrada com sucesso!", "ok")
				}else{

					//			render(view:"/disciplina/listarDisciplina.gsp", model:[
					//				disciplina:disciplina,
					//				erro : "Erro ao Salvar Disciplina!"
					//			])
					listarMensagem("Erro ao Salvar Disciplina!", "erro")
				}
			}
			else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	
	def editarAtividade(long id){

				Atividade atividades = Atividade.get(id)
				render (view:"/atividade/editarAtividade.gsp", model:[escolas:escolas])
	
	}
	
	
	
}
