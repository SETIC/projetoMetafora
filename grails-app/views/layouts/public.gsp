<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />

<link rel="shortcut icon" href="${resource(dir:'images', file:'favicon.ico')}" type="image/x-icon" />

<title><g:layoutTitle default="Sistema Administrativo" /></title>

<!-- Theme style -->
<link href="${resource(dir: 'css', file: 'bootstrap-select.css')}" rel="stylesheet">
	
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">

<link href="${resource(dir: 'css', file: 'dataTables.bootstrap.css')}" rel="stylesheet">



<!-- Ionicons -->
<link href="${resource(dir: 'css', file: 'ionicons.min.css')}" rel="stylesheet">

<!-- Font Awesome -->
<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}" rel="stylesheet">

<!-- Morris chart -->
<link href="${resource(dir: 'css/morris', file: 'morris.css')}" rel="stylesheet">

<!-- jvectormap -->
<link href="${resource(dir: 'css/jvectormap', file: 'jquery-jvectormap-1.2.2.css')}" rel="stylesheet">

<!-- Date Picker -->
<link href="${resource(dir: 'css/datepicker', file: 'datepicker3.css')}" rel="stylesheet">

<!-- Daterange picker -->
<link href="${resource(dir: 'css/daterangepicker', file: 'daterangepicker-bs3.css')}" rel="stylesheet">

<!-- bootstrap wysihtml5 - text editor -->
<link href="${resource(dir: 'css/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.min.css')}" rel="stylesheet">

<link href="${resource(dir: 'css', file: 'AdminLTE.css')}" rel="stylesheet">

</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<g:link controller="Layout" action="index" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
			Sistema Administrativo
		</g:link>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>
			<div class="navbar-right">
				<ul class="nav navbar-nav">					
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="glyphicon glyphicon-user"></i> <span>${session["user"]} <i
								class="caret"></i></span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header bg-light-blue">
								<p>${session["user"]}
									<small>${session["escname"]}</small>
								</p></li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-right">
									<g:link controller="Usuario" action="deslogar" class="btn btn-default btn-flat">Sair</g:link>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="wrapper row-offcanvas row-offcanvas-left" style="margin-bottom: 70px;">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li><g:link controller="Layout" action="index"><i class="fa fa-dashboard"></i>
							<span>Painel</span>
					</g:link></li>
					
					<li class="treeview">
						<a href="#">
							<i class="fa fa-users"></i>
							<span>Pessoal</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li><g:link controller="Aluno" action="listar">
								<i class="fa fa-graduation-cap"></i> Alunos</g:link>
							</li>
							<li><g:link controller="Escola" action="listar">
								<i class="fa fa-university"></i> Escolas</g:link>
							</li>
							<li><g:link controller="Funcionario" action="listar">
								<i class="fa fa-male"></i> Funcionários</g:link>
							</li>
							<li><g:link controller="Professor" action="listar">
								<i class="fa fa-user"></i> Professores</g:link>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"> 
							<i class="fa fa-book"></i>
								<span>Acadêmico</span>
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li><g:link controller="Disciplina" action="listar"><i
									class="fa fa-file-text-o"></i> Disciplinas</g:link></li>
							<li><g:link controller="Horario" action="listar"><i
									class="fa fa-clock-o"></i> Horários</g:link></li>
							<li><g:link controller="Matricula" action="listar"><i
									class="fa fa-list-alt"></i> Matriculas</g:link></li>
							<li><g:link controller="Sala" action="listar"><i
									class="fa fa-home"></i> Salas</g:link></li>
							<li><g:link controller="Serie" action="listar"><i
									class="fa fa-signal"></i> Series</g:link></li>
							<li><g:link controller="Turma" action="listar"><i
									class="fa fa-sitemap"></i> Turmas</g:link></li>
							<li><g:link controller="Transferencia" action="listar"><i
									class="glyphicon glyphicon-transfer"></i> Transferência</g:link></li>
						</ul></li>
					<li class="treeview">
						<a href="#"> 
							<i class="fa fa-cubes"></i>
								<span>Programas</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-file-text-o"></i> PDDE</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-clock-o"></i> PNAIC</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-list-alt"></i> Mais Educação</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-home"></i> Bolsa Família</g:link></li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-globe"></i>
								<span>Georeferenciamento</span>
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li><g:link controller="Localizacao" action="alunos "><i
									class="fa fa-area-chart"></i> Alunos</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-area-chart"></i> Escolas</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-area-chart"></i> Funcionários</g:link></li>
							<li><g:link controller="Layout" action="index"><i
									class="fa fa-area-chart"></i> Professores</g:link></li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"> 
							<i class="fa fa-book"></i>
								<span>Professor</span>
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li><g:link controller="Disciplina" action="listar"><i
									class="fa fa-file-text-o"></i> Atividades</g:link></li>
							<li><g:link controller="Horario" action="listar"><i
									class="fa fa-clock-o"></i> Turmas</g:link></li>
							<li><g:link controller="Matricula" action="listar"><i
									class="fa fa-list-alt"></i> Notas</g:link></li>
							<li><g:link controller="Sala" action="listar"><i
									class="fa fa-home"></i> Presenças</g:link></li>
						</ul></li>
				</ul>
				
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side" style="height: 100%;">
			<!-- Content Header (Page header) -->
			<!-- Main content -->
				<g:layoutBody />
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
		<div id=#logo-rodape style="bottom:0; height: 40px; position:fixed; padding-bottom: 70px; width:100%;
		 vertical-align:middle; background-color: #3c8dbc; box-shadow: 1px 0px 5px;">
	
		<div style="top: 0; height: 2px; background-color: #1B7C9B; width:100%;"></div>
		
		<a href="http://www.saogoncalo.rn.gov.br/" target="_blank"><g:img style="height: 70px; float:left;" dir="images" file="logo.png"/></a>
		
		<p style="text-align: center; bottom: 0px; color: #FFF; font-weight: bold; margin-top:15px; font-family: Roboto, sans-serif;">
			SETIC | Coordenação de Desenvolvimento de Softwares <br/> Copyright © 2014-2015 - SGA - Sistema Administrativo v1.01.1a</p>
    </div>
	</div>
	<!--./wrapper -->
	
	
	
</body>
<g:javascript src="jquery.js" />
<g:javascript src="jquery.min.js" />
<g:javascript src="jquery.dataTables.min.js" />
<g:javascript src="dataTables.bootstrap.js" />
<g:javascript src="dataScript.js" />
<g:javascript src="bootstrap.min.js" />

<g:javascript src="AdminLTE/app.js" />
<g:javascript src="AdminLTE/dashboard.js" />


<g:javascript src="dist/js/bootstrap-select.js" />

</html>
