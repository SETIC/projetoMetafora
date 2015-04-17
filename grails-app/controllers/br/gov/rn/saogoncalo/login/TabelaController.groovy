package br.gov.rn.saogoncalo.login

import groovy.sql.Sql

class TabelaController {

	def listar(){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Turma", act:"editarTurma"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()
			if (usuario.getPermissoes(user, pass , "educacao_academico", "turma", "1") ||(usuario.getPermissoes(user, pass, "educacao_academico", "turma", "2"))){


				def conexao = Sql.newInstance("jdbc:postgresql://localhost:5667/db_sgg_testes","admin_db_sr","bgt54rfvcde3","org.postgresql.Driver")

			}else{
				render(view:"/error403.gsp")
			}
		}
	}

	def index() {
		
	}
}