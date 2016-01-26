<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Escola . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Escolas <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Escola" action="listar">Escolas</g:link></li>
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
			<g:each in='${escolas?}'>
				<g:set var="pessoa" value="${it.pessoaJuridica.pessoa}" />
				<g:set var="pessoaJuridica" value="${it.pessoaJuridica }" />
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Escola" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text"
									style="width: 300px" value="${pessoa.nome }">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Fundação</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataDeNascimento"
									value="${pessoa.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CNPJ</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true" id="cpf"
									name="cpfCnpj" style="width: 300px" value="${pessoa.cpfCnpj }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrazaoSocial3" class="col-sm-2 control-label">Razão
								Social</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="razaoSocial"
									style="width: 300px" value="${pessoaJuridica.razaoSocial }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputinscricaoEstadual3"
								class="col-sm-2 control-label">Inscrição Estadual</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="inscricaoEstadual"
									style="width: 300px"
									value="${pessoaJuridica.inscricaoEstadual }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">INEP</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="inepDaEscola"
									style="width: 300px" value="${it.inepDaEscola }" />
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">Latitude</label>
										<div class="col-sm-10">
											<g:textField class="form-control" name="latitude"
												style="width: 300px" value="${escolas.latitude}"/>
										</div>
									</div>
									<br>
									
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">Longitude</label>
										<div class="col-sm-10">
											<g:textField class="form-control" name="longitude"
												style="width: 300px" value="${escolas.longitude}"/>
										</div>
									</div>
									<br>
									
									<div class="form-group">
										
											<label for="inputinepDaEscola3" class="col-sm-2 control-label">Logradouro</label>
											<div class="col-sm-10">

												<select id="iLogradouro" name="logradouro"
													class="form-control selectpicker" data-live-search="true">
													<g:each in='${logradouro}'>

														<option value="${it.id}" <g:if test="${it.logradouro == escolas.pessoaJuridica.pessoa.reside.logradouro.logradouro[0]}"> selected 

														</g:if> >
															${it.tipoLogradouro.tipoLogradouro } ${it.logradouro}
														</option>

													</g:each>
												</select>

											</div>
										
									</div>
									<br>
									
									<div class="form-group">

											<label for="inputinepDaEscola3" class="col-sm-2 control-label">Bairro</label>
											<div class="col-sm-10">

												<select id="iBairro" name="bairro"
													class="form-control selectpicker" data-live-search="true">
													<g:each in='${bairro}'>

														<option value="${it.id}" 
														<g:if test="${it.bairro == escolas.pessoaJuridica.pessoa.reside.bairro.bairro[0]}"> selected 

														</g:if>  >
															${it.bairro}
														</option>

													</g:each>
												</select>

											</div>
								
									</div>
									<br>		
									
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">Numero</label>
										<div class="col-sm-10">
											<g:textField class="form-control" name="numero"
												style="width: 300px" value="${escolas.pessoaJuridica.pessoa.reside.numero[0]}"/>
										</div>
									</div>
									<br>
									
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">Complemento</label>
										<div class="col-sm-10">
											<g:textField class="form-control" name="complemento"
												style="width: 300px" value="${escolas.pessoaJuridica.pessoa.reside.complemento[0]}"/>
										</div>
									</div>
									<br>
									
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">CEP</label>
										<div class="col-sm-10">
											<g:textField class="form-control" name="cep"
												style="width: 300px" value="${escolas.pessoaJuridica.pessoa.reside.cep[0]}"/>
										</div>
									</div>
									<br>
						
					
						<div class="form-group">
										<label for="inputinepDaEscola3" class="col-sm-2 control-label">Ativo</label>
										<div class="col-sm-10">
										
										<select id="iStatus" name="status" class="form-control selectpicker" data-live-search="false">
													
											<option value="Ativo" <g:if test="${escolas.pessoaJuridica.pessoa.status == 'Ativo'}"> selected </g:if> >Ativo</option>
											<option value="Inativo" <g:if test="${escolas.pessoaJuridica.pessoa.status == 'Inativo'}"> selected </g:if> >Inativo</option>
												
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
								href="/projetoMetafora/escola/listar/">Cancelar</a></li>
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