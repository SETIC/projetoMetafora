<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Aula . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Aula <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Aula" action="listarAula">Aulas</g:link></li>
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
			<g:each in='${aula}'>
			</g:each>
			
			<div>
				<g:form controller="Aula" action="atualizar" class="form">
				<g:hiddenField type="number" name="id" value="${it?.id}" />
								<fieldset>
									<div class="form-heading">
										<label>Título da Aula</label>
										<div class="controls">
											<g:textField class="form-control" required="true" name="titulo"
												value="${it.titulo}" />
										</div>
									</div>
									<br>
									
									<div class="form-heading">
										<label>Conteúdo da Aula</label>
										<div class="controls">
											<g:textArea class="form-control" name="conteudo" value="${it.conteudo}" required="true"/>
										</div>
									</div>
									<br>
										<div class="form-heading">
										<label>Data da Aula</label>
										<div class="controls">
											<g:formatDate format="yyyy-MM-dd" date="${date}" />
											<g:datePicker noSelection="['':'']" precision="day"
												class="form-control" required="true" name="dataAula"
												value="${it.dataAula}" />

										</div>
									</div><br/>
									<div class="form-heading">
										<label>Quantidade de Horários</label>
										<div class="controls">
											<input type="number" class="form-control" name="quantHorarios"
												min="1" max="6"  value="2" size="50" required />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Tipo de Aula</label>
										<div class="controls">
											<select class="form-control" name="tipoAula">
												<g:each in="${tipoAula}" var="ta">
													
												<option value="${ta.id}">${ta.tipoDeAula}</option>
												</g:each>
											
											</select>
										</div>
									</div>
									<br>
									
									<input type="hidden" value="${it.turmaDisciplina.id}" name="turmaDisciplina" />
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Atualizar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">

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