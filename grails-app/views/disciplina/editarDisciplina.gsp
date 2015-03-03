<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Disciplina . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<script type="text/javascript">
	$().ready(function() {
		$('#cpf').mask('999.999.999-99');

	});
</script>
</head>
<body>
	<section class="content-header">
		<h1>
			Disciplinas <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Disciplina" action="listar">Disciplinas</g:link></li>
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
			<g:each in='${disciplinas?}'>
			</g:each>
			
			<div style="margin-left: 120px">
				<g:form controller="Disciplina" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${it?.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputDisciplina3" class="col-sm-2 control-label">Nome
								da Disciplina</label>
							<div class="col-sm-10">
								<input class="form-control" required name="disciplina"
									type="text" style="width: 300px" value="${it.disciplina }">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCargaHoraria3" class="col-sm-2 control-label">Carga
								Horária</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="cargaHoraria"
									style="width: 300px" value="${it.cargaHoraria}" />
							</div>
						</div>
						<br>

					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat"><i
									class="fa fa-refresh"></i> Atualizar</button>				
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a href="/projetoMetafora/disciplina/listar/">Cancelar</a></li>
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