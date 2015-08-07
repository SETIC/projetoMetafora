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
      <!-- Info boxes -->
      <div class="row">
      	<g:link class="link-black" controller="Aluno" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-graduation-cap"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Alunos</span>
	              <span class="info-box-number">${quantAlunos}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
        </g:link>
        <g:if test="${sessao==0}">
        <g:link class="link-black" controller="Escola" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-red"><i class="fa fa-university"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Escolas</span>
	              <span class="info-box-number">${quantEscolas}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
		</g:link>
		</g:if>
		<g:link class="link-black" controller="Professores" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-green"><i class="ion ion-person-add"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Professores</span>
	              <span class="info-box-number">${quantProfessores}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
        </g:link>
        
        <g:link class="link-black" controller="Funcionario" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Funcionários</span>
	              <span class="info-box-number">${quantFuncionarios}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
	    </g:link>
			<br>
	    <!-- Main content -->
    <section class="content" >
          <div class="row">
            <div class="col-md-6">
          
              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">Quantitativo de Alunos por Escola</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="col-md-4">
               
                  </div>
                </div>
                <div class="box-body">
                    <canvas id="pieChart" style="height: 265px; width: 530px;" width="530" height="265"></canvas>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              

            </div><!-- /.col (LEFT) -->
            
          </div><!-- /.row -->
          <br>
			
        </section>
	    
	       
	  </div><!-- /.row -->
    </section><!-- /.content -->	
</body>
</html>