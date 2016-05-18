package br.gov.rn.saogoncalo.login

import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Pessoa



class UsuarioController {

	def index() {
	}

	def login() {
		render(view:"/usuario/login.gsp")
	}

	def static usuario = null
	def static senha  = null
	def static userid = null


	def autenticar(){

		def user = params.usuario
		def pass = params.senha.encodeAsMD5()


		if (verificarAutenticacao(user, pass)) {
			redirect(controller:params.ctl, action:params.act)
		}else{
			render(view:"/usuario/login.gsp", model:[erro:"O usuário ou a senha inseridos estão incorretos."])
		}
	}

	def verificarAutenticacao(user, pass) {

		def usuarioA = Usuario.findByUsernameAndSenha(user, pass)


		if(usuarioA == null){
			return false
		}else{

			def escolaA = Escola.findById(usuarioA.pessoa.escid)
			session.maxInactiveInterval = 10000
			session["user"] = user
			session["pass"] = pass
			session["usid"] = usuarioA.id
			session["pesid"] = usuarioA.pessoa.id
			session["pesnome"] = usuarioA.pessoa.nome
			session["escid"] = usuarioA.pessoa.escid
			session["master"] = usuarioA.grupoUsuario.grupo.master //rever pra a situação de ter mais de um grupo



			if (usuarioA.pessoa.escid == 0)
			{
				//aqui
				session["escname"] = "Administração"
			}else{
				session["escname"] = escolaA.pessoaJuridica.pessoa.nome
			}



			//println("Escola - " + escolaA.pessoaJuridica.pessoa.nome)
			//println("Nome Pessoa - " + usuarioA.pessoa.nome)

			usuario = user
			senha = pass
			userid = usuarioA.id

			return true
		}
	}


	def verificarLogin() {
		def usuario = params.usuario
		def senha = params.senha
		def usuarioA = Usuario.findByUsernameAndSenha(usuario, senha)
		if(usuarioA == null){

			render(view:"/usuario/validarUsuario.gsp", model:[erro:"O usuário ou a senha inseridos estão incorretos."])
		}else{
			render(view:"/index.gsp")
		}
	}


	def listar(){


		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "LOGIN", "USUARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm1 || perm2){


				def usuarios
				def pessoas = Pessoa.executeQuery("select p from Pessoa as p")
				//def pessoas = Pessoa.findAll()
				
				Usuario u = Usuario.findById(session["usid"])
				
				def escolas
				if(u.pessoa.escid == 0){
					escolas = Escola.executeQuery(" select e from Escola e, Pessoa p " +
												  "  where p.id = e.id and p.status = 'Ativo' ")
					usuarios = Usuario.findAll()
				}else{
					escolas = Escola.findById(u.pessoa.escid)
					usuarios = Usuario.executeQuery(" select u from Usuario u, Pessoa p " +
													"  where p.id = u.pessoa.id " +
													"    and p.escid = " + session["escid"] )
				}  
				
				

				render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, pessoas:pessoas, escolas:escolas, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	

	def listarMensagem(String msg, String tipo){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "LOGIN", "USUARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm1 || perm2){

								def usuarios
				def pessoas = Pessoa.executeQuery("select p from Pessoa as p")
				//def pessoas = Pessoa.findAll()
				
				Usuario u = Usuario.findById(session["usid"])
				
				def escolas
				if(u.pessoa.escid == 0){
					escolas = Escola.executeQuery(" select e from Escola e, Pessoa p " +
												  "  where p.id = e.id and p.status = 'Ativo' ")
					usuarios = Usuario.findAll()
				}else{
					escolas = Escola.findById(u.pessoa.escid)
					usuarios = Usuario.executeQuery(" select u from Usuario u, Pessoa p " +
													"  where p.id = u.pessoa.id " +
													"    and p.escid = " + session["escid"] )
				} 
				
				if (tipo == "ok")
					render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, pessoas:pessoas, ok:msg, perm2:perm2])
				else
					render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, pessoas:pessoas, erro:msg, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def deletar(int id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm2){
				Usuario.deleteAll(Usuario.get(id))

				//redirect(action:"listarUsuario" )
				redirect(action:"listarMensagem", params:[msg:"Deletado com sucesso!", tipo:"ok"])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def editarUsuario(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm2){

				def usuarios = Usuario.get(id)
				def pessoas = Pessoa.get(usuarios.pessoaId)
				def grupos = Grupo.findAll()

				def grupoUsado = GrupoUsuario.findAllByUsuario(Usuario.get(id))
				println(" Gruopo Usado - " + grupoUsado.grupoId + " grupos - " + grupos.id)
				
				def escola = Escola.get(pessoas.escid)


				render (view:"/usuario/editarUsuario.gsp", model:[usuarios:usuarios, pessoas:pessoas, grupos:grupos, grupoUsado:grupoUsado, escola:escola])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def atualizar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def userPerm = new UsuarioController()

			def perm2 = userPerm.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm2){

				println("Params - " + params)
				def usuarios = Usuario.findAll()

				def usuario = Usuario.get(params.idUsuario)

				if (params.novaSenha != "") {
					usuario.senha = params.novaSenha.encodeAsMD5()
				}


				if(!usuario.save(flush:true)){
					render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, erro:"Erro ao salvar usuário.", perm2:perm2])
				}

