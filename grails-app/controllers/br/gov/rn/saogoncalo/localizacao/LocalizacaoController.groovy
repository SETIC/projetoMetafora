package br.gov.rn.saogoncalo.localizacao

import grails.converters.JSON
import br.gov.rn.saogoncalo.pessoa.Aluno
import br.gov.rn.saogoncalo.pessoa.Escola

class LocalizacaoController {

	def index(){
	}
	def alunos() {
		/*if((session["user"] == null) || (session["pass"] == null) ){
		 render (view:"/usuario/login.gsp", model:[ctl:"Layout", act:"index"])
		 }else{
		 def user = session["user"]
		 def pass = session["pass"]
		 def usuario = new UsuarioController()
		 if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
		 (usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {*/



		//def aluno = Aluno.findAll(" from Aluno a ", [max: 2])
		def aluno = Aluno.executeQuery(" select a from Reside r, Logradouro l, " +
				" Bairro b, Municipio m, " +
				" Estado e, Aluno a, Pessoa p  " +
				" where r.logradouro.id = l.id " +
				" and r.bairro.id = b.id  " +
				" and b.municipio.id = m.id " +
				" and e.id = m.estado.id " +
				" and a.id = r.pessoa.id " +
				" and p.id = a.id " +
				" order by a.id ", [max: 2])


		println(" Teste ---  " + aluno.cidadao.pessoaFisica.pessoa.reside.logradouro.logradouro)


		render(view:"/localizacao/georeferenciamento.gsp", model:[aluno:aluno])
		/*}else{
		 render(view:"/error403.gsp")
		 }
		 }*/
	}
	def getEndereco(){
		/*		if((session["user"] == null) || (session["pass"] == null) ){
		 render (view:"/usuario/login.gsp", model:[ctl:"Layout", act:"index"])
		 }else{
		 def user = session["user"]
		 def pass = session["pass"]
		 def usuario = new UsuarioController()
		 if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
		 (usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {*/

		//def aluno = Aluno.list(2)
		//def aluno = Aluno.findAll(" from Aluno a ", [max: 2])
		
		
/*		//codigo pra alunos
		def aluno = Aluno.executeQuery(" select a from Reside r, Logradouro l, " +
			" Bairro b, Municipio m, " +
			" Estado e, Aluno a, Pessoa p  " +
			" where r.logradouro.id = l.id " +
			" and r.bairro.id = b.id  " +
			" and b.municipio.id = m.id " +
			" and e.id = m.estado.id " +
			" and a.id = r.pessoa.id " +
			" and p.id = a.id " +
			" order by a.id ", [max: 2])
					
		println("alunos ---444 - " + aluno)
		

		def result = ["estado":aluno.cidadao.pessoaFisica.pessoa.reside.bairro.municipio.estado.estado,
			"municipio":aluno.cidadao.pessoaFisica.pessoa.reside.bairro.municipio.municipio,
			"tipo":aluno.cidadao.pessoaFisica.pessoa.reside.logradouro.tipoLogradouro.tipoLogradouro,
			"logradouro":aluno.cidadao.pessoaFisica.pessoa.reside.logradouro.logradouro,
			"numero":aluno.cidadao.pessoaFisica.pessoa.reside.numero,
			"nome":aluno.cidadao.pessoaFisica.pessoa.nome
		]

		println("Teste ---++ " + result)

		render result as JSON*/
		
		
		//codigo pra alunos
		def escola = Escola.findAll()
		
		def result = ["estado": escola.pessoaJuridica.pessoa.reside.bairro.municipio.estado.estado,
			"municipio":escola.pessoaJuridica.pessoa.reside.bairro.municipio.municipio,
			"tipo":escola.pessoaJuridica.pessoa.reside.logradouro.tipoLogradouro.tipoLogradouro,
			"logradouro":escola.pessoaJuridica.pessoa.reside.logradouro.logradouro,
			"numero":escola.pessoaJuridica.pessoa.reside.numero,
			"nome":escola.pessoaJuridica.pessoa.nome
		]

		println("Teste ---++ " + result)

		render result as JSON
		
		
		
		
		/*}else{
		 render(view:"/error403.gsp")
		 }
		 }*/
	}
}
