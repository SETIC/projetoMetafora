package br.gov.rn.saogoncalo.login
import groovy.sql.Sql

import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

import org.postgresql.Driver

class GrupoController {

	def index() {
	}

	def deletar(int id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Grupo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "GRUPO", "2") 

			if (perm2) {
				Grupo.deleteAll(Grupo.get(id))

				
				redirect(action:"listar" )
			}
		}
	}
	def salvar() {
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Grupo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "GRUPO", "2")

			if (perm2) {

				def tr = params.entrySet().findAll()
				def obj
				def esquem
				def table
				def permission

				Grupo grupo = new Grupo(params)

				if (grupo.save(flush:true)){

					def grupos = Grupo.findAll()
					render(view:"/grupo/listarGrupo.gsp", model:[grupos:grupos, ok : "Grupo cadastrado com sucesso!", perm2:perm2])
				}else{

					def grupos = Grupo.findAll()
					render(view:"/grupo/listarGrupo.gsp", model:[grupos:grupos, erro : "Erro ao Salvar!", perm2:perm2])
				}




				for (int i=0; i<tr.size();i++){


					obj = tr[i].toString()
					if (obj.substring(0,4) == ("comp") && (obj.substring( obj.size()-1 ,obj.size() ) != '0') ){
						esquem = obj.substring(4, obj.indexOf('-'))
						table = obj.substring( obj.indexOf('-')+1 ,obj.indexOf('=') )
						permission = obj.substring( obj.size()-1 ,obj.size() )

						println("Dado :" + obj )
						
						println("Esquemas: "+esquem+"\n")

						println("Tabelas: "+table+"\n")

						println("Permissoes: "+permission+"\n")



						//salvando no banco cada objeto
						Permissao p = new Permissao()
						p.permissao = permission
						p.tabela = table
						p.esquema = esquem
						p.grupo = grupo
						if (!p.save(flush:true)){

							render(view:"/grupo/listarGrupo.gsp", model:[erro : "Erro ao Salvar! (Permiss�o)", perm2:perm2])
						}


					}
				}



			}
		}
	}

	def listar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Horario", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm1 = usuario.getPermissoes(user, pass , "LOGIN", "GRUPO", "1")
			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "GRUPO", "2")

			if (perm1 || perm2) {


				def grupos = Grupo.findAll()
				def tabelas
				def schemas

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver

				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")


				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
				def sql = new Sql(conn)


				try {
					//	tabelas = sql.rows("SELECT schemaname, tablename tabela FROM pg_tables where schemaname in ('login', 'cadastro_unico_pessoal', 'educacao_academico') " +
					//			"order by schemaname")
					//	schemas = sql.rows("SELECT distinct schemaname FROM pg_tables where schemaname in ('login', 'cadastro_unico_pessoal', 'educacao_academico') " +
					//			"order by schemaname")

					tabelas = [
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"ALUNO"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"ESCOLA"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"FUNCIONARIO"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"PROFESSOR"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"SERIE"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"MATRICULA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"TURMA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"DISCIPLINA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"SALA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"HORARIO"],
						["schemaname":"LOGIN", "tabela":"USUARIO"],
						["schemaname":"LOGIN", "tabela":"GRUPO"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"ATIVIDADE"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"NOTA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"FREQUENCIA"],
						["schemaname":"ADMINISTRACAO_REGISTRO", "tabela":"LOG"],
						
						["schemaname":"CADASTRO_UNICO_PROTOCOLO", "tabela":"SETOR"],
						["schemaname":"CADASTRO_UNICO_PROTOCOLO", "tabela":"SITUACAO"],
						["schemaname":"CADASTRO_UNICO_PROTOCOLO", "tabela":"TIPO_DOCUMENTO"],
						["schemaname":"CADASTRO_UNICO_PROTOCOLO", "tabela":"TRAMITE"],
						["schemaname":"CADASTRO_UNICO_PROTOCOLO", "tabela":"PROTOCOLO"],
						

					]

					schemas = [["schemaname":"CADASTRO_UNICO_PESSOAL"], ["schemaname":"EDUCACAO_ACADEMICO"], ["schemaname":"LOGIN"], ["schemaname":"ADMINISTRACAO_REGISTRO"],  ["schemaname":"CADASTRO_UNICO_PROTOCOLO"] ]

				}catch(SQLException ex){
					println ex.getMessage()
				}
				finally {
					sql.close()
					conn.close()
				}


				render(view:"/grupo/listarGrupo.gsp", model:[grupos:grupos, tabelas:tabelas, schemas:schemas, perm2:perm2])

			}

		}
	}



	def editarGrupo(long id){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Grupo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "GRUPO", "2")

			if (perm2) {

				Grupo grupos = Grupo.get(id)

				def permissoes = Permissao.findAllByGrupo(grupos)


				//-----------


				def tabelas
				def schemas

				def driver = Class.forName('org.postgresql.Driver').newInstance() as Driver

				def props = new Properties()
				props.setProperty("user", "admin_db_sr")
				props.setProperty("password", "bgt54rfvcde3")


				def conn = driver.connect("jdbc:postgresql://192.168.1.247:5667/db_sgg_testes", props)
				def sql = new Sql(conn)


				try {
					
/*					tabelas = [
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"ALUNO"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"ESCOLA"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"FUNCIONARIO"],
						["schemaname":"CADASTRO_UNICO_PESSOAL", "tabela":"PROFESSOR"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"SERIE"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"MATRICULA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"TURMA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"DISCIPLINA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"SALA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"HORARIO"],
						["schemaname":"LOGIN", "tabela":"USUARIO"],
						["schemaname":"LOGIN", "tabela":"GRUPO"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"ATIVIDADE"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"NOTA"],
						["schemaname":"EDUCACAO_ACADEMICO", "tabela":"FREQUENCIA"],
						["schemaname":"ADMINISTRACAO_REGISTRO", "tabela":"RELATORIOS"]
						
						
					]

					schemas = ["CADASTRO_UNICO_PESSOAL", "EDUCACAO_ACADEMICO", "LOGIN", "ADMINISTRACAO_REGISTRO"]*/
					
							tabelas = sql.rows(" SELECT upper(pg.schemaname) as schemaname, upper(pg.tablename) as tabela, ( " +

							"case " +

							"when (select p.permissao from login.permissao p " +
							"where upper(pg.tablename) = p.tabela " +
							" and upper(pg.schemaname) = p.esquema " +
							" and p.grupo_id = "+id+" ) = '1' then '1' " +

							"when (select p.permissao  from login.permissao p " +
							" where upper(pg.tablename) = p.tabela " +
							"   and upper(pg.schemaname) = p.esquema " +
							"	   and p.grupo_id = "+id+" ) = '2' then '2' " +

							"else '0' end )as permissao, " +

							"(select p.id  from login.permissao p " +
							"	where upper(pg.tablename) = p.tabela " +
							"  and upper(pg.schemaname) = p.esquema " +
							"  and p.grupo_id = "+id+") as permissao_id " +

							"  FROM pg_tables pg " +
								 " where upper(schemaname) in ('LOGIN', 'CADASTRO_UNICO_PESSOAL', 'EDUCACAO_ACADEMICO', 'ADMINISTRACAO_REGISTRO', 'CADASTRO_UNICO_PROTOCOLO') " + 
							" and upper(tablename) in ('ALUNO', 'PROFESSOR', 'ESCOLA', 'FUNCIONARIO','DISCIPLINA', 'HORARIO', 'MATRICULA', 'SALA', 'SERIE', 'TURMA', 'GRUPO', 'USUARIO', 'ATIVIDADE', 'NOTA', 'FREQUENCIA', 'LOG', 'SETOR', 'SITUACAO', 'TIPO_DOCUMENTO', 'TRAMITE', 'PROTOCOLO' ) " +
							" order by pg.schemaname");

					schemas = sql.rows("SELECT distinct upper(schemaname) as schemaname FROM pg_tables where schemaname in ('login', 'cadastro_unico_pessoal', 'educacao_academico', 'administracao_registro', 'cadastro_unico_protocolo') " +
							"order by schemaname")

				}catch(SQLException ex){
					println ex.getMessage()
				}
				finally {
					sql.close()
					conn.close()
				}


				render (view:"/grupo/editarGrupo.gsp", model:[grupos:grupos, permissoes:permissoes, tabelas:tabelas, schemas:schemas])


			}
		}
	}
	def atualizar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/usuario/login.gsp", model:[ctl:"Grupo", act:"listar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			def usuario = new UsuarioController()

			def perm2 = usuario.getPermissoes(user, pass, "LOGIN", "GRUPO", "2")

			if (perm2) {

				def tr = params.entrySet().findAll()
				def obj
				def esquem
				def table
				def permission
				def permissao_id

				def grupo = Grupo.get(Integer.parseInt(params.gruposid))

				grupo.nome = params.nome
				grupo.descricao = params.descricao

				if (grupo.save(flush:true)){

					def grupos = Grupo.findAll()
					render(view:"/grupo/listarGrupo.gsp", model:[grupos:grupos, ok : "Grupo atualizado com sucesso!", perm2:perm2])
				}else{

					def grupos = Grupo.findAll()
					render(view:"/grupo/listarGrupo.gsp", model:[grupos:grupos, erro : "Erro ao Atualizar!", perm2:perm2])
				}

				for (int i=0; i<tr.size();i++){


					obj = tr[i].toString()
					if (obj.substring(0,4) == ("comp") ){
						esquem = obj.substring(4, obj.indexOf('-'))
						table = obj.substring( obj.indexOf('-')+1 ,obj.indexOf('=') )
						permission = obj.substring( obj.indexOf('#')-1 ,obj.indexOf('#') )
						permissao_id = obj.substring(obj.indexOf('#')+1,obj.size())

				
						//delete
						
						println ("PERM ID delete --- " +permissao_id + "TABLE ----" +  table + "ESQ ----" +  esquem)
						
						if (permissao_id != '') {
							def perm = Permissao.get(Long.parseLong(permissao_id))
							if (perm.permissao != '0' && permission == '0'){

								Permissao.deleteAll(Permissao.get(Long.parseLong(permissao_id)))

							}

						}

						//update
						if (permission != '0' && permission != '' && permissao_id != '' && permissao_id != '0' ){

							def p = Permissao.get(Long.parseLong(permissao_id))

							if (p.tabela != '') {

								p.permissao = permission
								p.tabela = table
								p.esquema = esquem
								p.grupo = grupo
								if (!p.save(flush:true)){

									render(view:"/grupo/listarGrupo.gsp", model:[erro : "Erro ao Salvar! (Permissão)", , perm2:perm2])
								}
							}


						}else{


							//insert
							if (permission != "" && permission != "0") {
								def per = new Permissao()
								per.permissao = permission
								per.tabela = table
								per.esquema = esquem
								per.grupo = grupo
								if (!per.save(flush:true)){

									render(view:"/grupo/listarGrupo.gsp", model:[erro : "Erro ao Salvar!", perm2:perm2])
								}

							}
						}
					}
				}
			}
		}
	}

} 