				ArrayList gruposUsadosBanco = new ArrayList()
				ArrayList gruposUsadosGSP = new ArrayList()
				
				gruposUsadosBanco = GrupoUsuario.findAllByUsuario(Usuario.get(Integer.parseInt(params.idUsuario)))
				gruposUsadosGSP.addAll(params.grupoUsuario) 
				

				println("Grupos Usados Banco - " + gruposUsadosBanco.grupo.id)
				println("Grupos Usados GSP - " + gruposUsadosGSP)


				int contem = 0
				ArrayList listaDelete = new ArrayList()
				ArrayList listaInsert = new ArrayList()

				//Delete
				for(int i=0;i<gruposUsadosBanco.size();i++){
					for (int cont=0; cont<gruposUsadosGSP.size(); cont++){
						if(gruposUsadosBanco[i].grupo.id.toString() == gruposUsadosGSP[cont]){
							contem = contem + 1
							
						}
					}
					if(contem == 0){
						listaDelete.add(gruposUsadosBanco[i].id.toString())
						
					}
					contem = 0
				}
				def grupoUsuario
				if (listaDelete.size > 0){
					if (listaDelete.size == 1){
						grupoUsuario = GrupoUsuario.get(Integer.parseInt(listaDelete[0].toString()))
						GrupoUsuario.deleteAll(grupoUsuario)
						
					}else{
						for (int cont2=0; cont2<listaDelete.size(); cont2++){
							println("ListaDelete 2 -- " + listaDelete)
							grupoUsuario = GrupoUsuario.get(listaDelete[cont2].toString().toInteger())
							GrupoUsuario.deleteAll(grupoUsuario)
						}
					}
				}
				//final Delete


				//insert
				
				println("gruposUsadosGSP -- " + gruposUsadosGSP.size() + " tipo " + gruposUsadosGSP.getClass().getName() )
				
				for(int i=0;i<gruposUsadosGSP.size();i++){
					for (int cont=0; cont<gruposUsadosBanco.size(); cont++){
						if(gruposUsadosGSP[i].toString() == gruposUsadosBanco[cont].grupo.id.toString()){
							contem = contem + 1
						}
					}

					if(contem == 0){
						listaInsert.add(gruposUsadosGSP[i])
					}
					contem = 0
				}

				
				println("ListaInsert -- " + listaInsert + " size -- " +listaInsert.size() )
				if (listaInsert.size > 0){
					if (listaInsert.size == 1){
					
						GrupoUsuario gpu = new GrupoUsuario()
						gpu.grupo = Grupo.get(listaInsert[0].toString().toInteger())
						gpu.usuario = usuario
						gpu.save(flush:true)
					}else{

						for (int cont2=0; cont2<listaInsert.size(); cont2++){

							GrupoUsuario gpu = new GrupoUsuario()
							gpu.grupo = Grupo.get(listaInsert[cont2].toString().toInteger())
							gpu.usuario = usuario
							gpu.save(flush:true)
						}
					}
				}

				//final Insert




				//deletar
				/*	for(int i=0;i<gruposUsadosBanco.size();i++){
				 String str = gruposUsadosBanco[i].grupo.id
				 if (gruposUsadosGSP.contains(str)){
				 //if (str in gruposUsadosGSP){
				 println("str aqui - " + str)
				 //aqui
				 }
				 else{
				 def gr = GrupoUsuario.get(gruposUsadosBanco[i].id)
				 GrupoUsuario.deleteAll(gr)
				 }
				 println(gruposUsadosBanco[i].grupoId)
				 } */



