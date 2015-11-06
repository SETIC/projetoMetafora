package br.gov.rn.saogoncalo.layout

import br.gov.rn.saogoncalo.login.UsuarioController

class BuildLeftMenuController {

	def index() { }

	def montarMenu(){

		def usuario = new UsuarioController()

		def permissoes = usuario.getAllPermissoes()

		render  buildPessoalMenu(permissoes) +
				buildAcademicoMenu(permissoes) +
				buildProfessorMenu(permissoes)+
				buildRelatorioFuncionarioMenu(permissoes)+
				buildProtocoloMenu(permissoes)
	}

	def buildPessoalMenu(perm){

		def menu = '';
		def verificador = false

		menu = '<li class="treeview"> '+
				'<a href="#"> '+
				'<i class="fa fa-users"></i> '+
				'<span>Pessoal</span> '+
				'<i class="fa fa-angle-left pull-right"></i> '+
				'</a> '+
				'<ul class="treeview-menu"> '

		if (verificaPerm('CADASTRO_UNICO_PESSOAL', 'ALUNO', perm)){
			menu +=' <li><a href="/projetoMetafora/Aluno/listar" ><i class="fa fa-graduation-cap"></i> Alunos</a></li>'
			verificador = true
		}

		if (verificaPerm('CADASTRO_UNICO_PESSOAL', 'ESCOLA', perm)){
			menu +='<li><a href="/projetoMetafora/Escola/listar" ><i class="fa fa-university"></i> Escolas</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PESSOAL', 'FUNCIONARIO', perm)){
			menu +='<li><a href="/projetoMetafora/Funcionario/listar" ><i class="fa fa-male"></i> Funcionários</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PESSOAL', 'PROFESSOR', perm)){
			menu +='<li><a href="/projetoMetafora/Professor/listar"><i class="fa fa-user"></i> Professores</a></li>'
			verificador = true
		}

		menu +='</ul> '  +
				' </li> '

		if (!verificador)
			menu = ""

		return menu
	}

	def buildAcademicoMenu(perm){

		def menu = '';
		def verificador = false

		menu = '<li class="treeview"> ' +
				'<a href="#"> '+
				'<i class="fa fa-book"></i> '+
				'<span>Acadêmico</span> '+
				'<i class="fa fa-angle-left pull-right"></i>' +
				'</a> '+
				'<ul class="treeview-menu"> '

		if (verificaPerm('EDUCACAO_ACADEMICO', 'DISCIPLINA', perm)){
			menu += '<li><a href="/projetoMetafora/Disciplina/listar"><i class="fa fa-file-text-o"></i> Disciplinas</a></li> '
			verificador = true
		}
		if (verificaPerm('EDUCACAO_ACADEMICO', 'HORARIO', perm)){
			menu +=' <li><a href="/projetoMetafora/Horario/listar"><i class="fa fa-clock-o"></i> Horários</a></li> '
			verificador = true
		}
		if (verificaPerm('EDUCACAO_ACADEMICO', 'MATRICULA', perm)){
			menu +=' <li><a href="/projetoMetafora/Matricula/listar"><i class="fa fa-list-alt"></i> Matriculas</a></li> '
			verificador = true
		}
		if (verificaPerm('EDUCACAO_ACADEMICO', 'SALA', perm)){
			menu +=' <li><a href="/projetoMetafora/Sala/listar"><i class="fa fa-home"></i> Salas</a></li> '
			verificador = true
		}
		if (verificaPerm('EDUCACAO_ACADEMICO', 'SERIE', perm)){
			menu +=' <li><a href="/projetoMetafora/Serie/listar"><i class="fa fa-signal"></i> Series</a></li> '
			verificador = true
		}
		if (verificaPerm('EDUCACAO_ACADEMICO', 'TURMA', perm)){
			menu +='  <li><a href="/projetoMetafora/Turma/listar"><i class="fa fa-sitemap"></i> Turmas</a></li> '
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PESSOAL', 'ALUNO', perm)){
			menu +=' <li><a href="/projetoMetafora/Transferencia/listar" ><i class="glyphicon glyphicon-transfer"></i> Transferência</a></li> '
			verificador = true
		}

		menu +='</ul> '  +
				' </li> '

		if (!verificador)
			menu = ""

		return menu
	}

	def buildProfessorMenu(perm){

		def menu = '';
		def verificador = false

		menu ='<li class="treeview"> '+
				'<a href="#"> '+
				'<i class="fa fa-user"></i> <span>Professor</span> '+
				'<i class="fa fa-angle-left pull-right"></i> '+
				'</a> '+
				'<ul class="treeview-menu"> '

		if (verificaPerm('EDUCACAO_ACADEMICO', 'ATIVIDADE', perm)){
			menu+= '<li><a href="/projetoMetafora/Atividade/listar"><i class="fa fa-file-text-o"></i> Atividades</a></li>'
			verificador = true
		}

		if (verificaPerm('EDUCACAO_ACADEMICO', 'NOTA', perm)){
			menu+='<li><a href="/projetoMetafora/Nota/notasTurma" ><i class="fa fa-sitemap"></i> Notas Geral</a></li>'
			verificador = true
		}

		if (verificaPerm('EDUCACAO_ACADEMICO', 'NOTA', perm)){
			menu+='<li><a href="/projetoMetafora/Frequencia/frequencia" ><i class="fa fa-check-square-o"></i> Aula/Frequência</a></li>'
			verificador = true
		}



		menu +='</ul>'
		'</li>'

		if (!verificador)
			menu = ""

		return menu
	}

	//adição de mais um link para gerar o relatorio de funcionarios

	def buildRelatorioFuncionarioMenu(perm){

		def menu = '';
		def verificador = false

		menu ='<li class="treeview"> '+
				'<a href="#"> '+
				'<i class="fa fa-briefcase"></i> <span>Administração</span> '+
				'<i class="fa fa-angle-left pull-right"></i> '+
				'</a> '+
				'<ul class="treeview-menu"> '

		if (verificaPerm('EDUCACAO_ACADEMICO', 'NOTA', perm)){
			menu+= '<li><a href="/projetoMetafora/Funcionario/GerarRelatorio"><i class="fa fa-clipboard"></i>Situação</a></li>'
			verificador = true
		}


		menu +='</ul> '  +
				' </li> '

		if (!verificador)
			menu = ""

		return menu
	}


	// menu do protocolo

	def buildProtocoloMenu(perm){

		def menu = '';
		def verificador = false

		menu ='<li class="treeview"> '+
				'<a href="#"> '+
				'<i class="fa fa-briefcase"></i> <span>Protocolo</span> '+
				'<i class="fa fa-angle-left pull-right"></i> '+
				'</a> '+
				'<ul class="treeview-menu"> '

		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'SETOR', perm)){
			menu+= '<li><a href="/projetoMetafora/setor/listarSetor"><i class="fa fa-sitemap"></i>Setor</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'SITUACAO', perm)){
			menu+= '<li><a href="/projetoMetafora/Situacao/listarSituacao"><i class="fa fa-th-list"></i>Situacão</a></li>'

			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'PROTOCOLO', perm)){
			menu+= '<li><a href="/projetoMetafora/Protocolo/listarProtocolo"><i class="fa fa-clipboard"></i>Protocolos</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'TIPO_DOCUMENTO', perm)){
			menu+= '<li><a href="/projetoMetafora/tipoDocumento/listarTipoDocumento"><i class="glyphicon glyphicon-file"></i>Tipos de Documentos</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'PROTOCOLO', perm)){
			menu+= '<li><a href="/projetoMetafora/protocolo/listarPendentes"><i class="fa fa-arrow-down"></i>Pendentes</a></li>'
			verificador = true
		}
		if (verificaPerm('CADASTRO_UNICO_PROTOCOLO', 'PROTOCOLO', perm)){
			menu+= '<li><a href="/projetoMetafora/protocolo/pesquisarProtocolos"><i class="glyphicon glyphicon-search"></i>Pesquisar Protocolos</a></li>'
			
			verificador = true
		}

		menu +='</ul> '  +

				' </li> '

		if (!verificador)
			menu = ""

		return menu
	}

	def verificaPerm(sch, tab, perm){


		def ver1 = [sch, tab, "1"]
		def ver2 = [sch, tab, "2"]


		def perm1 = perm.contains(ver1)
		def perm2 = perm.contains(ver2)

		return (perm1 || perm2)
	}
}
