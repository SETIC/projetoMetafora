package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.login.UsuarioController

class EscolaController {

	def index() {
	}
	def listar (){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{

			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ESCOLA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm1 || perm2) {
				def escolas = Escola.findAll()
				render (view:"/escola/listarEscola.gsp", model:[escolas:escolas, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def listarMensagem (String msg, String tipo){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ESCOLA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm1 || perm2) {
				def escolas = Escola.findAll()
				//render (view:"/escola/listarEscola.gsp", model:[escolas:escolas])
				if (tipo == "ok")

					render (view:"/escola/listarEscola.gsp", model:[escolas:escolas, ok:msg, perm2:perm2])
				else
					render (view:"/escola/listarEscola.gsp", model:[escolas:escolas, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	
	def editarEscola(long id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm2) {


				Escola escolas = Escola.get(id)
				render (view:"/escola/editarEscola.gsp", model:[escolas:escolas])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm2) {

				Pessoa.deleteAll(Pessoa.get(id))

				redirect(action:"listarMensagem", params:[msg:"deletado com sucesso!", tipo: "ok" ]  )
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def verInfoEscola (long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ESCOLA", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm1 || perm2) {

				Escola escolas = Escola.get(id)

				render (view:"/escola/verInfoEscola.gsp", model:[escolas:escolas])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			
		def user = session["user"]
		def pass = session["pass"]
		
			def usuario = new UsuarioController()


			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm2) {
				def pessoa = Pessoa.get(params.id)

				pessoa.nome = params.nome
				pessoa.dataDeNascimento = params.dataDeNascimento
				pessoa.cpfCnpj = params.cpfCnpj

				def pessoaJuridica = PessoaJuridica.get(params.id)
				pessoaJuridica.razaoSocial = params.razaoSocial
				pessoaJuridica.inscricaoEstadual = params.inscricaoEstadual

				def escola = Escola.get(params.id)
				escola.inepDaEscola = params.inepDaEscola

				def escolas = Escola.findAll()


				if(escola.save(flush:true)){

					//			render(view:"/escola/listarEscola.gsp", model:[
					//				escolas:escolas,
					//				ok : "Escola atualizada com sucesso!"
					//
					//			])
					listarMensagem("Escola atualizada com sucesso!", "ok")
				}else{
					//			render(view:"/escola/editarEscola.gsp", model:[escolas:escolas,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar!", "erro")
				}
			}
		}
	}


	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Escola", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ESCOLA", "2")


			if (perm2)
			{

				Pessoa pessoa = new Pessoa(params)



				if (pessoa.save(flush:true)){
					pessoa.errors.each{ println it }

					PessoaJuridica pessoaJuridica = new PessoaJuridica(params)
					pessoaJuridica.pessoa = pessoa
					pessoaJuridica.save(flush:true)
					pessoaJuridica.errors.each{ println it }

					Escola escola = new Escola(params)
					escola.pessoaJuridica = pessoaJuridica

					if(escola.save(flush:true)){
						escola.errors.each{ println it }

						//				def escolas = Escola.findAll()
						//
						//				render(view:"/escola/listarEscola.gsp", model:[
						//					escolas:escolas,
						//					ok : "Escola cadastrada com sucesso!"
						//
						//				])
						listarMensagem("Escola cadastrada com sucesso!", "ok")
					}else{
						//				def escolas = Escola.findAll()
						//				render(view:"cadastrar", model:[
						//					erro : "Erro ao Salvar!"
						//				])
						listarMensagem("Erro ao Salvar!", "erro")
					}
				}else{
					def erros
					pessoa.errors.each{ erros = it }

					if  (erros.toString().contains("Pessoa.cpfCnpj.unique.error")){
						erros = "CNPJ J� est� cadastrado no sistema"
					}

					//			def escolas = Escola.findAll()
					//			render(view:"/escola/listarEscola.gsp", model:[
					//				escolas:escolas,
					//				erro : erros
					//			])
					listarMensagem("Erro ao Salvar!", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}