				/*
				 //inserir
				 for(int j=0;j<gruposUsadosGSP.size();j++){
				 int str = gruposUsadosGSP[j].toString().toInteger()
				 if (gruposUsadosBanco.grupoId.contains(Integer.parseInt(gruposUsadosGSP[j])) ){
				 //aqui
				 }
				 else{
				 GrupoUsuario gpu = new GrupoUsuario()
				 gpu.grupo = Grupo.get(gruposUsadosGSP[j])
				 gpu.usuario = usuario
				 gpu.save(flush:true)
				 }
				 println(gruposUsadosGSP[j])
				 }
				 //render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, ok:"Salvo com sucesso"]) */
				listarMensagem("Salvo com sucesso", "ok")

			}
		}
	}

	def salvar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Usuario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "USUARIO", "2")

			if (perm2){

				Usuario usuarioB = new Usuario()

				usuarioB.username = params.username
				usuarioB.senha = params.senha.encodeAsMD5()

				println("parametros aqui " + params)

				def pessoa = Pessoa.get(params.pessoa)
				pessoa.escid = params.escola.toString().toInteger()
				
				if (pessoa.save(flush:true)){
				
				
						usuarioB.pessoa = pessoa
						def usuarios = Usuario.findAll()
		
						if(usuarioB.save(flush:true))
							//render(view:"/usuario/listarUsuario.gsp")
							listarMensagem("Salvo com sucesso", "ok")
						else
							//render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios, erro:"Erro ao salvar usuário."])
							listarMensagem("Erro ao salvar usuário.", "erro")

		
						GrupoUsuario gu
						Grupo grupo
						
						//aqui
						ArrayList gruposUsadosGSP = new ArrayList()
						gruposUsadosGSP.addAll(params.grupo)
		
						for (var in gruposUsadosGSP) {
							gu = new GrupoUsuario()
							grupo = new Grupo()
							grupo = Grupo.get(var)
							gu.usuario = usuarioB
							gu.grupo = grupo
							if(gu.save(flush:true))
								println "salvou"
							else
								println " Erro no salvar grupo usuário"
							gu.errors.println {it}
						}
		
						//render(view:"/usuario/listarUsuario.gsp", model:[usuarios:usuarios,ok:"Salvo com sucesso"])
						listarMensagem("Salvo com sucesso", "ok")

				
			}
				

			}else{
				render(view:"/error403.gsp")
			}

		}
	}


	def deslogar(){
		session["user"] = null
		session["pass"] = null
		session["usid"] = null
		session["pesid"] = null
		session["escid"] = null
		session["escname"] = null


		redirect(controller:"Usuario", action:"login")
	}


	def static getGrupos(usuario, senha){

		def user = Usuario.findByUsernameAndSenha(usuario, senha)

		def grupos = GrupoUsuario.findAllByUsuario(user)

		return grupos.grupo.id
	}

	def static getPermissoes(usuario, senha, sch, tab, pe){

		def permissoes = []
		def grupos = getGrupos(usuario, senha)

		def permissaoU

		for (grupoId in grupos) {
			def grupo = Grupo.get(grupoId)
			def perm = Permissao.findAllByGrupo(grupo)

			for (permi in perm) {

				def schema = permi.esquema
				def tabela = permi.tabela
				def per = permi.permissao

				permissaoU = [schema, tabela, per]

				def permissao = permissaoU
				permissoes.add(permissao)
				permissao = []
			}

		}
		//	println "PERMISSÕES - " + permissoes
		def ver = [sch, tab, pe]
		//	println "PERMISÃO ENVIADA - " +  ver

		if (permissoes.contains(ver))
			return true
		else
			return false
	}


	def getAllPermissoes(){

		def permissoes = []
		def grupos = getGrupos(session["user"], session["pass"])

		def permissaoU

		for (grupoId in grupos) {
			def grupo = Grupo.get(grupoId)
			def perm = Permissao.findAllByGrupo(grupo)

			for (permi in perm) {

				def schema = permi.esquema
				def tabela = permi.tabela
				def per = permi.permissao

				permissaoU = [schema, tabela, per]

				def permissao = permissaoU
				permissoes.add(permissao)
				permissao = []
			}

		}

		return permissoes

	}

}
