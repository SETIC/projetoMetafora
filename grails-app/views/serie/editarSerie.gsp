<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Série . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Séries <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Serie" action="listar">Séries</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content">
		<div>
			<g:if test="${ok}">
				<div class="alert alert-success">
					${ok}
				</div>
			</g:if>
			<g:if test="${erro}">
				<div class="alert alert-danger">
					${erro}
				</div>
			</g:if>
			<g:each in='${series?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="serie" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Série</label>
							<div class="col-sm-10">
								<input class="form-control" required name="serie" type="text"
									style="width: 300px" value="${it.serie}">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputnumeroDeInscricao3"
								class="col-sm-2 control-label">Número de Vagas</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="numeroDeVagas"
									style="width: 300px" value="${it.numeroDeVagas}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Inicio</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataDeInicio"
									value="${it.dataDeInicio}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Término</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataDeTermino"
									value="${it.dataDeTermino}" />
							</div>
						</div>

					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat"><i
									class="fa fa-refresh"></i> Atualizar</button>				
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a href="/projetoMetafora/serie/listar/">Cancelar</a></li>
						</ul>
					</div>
				</g:form>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#example').DataTable();
					var tabela = $('#example').dataTable();
					// Ordena por nome e "desempata" com o id
					tabela.fnSort([ [ 1, 'asc' ] ]);
				});
			</script>
		</div>
	</section>
</body>
</html>