<!DOCTYPE html>

<%@page import="groovy.transform.ToString"%>
<html lang="pt-br">
<head>
<title>Editar Usuario . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Usuario <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Usuario" action="listar">Usuarios</g:link></li>
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

			<div style="margin-left: 120px">
				<g:form controller="Usuario" action="atualizar"
					class="form-horizontal">
					
					<input type="hidden" value="${usuarios.id}" name="idUsuario">

					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text"
									disabled="disabled" style="width: 300px"
									value="${pessoas.nome}">
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputUsername3" class="col-sm-2 control-label">Username</label>
							<div class="col-sm-10">
								<input class="form-control" required name="username" type="text"
									disabled="disabled" style="width: 300px"
									value="${usuarios.username }">
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputSenha3" class="col-sm-2 control-label">Senha</label>
							<div class="col-sm-10">
								<g:passwordField name="novaSenha" value=""/>
							</div>
						</div>
						<br>
						
						<div class="form-group" style="min-height: 150px;">
							<label for="inputdlpp3" class="col-sm-2 control-label">Grupos
								do Usuario</label>
							<div class="col-sm-10">
								<select class="form-control selectpicker"
									data-live-search="true" name="grupoUsuario"
									multiple="multiple">

										<g:each in="${grupos?}" var="listagrupos">
			
										
										<g:if test="${grupoUsado.grupoId.contains(listagrupos.id)}">
											
											<option value="${listagrupos.id}" selected>
													${listagrupos.nome}
												</option>
										</g:if>
										<g:else>
												<option value="${listagrupos.id}">
													${listagrupos.nome}
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
								href="/projetoMetafora/professor/listar/">Cancelar</a></li>
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