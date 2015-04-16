<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="SISEDUC . Painel"/></title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link href="${resource(dir: 'css', file: 'font-awesome.min.css')}" rel="stylesheet">
    
    <!-- Ionicons -->
    <link href="${resource(dir: 'css', file: 'ionicons.min.css')}" rel="stylesheet">
    
    <!-- Morris chart -->
    <link href="${resource(dir: 'css', file: 'morris/morris.css')}" rel="stylesheet">
    
    <!-- jvectormap -->
    <link href="${resource(dir: 'css', file: 'jvectormap/jquery-jvectormap-1.2.2.css')}" rel="stylesheet">
    
    <!-- Daterange picker -->
    <link href="${resource(dir: 'css', file: 'daterangepicker/daterangepicker-bs3.css')}" rel="stylesheet">
    
    <!-- Bootstrap Select -->
    <link href="${resource(dir: 'css', file: 'bootstrap-select.css')}" rel="stylesheet">
	
	<!-- DataTable Bootstrap -->
	<link href="${resource(dir: 'css', file: 'dataTables.bootstrap.css')}"	rel="stylesheet">
	
    <!-- Theme style -->
    <link href="${resource(dir: 'css', file: 'AdminLTE.min.css')}" rel="stylesheet">
    
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${resource(dir: 'css', file: 'skins/_all-skins.min.css')}" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	.box-white {
    		border-radius: 0; 
    		border-top: 0; 
    		padding: 1%;
    	}
    	.link-black {
    		color: #000 !important;
    	}
    	.link-black:hover {
    		color: #000 !important;
    		text-shadow: .5px .5px 1px #808080;
    	}
    	.no-active{
    		pointer-events: none;
    		cursor: default;
    		color: #767676 !important;
    		background-color: #E5E5E5;
    	}
    </style>
  </head>
  <body class="skin-blue">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <g:link controller="Layout" action="index" class="logo"><g:img dir="img" file="logo-SISEDUC.png" style="width: 90%; margin-top: -6%;" class="img-circle" alt="Logo do Sistema"/></g:link>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <g:img dir="img" file="photo-profile-default-gray.png" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">${session["user"]}</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                  	<g:img dir="img" file="photo-profile-default-gray.png" class="img-circle" alt="User Image"/>
                    <p>
                      ${session["user"]} - ${session["escname"]}
                      <small>Member since Nov. 2012</small>
                    </p>
                  </li>
                  <!-- Menu Body 
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li> -->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat no-active">Meus Dados</a>
                    </div>
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
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <g:img dir="img" file="photo-profile-default-gray.png" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
              <p>${session["user"]}</p>
              

              <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MENU PRINCIPAL</li>
            <li class="active treeview">
              <g:link controller="Layout" action="index">
                <i class="fa fa-dashboard"></i> <span>Painel</span>
              </g:link>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-users"></i>
                <span>Pessoal</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="Aluno" action="listar"><i class="fa fa-graduation-cap"></i> Alunos</g:link></li>
				<li><g:link controller="Escola" action="listar"><i class="fa fa-university"></i> Escolas</g:link></li>
				<li><g:link controller="Funcionario" action="listar"><i class="fa fa-male"></i> Funcionários</g:link></li>
				<li><g:link controller="Professor" action="listar"><i class="fa fa-user"></i> Professores</g:link></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-book"></i>
                <span>Acadêmico</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="Disciplina" action="listar"><i class="fa fa-file-text-o"></i> Disciplinas</g:link></li>
				<li><g:link controller="Horario" action="listar"><i class="fa fa-clock-o"></i> Horários</g:link></li>
				<li><g:link controller="Matricula" action="listar"><i class="fa fa-list-alt"></i> Matriculas</g:link></li>
				<li><g:link controller="Sala" action="listar"><i class="fa fa-home"></i> Salas</g:link></li>
				<li><g:link controller="Serie" action="listar"><i class="fa fa-signal"></i> Series</g:link></li>
				<li><g:link controller="Turma" action="listar"><i class="fa fa-sitemap"></i> Turmas</g:link></li>
				<li><g:link controller="Transferencia" action="listar"><i class="glyphicon glyphicon-transfer"></i> Transferência</g:link></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-cubes"></i> <span>Programas</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="Layout" action="index"><i class="fa fa-file-text-o"></i> PDDE</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-clock-o"></i> PNAIC</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-list-alt"></i> Mais Educação</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-home"></i> Bolsa Família</g:link></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-globe"></i> <span>Georeferenciamento</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="Localizacao" action="alunos"><i class="fa fa-area-chart"></i> Alunos</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-area-chart"></i> Escolas</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-area-chart"></i> Funcionários</g:link></li>
				<li><g:link controller="Layout" action="index"><i class="fa fa-area-chart"></i> Professores</g:link></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-user"></i> <span>Professor</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><g:link controller="Atividade" action="listar"><i class="fa fa-file-text-o"></i> Atividades</g:link></li>
				<li><g:link controller="Nota" action="notasTurma"><i class="fa fa-sitemap"></i> Turmas</g:link></li>
				<li><g:link controller="#" action="#"><i class="fa fa-list-alt"></i> Notas</g:link></li>
				<li><g:link controller="#" action="#"><i class="fa fa-check-square-o"></i> Presenças</g:link></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
	  <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
      	<g:layoutBody />
	  </div>	
      <footer class="main-footer">
          <div class="pull-right hidden-xs">
            <b>Version</b> 2.0
          </div>
          <strong>Copyright © 2014-2015 <a style="font-weight: 400;" href="#"><b>SIS</b>EDUC</a>.</strong> Todos os direitos reservados.
      </footer>

    </div><!-- ./wrapper -->
    <!-- jQuery 2.1.3 -->
    <g:javascript src="jQuery/jQuery-2.1.3.min.js" />
    <!-- Bootstrap 3.3.2 JS -->
    <g:javascript src="bootstrap.min.js" />
    <!-- FastClick -->
    <g:javascript src="plugins/fastclick/fastclick.min.js" />
    <!-- AdminLTE App -->
    <g:javascript src="app.min.js" />
    <!-- jQuery Data Tables -->
    <g:javascript src="jquery.dataTables.min.js" />
    <!-- Data Tables Bootstrap -->
    <g:javascript src="dataTables.bootstrap.js" />
    <!-- Data Table Script -->
    <g:javascript src="dataScript.js" />
    <!-- Bootstrap Select Search -->
    <g:javascript src="dist/js/bootstrap-select.js" />
    <!-- Sparkline -->
    <g:javascript src="plugins/sparkline/jquery.sparkline.min.js" />
    <!-- jvectormap -->
    <g:javascript src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />
    <g:javascript src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />
    <!-- daterangepicker -->
    <g:javascript src="plugins/daterangepicker/daterangepicker.js" />
    <!-- datepicker -->
    <g:javascript src="plugins/datepicker/bootstrap-datepicker.js" />
    <!-- iCheck -->
    <g:javascript src="plugins/iCheck/icheck.min.js" />
    <!-- SlimScroll 1.3.0 -->
    <g:javascript src="plugins/slimScroll/jquery.slimscroll.min.js" />
    <!-- ChartJS 1.0.1 -->
	<g:javascript src="plugins/chartjs/Chart.min.js" />
	
    <!-- AdminLTE dashboard demo (This is only for demo purposes) 
	<g:javascript src="dashboard2.js" /> -->

    <!-- AdminLTE for demo purposes 
    <g:javascript src="demo.js" /> -->
  </body>
</html>