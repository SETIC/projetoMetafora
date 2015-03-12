<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Transferência . Módulo Pessoal</title>
<meta name="layout" content="public" />
</head>
<body>
	<section class="content-header">
		<script>
			function cancelar(id) {
				var resposta = confirm("Deseja exluir está Transferência ?");
	
				if (resposta == true) {
					location.href = "/projetoMetafora/transferencia/cancelarTransferencia/" + id
				}
	
			}
			function aceitar(id) {
				var resposta = confirm("Deseja aceitar está Transferência ?");
	
				if (resposta == true) {
					location.href = "/projetoMetafora/transferencia/aceitarTransferencia/" + id
				}
	
			}
		</script>
		<h1>
			Transferência <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Transferencia" action="listar">Transferência</g:link></li>
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

			<div class="box-header">
				<h4 class="box-title" style="font-weight: bold;">
					Aguardando Aprovação <i class="glyphicon glyphicon-arrow-left"></i>
				</h4>
			</div>
			<!-- /.box-header -->



			<table id="" class="table table-striped table-hover example">
				<g:if test="${!transferencias?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 5%;"></th>
						<th style="width: 28%;">Aluno</th>
						<th style="width: 6%;">Status</th>
						<th style="width: 33%;">Escola Origem</th>
						<th style="width: 33%;">Escola Destino</th>
					</tr>
				</thead>
				<tbody>
					<g:each in='${alunos?}' var="pessoa">
						<g:if test='${pessoa.escIdDestino == sessaoEscId }'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">

											<li class="btn btn-success btn-xs btn-flat" onclick="aceitar(${pessoa.id})"><a
												style="color: #fff" 
												title="Aceitar Transferência">
													<span class="glyphicon glyphicon-ok"></span>
											</a></li>

											<li class="btn btn-danger btn-xs btn-flat" onclick="cancelar(${pessoa.id})"><a
												style="color: #fff" 
												title="Cancelar Transferência">
													<span class="glyphicon glyphicon-remove"></span>
											</a></li>
											
										</ul>
									</div>
								</td>
								<td>
									${pessoa.nome}
								</td>
								<td><span class="label label-warning">Pendente</span></td>
								<g:each in='${escolas}' var="escola">
									<g:if test='${pessoa.escid == escola.id}'>
										<td>
											${escola.pessoaJuridica.pessoa.nome}
										</td>
									</g:if>
								</g:each>
								<g:each in='${escolas}' var="escola">
									<g:if test='${pessoa.escIdDestino == escola.id}'>
										<td>
											${escola.pessoaJuridica.pessoa.nome}
										</td>
									</g:if>
								</g:each>

							</tr>
						</g:if>
					</g:each>

				</tbody>
			</table>




			<div class="box-header">
				<h4 class="box-title" style="font-weight: bold;">
					Transferidos <i class="glyphicon glyphicon-arrow-right"></i>
				</h4>
			</div>
			<!-- /.box-header -->



			<table id="" class="table table-striped table-hover example">
				<g:if test="${!transferencias?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 5%;"></th>
						<th style="width: 28%;">Aluno</th>
						<th style="width: 6%;">Status</th>
						<th style="width: 33%;">Escola Origem</th>
						<th style="width: 33%;">Escola Destino</th>
					</tr>
				</thead>
				<tbody>
					<g:each in='${alunos?}' var="pessoa">
						<g:if test='${pessoa.escIdDestino != sessaoEscId }'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">
											<li class="btn btn-danger btn-xs btn-flat" onclick="cancelar(${pessoa.id})"><a
												style="color: #fff" title="Cancelar Transferência"
												id="${pessoa.id}">
													<span class="glyphicon glyphicon-remove"></span>
											</a></li>
										</ul>
									</div>
								</td>
								<td>
									${pessoa.nome}
								</td>
								<td><span class="label label-warning">Pendente</span></td>
								<g:each in='${escolas}' var="escola">
									<g:if test='${pessoa.escid == escola.id}'>
										<td>
											${escola.pessoaJuridica.pessoa.nome}
										</td>
									</g:if>
								</g:each>
								<g:each in='${escolas}' var="escola">
									<g:if test='${pessoa.escIdDestino == escola.id}'>
										<td>
											${escola.pessoaJuridica.pessoa.nome}
										</td>
									</g:if>
								</g:each>

							</tr>
						</g:if>
					</g:each>

				</tbody>
			</table>
		</div>
	</section>
</body>
</html>
