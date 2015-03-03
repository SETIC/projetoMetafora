<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta name="layout" content="public" />
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Painel <small>Controle painel</small>
		</h1>
		<ol class="breadcrumb">
			<li><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li class="active">Painel</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>${quantAlunos}</h3>
						<p>Alunos Cadastrados</p>
					</div>
					<div class="icon">
						<i class="fa fa-graduation-cap"></i>
					</div>
					<g:link controller="Aluno" action="listar" class="small-box-footer"> Listar Alunos <i
						class="fa fa-arrow-circle-right"></i>
					</g:link>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>${quantEscolas}</h3>
						<p>Escolas Cadastradas</p>
					</div>
					<div class="icon">
						<i class="fa fa-university"></i>
					</div>
					<g:link controller="Escola" action="listar" class="small-box-footer"> Listar Escolas <i
						class="fa fa-arrow-circle-right"></i>
					</g:link>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>${quantProfessores}</h3>
						<p>Professores Cadastrados</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<g:link controller="Professor" action="listar" class="small-box-footer"> Listar Professores <i
						class="fa fa-arrow-circle-right"></i>
					</g:link>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>${quantFuncionarios}</h3>
						<p>Funcionários Cadastrados</p>
					</div>
					<div class="icon">
						<i class="fa fa-male"></i>
					</div>
					<g:link controller="Funcionario" action="listar" class="small-box-footer"> Listar Funcionários <i
						class="fa fa-arrow-circle-right"></i>
					</g:link>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->

		<!-- Main row -->
		<div class="row">
			<!-- Left col -->
			<section class="col-lg-7 connectedSortable">
		

			</section>
			<!-- /.Left col -->
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
			<section class="col-lg-5 connectedSortable">
				<!-- /.box -->
			</section>
			<!-- right col -->
		</div>
		<!-- /.row (main row) -->
	</section>
	<!-- /.content -->
</body>
</html>