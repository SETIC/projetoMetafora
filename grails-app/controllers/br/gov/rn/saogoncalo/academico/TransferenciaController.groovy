package br.gov.rn.saogoncalo.academico
import grails.converters.JSON
import br.gov.rn.saogoncalo.administracaoregistro.AdministracaoController
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Escola
import br.gov.rn.saogoncalo.pessoa.Pessoa

class TransferenciaController {

	def index() {
	}


	def listar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm1 || perm2) {
				def sessaoEscId = session["escid"]

				//def idAlunos = Aluno.findAll()

				def alunos = Pessoa.findAll("from Pessoa as p where status='Em Transferência' and" +
						"(p.escid = :sessaoEscId or p.escIdDestino = :sessaoEscId)",
						[sessaoEscId:sessaoEscId])


				def escolas = Escola.executeQuery("select e from Escola as e, Pessoa as p where "+
						"p.id = e.id and p.status = 'Ativo'")


				render (view:"/transferencia/listarTransferencia.gsp",
				model:[alunos:alunos, escolas:escolas, sessaoEscId:sessaoEscId, perm2:perm2])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def listarMensagem(String msg, String tipo) {

	if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Matricula", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")

			if (perm1 || perm2) {

				def alunos = Aluno.executeQuery(" select a from Pessoa as p, Aluno as a where p.id = a.id and p.escid = ?",[session["escid"]])

				//render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos])
				if (tipo == "ok")
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, ok:msg, perm2:perm2])
				else
					render (view:"/aluno/listarAluno.gsp", model:[alunos:alunos, erro:msg, perm2:perm2])

			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def concluirTransferencia(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")) {

				def aluno = Pessoa.get(params.idAluno)

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def mat = Matricula.executeQuery(
						" select m from Matricula m, Aluno a, "+
						"               Pessoa p, Turma t "+
						" where a.id = m.aluno.id "+
						" and a.id = p.id "+
						" and t.id = m.turma.id "+
						" and t.escola.id = ? "+
						" and t.anoLetivo = ? "+
						" and p.id = ? " +
						" and m.status = 'Ativo' ", [aluno.escid.toLong(), ano, aluno.id])


				if (mat != []) {

					def matricula = Matricula.get(mat.id)
					matricula.status = "Inativo"
					if(!matricula.save(flush:true)){
						listarMensagem("Erro ao transferir (Desativar Matricula) ", "erro")
					}
				}

				println("idEscola ---- " + params.idEscola)

				int t = Integer.parseInt(params.idEscola)

				aluno.escIdDestino = t
				aluno.status = 'Em Transferência'

				if(aluno.save(flush:true)){
					
					def date = new Date()
					AdministracaoController adm = new AdministracaoController()
					adm.salvaLog(session["usid"].toString().toInteger(), " tranferencia concluida " + aluno.id.toString(),"transferencia ", "Aluno", date)
					
					listarMensagem("Solicitação enviada, aguardando aprovação da escola de destino", "ok")
				}else{

					listarMensagem("Erro ao enviar solicitação de transferência", "erro")
				}
			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def aceitarTransferencia(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")) {

				def aluno = Pessoa.get(Integer.parseInt(params.id))

				aluno.status = 'Ativo'
				aluno.escid = session["escid"]
				aluno.escIdDestino = 0

				aluno.save(flush:true)
				listar()
				
				//log
				def date = new Date()
				AdministracaoController adm = new AdministracaoController()
				adm.salvaLog(session["usid"].toString().toInteger(), "tranferencia aceita " + aluno.id.toString(),"cadastro", "Aluno", date)
				
				
			}else{
				render(view:"/error403.gsp")
			}
		}
	}


	def cancelarTransferencia(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Aluno", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "CADASTRO_UNICO_PESSOAL", "ALUNO", "2")) {


				def aluno = Pessoa.get(Integer.parseInt(params.id))

				Calendar ca = Calendar.getInstance()
				int ano = ca.get(Calendar.YEAR)

				def mat = Matricula.executeQuery(
						" select m from Matricula m, Aluno a, "+
						"               Pessoa p, Turma t "+
						" where a.id = m.aluno.id "+
						" and a.id = p.id "+
						" and t.id = m.turma.id "+
						" and t.escola.id = ? "+
						" and t.anoLetivo = ? "+
						" and p.id = ? " +
						" and m.status = 'Inativo' ", [aluno.escid.toLong(), ano, aluno.id])


				if (mat != []) {

					def matricula = Matricula.get(mat.id)
					matricula.status = "Ativo"
					if(!matricula.save(flush:true)){
						listarMensagem("Erro ao Cancelar transferência (Reativar Matricula) ", "erro")
					}
				}


				aluno.status = 'Ativo'
				aluno.escIdDestino = 0

				aluno.save(flush:true)

				listar()
			}else{
				render(view:"/error403.gsp")
			}
		}
		
	}
	def  getMatriculaByIdParaRelatorio(long id){
		
		def matricula = Matricula.get(id)
		
		def result = ["nomeAluno":matricula.aluno.cidadao.pessoaFisica.pessoa.nome, "serie":matricula.turma.serie.serie,
			"turma":matricula.turma.turma, "anoLetivo": matricula.turma.anoLetivo]
		
		render( result as JSON)
		
		}
	
}
