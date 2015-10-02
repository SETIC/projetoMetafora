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
													href="/projetoMetafora/protocolo/aceitarProtocolos/${it.id}"><span
														class="glyphicon glyphicon-ok">Aceitar</span></a></li>
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
			<!-- Button trigger modal -->
			<g:if test="${perm2 }">
				<button class="btn btn-primary btn-flat" data-toggle="modal" data-target="#myModal">
					<i class="fa fa-plus"></i> Novo Tramite
				</button>
			</g:if>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Tramitação</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Tramite" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Descrição</label>
										<div class="controls">
											<g:textArea class="form-control" required="true" name="descricao"/>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Anexo</label>
										<div class="controls">
											<g:textArea class="form-control" required="true" name="descricao"/>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label for="inputdlpp3" class="control-label">Funcionário/Setor</label>
										<br>
										<div>
											<select class="form-control selectpicker" data-live-search="true" name="funcionarioSetor">
												<g:each in="${funcionarioSetor}">
													<option value="${it.id}" selected>
														${it.funcionario.cidadao.pessoaFisica.pessoa.nome} - ${it.setor.nome} 
													</option>
												</g:each>
											</select>
										</div>
									</div>
									<br>
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="glyphicon glyphicon-arrow-right"></i> Tramitar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			
		</div>
	</section>
</body>
</html>