<!DOCTYPE html>

<html lang="pt-br">
<head>
<title>Editar Turma . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
</head>
<body>

	<section class="content-header">
		<h1>
			Turmas <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turma" action="listar">Turmas</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content" style="min-height: 875px;">
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
			<g:each in='${turmas?}'></g:each>
			<div style="margin-left: 120px;">
				<g:form controller="Turma" action="atualizar"
					class="form-horizontal">
					<g:hiddenField name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="escola" class="col-sm-2 control-label">Escola</label>
							<div class="col-sm-8">
								<g:textField name="escola" class="form-control" disabled="true"
									value="${it.escola.pessoaJuridica.pessoa.nome}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Nome da
								Turma</label>
							<div class="col-sm-3">
								<g:textField class="form-control" required="required"
									name="turma" value="${it.turma}" />
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="turno" class="col-sm-2 control-label">Turno</label>
							<div class="col-sm-4">
								<select class="form-control" name="turno">
								    <g:if test="${it.turno == "MATUTINO"}">
								    	<option value="MATUTINO" selected>MATUTINO</option>
								    </g:if>
								    <g:else>
								    	<option value="MATUTINO">MATUTINO</option>
								    </g:else>
								    <g:if test="${it.turno == "VESPERTINO"}">
								    	<option value="VESPERTINO" selected>VESPERTINO</option>
								    </g:if>
								    <g:else>
								    	<option value="VESPERTINO">VESPERTINO</option>
								    </g:else>
								    <g:if test="${it.turno == "NOTURNO"}">
								    	<option value="NOTURNO" selected>NOTURNO</option>
								    </g:if>
								    <g:else>
								    	<option value="NOTURNO">NOTURNO</option>
								    </g:else>

								</select>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="vagas" class="col-sm-2 control-label">Nº de
								Vagas</label>
							<div class="col-sm-3">
								<g:textField class="form-control" required="required"
									name="vagas" value="${it.vagas}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Série</label>
							<div class="col-sm-4">
								<g:select name="serie" class="form-control"
									from="${br.gov.rn.saogoncalo.academico.Serie.list()}"
									value="${it.serie.id}" optionKey="id" optionValue="serie" />
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="disciplinas" class="col-sm-2 control-label">Disciplinas</label>
							<div class="col-sm-4">
								<select name="disciplina" class="form-control selectpicker"
									multiple data-live-search="true" required="required">
									<g:each in='${dlpp}' var="dlppl">
										<g:if test="${td.contains(dlppl.id)}">
											<option value="${dlppl.id}" selected>
												${dlppl.professor.funcionario.cidadao.pessoaFisica.pessoa.nome}
												-
												${dlppl.disciplina.disciplina}
											</option>
										</g:if>
										<g:else>
											<option value="${dlppl.id}">
												${dlppl.professor.funcionario.cidadao.pessoaFisica.pessoa.nome}
												-
												${dlppl.disciplina.disciplina}
											</option>
										</g:else>
									</g:each>
								</select>
							</div>
						</div>
						<br>

					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/turma/listar/">Cancelar</a></li>
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
