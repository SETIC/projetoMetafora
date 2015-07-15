package br.gov.rn.saogoncalo.pessoa

import br.gov.rn.saogoncalo.organizacao.Cargo
import br.gov.rn.saogoncalo.organizacao.Lotacao
import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

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


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm1 || perm2){

				def funcionario
				def lotacao
				def cargo

				funcionario = Funcionario.executeQuery("select f from Pessoa p, Funcionario f,Lotacao l,Cargo c " +
						" where p.id = f.id "+
						" and l.cargo.id = c.id "+
						" and f.id = l.funcionario.id")


				println("aaaaaaaaaaaa"+funcionario)

				render (view:"/funcionario/gerarRelatorio.gsp", model:[funcionario:funcionario,lotacao:lotacao,cargo:cargo])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}



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

				def parametro = params.pesquisa
				if (session["escid"] == 0){
					funcionarios = Funcionario.executeQuery("select a from Pessoa as p , Funcionario as a "+
							"where p.id = a.id and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")

					//cargos = Cargo.findAll()
					print("printcargos "+ cargos )

				}else{
					funcionarios = Funcionario.executeQuery("select a from Pessoa as p , Funcionario as a "+
							"where p.id = a.id and p.escid = "+session["escid"]+" and (p.nome like '%"+parametro.toUpperCase()+"%' or p.cpfCnpj ='"+parametro+"')")
				}
				cargos=Cargo.findAll()

				cargos= Cargo.findAll()

				render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos,perm2:perm2])
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
				
				cargo=Cargo.findAll()

				lotacao = Lotacao.findByFuncionario(funcionarios)
				
				def charManha = ""
				def charTarde = ""
				def charNoite = ""
				
				if(lotacao == null) {

					println ("lotacao "+lotacao)
					
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


				render (view:"/funcionario/editarFuncionario.gsp", model:[funcionarios:funcionarios,lotacao:lotacao,cargo:cargo,charManha:charManha,charTarde:charTarde,charNoite:charNoite])
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
				cidadao.profissao = params.profissao

				def funcionario = Funcionario.get(params.id)
				funcionario.cargaHoraria = params.cargaHoraria
				funcionario.matricula = params.matricula


				def funcionarios = Funcionario.findAll()


				if(funcionario.save(flush:true)){

					//			render(view:"/funcionario/listarFuncionario.gsp", model:[
					//				funcionarios:funcionarios,
					//				ok : "Funcionário atualizado com sucesso!"
					//
					//			])

					listarMensagem("Funcionário atualizado com sucesso!", "ok")
				}else{
					//			render(view:"/funcionario/editarFuncionario.gsp", model:[funcionarios:funcionarios,
					//				erro : "Erro ao atualizar!"
					//			])
					listarMensagem("Erro ao atualizar!", "erro")
				}



				Lotacao lotacao = Lotacao.findByFuncionario(funcionario)
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
			}
		}



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

			cargos=Cargo.findAll()
			println("cargos "+ cargos)



			render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios,cargos:cargos, perm2:perm2])
		}else{
			lotacao.vinculo=params.vinculo
			lotacao.cargo=Cargo.get(params.cargo)
			lotacao.funcao=params.funcao
			if (lotacao.save(flush:true)){
				println("Lotacao --- " + lotacao)
			}else{
				listarMensagem("Erro ao atualizar lotação!", "erro")
			}
		}
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

			if (perm1 || perm2) {

				if (session["escid"] == "0") {
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id ")
				}else{
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				}


				cargos=Cargo.findAll()
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


			def perm1 = usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "FUNCIONARIO", "2")
			def funcionarios

			if (perm1 || perm2) {

				if (session["escid"] == "0") {
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id ")
				}else{
					funcionarios = Funcionario.executeQuery(" select f from Pessoa as p, Funcionario as f where p.id = f.id and p.escid = ?",[session["escid"]])
				}

				def cargos = Cargo.findAll()

				if (tipo == "ok")

					render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios, ok:msg, perm2:perm2, cargos:cargos])
				else
					render(view:"/funcionario/listarFuncionario.gsp", model:[funcionarios:funcionarios, erro:msg, perm2:perm2, cargos:cargos])
			}else{
				render(view:"/error403.gsp")
			}
		}
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
				pessoa.nome=params.nome.toString().toUpperCase()

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
						Cargo cargo= Cargo.get(params.cargoId)

						Lotacao lotacao= new Lotacao()
						lotacao.cargo = cargo
						lotacao.funcionario=funcionario
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
						lotacao.dataInicio=dataAtual
						lotacao.dataTermino=dataAtual
						lotacao.save(flush:true)
						println("opcao1 "+params.opcao1)
						println("opcao2 "+params.opcao2)
						println("opcao3 "+params.opcao3)

						println("turnoCompleto"+turnoCompleto)

						//				def funcionarios = Funcionario.findAll()
						//				render(view:"/funcionario/listarFuncionario.gsp", model:[
						//					funcionarios:funcionarios,
						//					ok : "Funcionário cadastrado com sucesso!"
						//
						//				])
						listarMensagem("Funcionário cadastrado com sucesso!","ok")
					}else{

						//				def funcionarios = Funcionario.findAll()
						//				render(view:"/funcionario/listarFuncionario.gsp", model:[
						//					funcionarios:funcionarios,
						//					erro : "Erro ao Salvar Funcionário!"
						//				])
						listarMensagem("Erro ao Salvar Funcionário!","erro")
					}
				}else{


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
							Cargo cargo= Cargo.get(params.cargoId)

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
							listarMensagem("Funcionário cadastrado com sucesso!","ok")
						}else{

							//				def funcionarios = Funcionario.findAll()
							//				render(view:"/funcionario/listarFuncionario.gsp", model:[
							//					funcionarios:funcionarios,
							//					erro : "Erro ao Salvar Funcionário!"
							//				])
							listarMensagem("Erro ao Salvar Funcionário!","erro")
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
						listarMensagem("Erro ao Salvar Funcionário!","erro")
					}
				}
			}
		}
	}
}