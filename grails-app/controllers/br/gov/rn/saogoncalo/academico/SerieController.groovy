package br.gov.rn.saogoncalo.academico

import br.gov.rn.saogoncalo.login.UsuarioController

class SerieController {

	def index() {
	}

	def listar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "SERIE", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm1 || perm2) {


				def serie = Serie.findAll()
				render(view:"/serie/listarSerie.gsp", model:[serie:serie, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def listarMensagem(String msg, String tipo){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "EDUCACAO_ACADEMICO", "SERIE", "1")
			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm1 || perm2) {

				def serie = Serie.findAll()
				//render(view:"/serie/listarSerie.gsp", model:[serie:serie])
				if (tipo == "ok")

					render(view:"/serie/listarSerie.gsp", model:[serie:serie, ok:msg, perm2:perm2])
				else
					render(view:"/serie/listarSerie.gsp", model:[serie:serie, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def editarSerie(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm2) {

				Serie series = Serie.get(id)
				render (view:"/serie/editarSerie.gsp", model:[series:series])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm2) {

				def series = Serie.get(params.id)

				series.serie = params.serie
				series.numeroDeVagas = Integer.parseInt(params.numeroDeVagas)
				series.dataDeInicio = params.dataDeInicio
				series.dataDeTermino = params.dataDeTermino



				if(series.save(flush:true)){


					//			def serie = Serie.findAll()
					//			render(view:"/serie/listarSerie.gsp", model:[
					//				serie:serie,
					//				ok : "Serie atualizado com sucesso!"
					//
					//			])
					listarMensagem("Serie atualizado com sucesso!", "ok")
				}else{

					//			def serie = Serie.findAll()
					//			render(view:"/serie/editarSerie.gsp", model:[serie:serie,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar!", "erro")
				}
			}
		}
	}


	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm2) {


				Serie.deleteAll(Serie.get(id))
				//def p = Serie.findAll()

				//redirect(action:"listar")
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def salvar(){ 
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Serie", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "EDUCACAO_ACADEMICO", "SERIE", "2")

			if (perm2) {


				Serie seriel = new Serie(params)


				seriel.serie = params.serie
				seriel.numeroDeVagas = Integer.parseInt(params.numeroDeVagas)
				seriel.dataDeInicio = params.dataDeInicio
				seriel.dataDeTermino = params.dataDeTermino

				if (seriel.save(flush:true)){ 
					//			def serie = Serie.findAll()
					//			render(view:"/serie/listarSerie.gsp", model:[
					//				serie:serie,
					//				ok : "Serie cadastrada com sucesso!"
					//
					//			])
					listarMensagem("Serie cadastrada com sucesso", "ok")
				}else{
					//			def serie = Serie.findAll()
					//			render(view:"/serie/listarSerie.gsp", model:[
					//				erro : "Erro ao Salvar!"
					//
					//			])
					listarMensagem("Erro ao Salvar!", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}
