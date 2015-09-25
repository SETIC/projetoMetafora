<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Pendentes . Módulo Protocolo</title>
<meta name="layout" content="public" />
</head>
<body>
	<section class="content-header">
		<h1>
			Protocolos Pendentes <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Protocolo" action="listar">Protocolos Pendentes</g:link></li>
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
				<table id="listarPendentes" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th>Código</th>
							<th>Origem</th>
							<th>Assunto</th>
							<th>Situação</th>
							<th>Data do Protocolo</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${tramites?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">
	
											<g:if test="${perm2}">
												<li class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/protocolo/listarPendentes/${it.id}"><span
														class="glyphicon glyphicon-ok"></span></a></li>
											</g:if>
										</ul>
	
									</div>
								</td>
								<td>
									${it.id}
								</td>
								<td>
									${it.funcionarioSetorOrigem.setor.nome}
								</td>
								<td>
									${it.protocolo.assunto}
								</td>
								<td>
									${it.protocolo.situacao.nome}
								</td>
								<td>
									${it.protocolo.dataProtocolo}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>