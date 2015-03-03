package br.gov.rn.saogoncalo.localizacao

import grails.converters.JSON
import br.gov.rn.saogoncalo.login.UsuarioController
import br.gov.rn.saogoncalo.pessoa.Aluno

class LocalizacaoController {

	def index(){
	}
	def alunos() {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Layout", act:"index"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
			(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {


				def aluno = Aluno.list()

				render(view:"/localizacao/georeferenciamento.gsp", model:[aluno:aluno])
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
	def getEndereco(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Layout", act:"index"])
		}else{
			def user = session["user"]
			def pass = session["pass"]
			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||
			(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))) {

				def aluno = Aluno.list(2)

				def result = ["estado":aluno.cidadao.pessoaFisica.pessoa.reside.bairro.municipio.estado.estado,
					"municipio":aluno.cidadao.pessoaFisica.pessoa.reside.bairro.municipio.municipio,
					"tipo":aluno.cidadao.pessoaFisica.pessoa.reside.logradouro.tipoLogradouro.tipoLogradouro,
					"logradouro":aluno.cidadao.pessoaFisica.pessoa.reside.logradouro.logradouro,
					"numero":aluno.cidadao.pessoaFisica.pessoa.reside.numero,
					"nome":aluno.cidadao.pessoaFisica.pessoa.nome
				]
				render result as JSON
			}else{
				render(view:"/error403.gsp")
			}
		}
	}
}
