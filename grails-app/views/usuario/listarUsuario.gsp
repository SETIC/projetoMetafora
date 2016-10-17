<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Usuario . Módulo Login</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir este Usuário?");

        if (resposta == true){
        location.href="/projetoMetafora/usuario/deletar/"+id }

       }
 </script>
 	
	<section class="content-header">
		<h1>
			Usuários <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Usuario" action="listar">Alunos</g:link></li>
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
			<div class="box box-white">
				<table id="" class="table table-striped table-hover example">
					<g:if test="${!usuarios?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 65px;"></th>
							<th style="width: 280px;">Nome</th>
							<th style="width: 60px;">Username</th>
							<th style="width: 60px;">Grupo</th>
							
						</tr>
					</thead>
					<tbody>
						<g:each in='${usuarios?}'>
							
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">
											<li class="btn btn-primary btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/usuario/editarUsuario/${it.id}"><span
													class="glyphicon glyphicon-pencil"></span></a></li>
											<li onclick="deletar(${it.id})"
												class="btn btn-danger btn-xs btn-flat"><span
												class="glyphicon glyphicon-remove"></span></li>
											
										</ul>
									</div>
								</td>
								<td>
									${it.pessoa.nome}
								</td>
								<td>
									${it.username}
								</td>
								<td>
									${it.grupoUsuario.grupo.descricao}
								</td>
								
							</tr>
						</g:each>
	
					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Novo Usuário
			</button>
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Usuário</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Usuario" action="salvar" class="form"
								name="formHorario">
								<fieldset>
									
									<div class="form-heading">
										<label>Instituição</label>
										<div class="controls">
										<select class="form-control selectpicker"
													data-live-search="true" name="escola" id="iEscola" >
													<g:each in="${escolas?}">

														<option value="${it.id}">
															${it.pessoaJuridica.razaoSocial}
														</option>
													</g:each>
												</select>
										</div>
									</div>
									<br>
									
									
									<div class="form-heading">
										<label>Usuário</label>
										<div class="controls">

											<select name="pessoa" class="form-control selectpicker" data-live-search="true">
												<g:each in='${pessoas}'>

													<option value="${it.id}"> ${it.nome} </option>

												</g:each>
											</select>

										</div>
									</div>
									<br>

									<div class="form-heading">
										<label>Username</label>
										<div class="controls">
											<div id="teste"></div>
											<g:textField name="username"/>
											
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Grupos</label>
										<div class="controls">
											
										<g:select class="form-control selectpicker"
												data-live-search="true" 
												name="grupo" multiple="multiple"
												from="${br.gov.rn.saogoncalo.login.Grupo.list()}"
												value="id" optionKey="id" optionValue="nome" />	
											
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Senha</label>
										<div class="controls">
											<g:passwordField name="senha"/>
										</div>
									</div>
									<br>
									
							
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
								</div>
							</g:form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
