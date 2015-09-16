<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar protocolo . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Protocolos <small>Editar Dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i>Inicio</g:link></li>
			<li><g:link controller="Protocolo" action="listar">Protocolo</g:link></li>
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
			<g:each in='${protocolo?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Protocolo" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Numero</label>
							<div class="col-sm-10">
								<input class="form-control" required name="numero" type="text"
									style="width: 300px" value="${it.numero}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="iProtocolo" class="col-sm-2 control-label">Data
								do Protocolo </label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataProtocolo" name="dataProtocolo"
									required="true" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="iProtocolo" class="col-sm-2 control-label">Data
								de Emissão </label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataEmissao" name="dataEmissao"
									required="true" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Numero
								do Documento</label>
							<div class="col-sm-10">
								<input class="form-control" required name="numeroDocumento"
									type="text" style="width: 300px" value="${it.numeroDocumento}">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="input3" class="col-sm-2 control-label">Assunto</label>
							<div class="col-sm-10">
								<input class="form-control" required name="assunto" type="text"
									style="width: 300px" value="${it.assunto}">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Situção
							</label>
							<div class="col-sm-4">
								<select class="selectpicker" " name="situacao"
									id="comboSituacao" class="form-control">
									<div class="col-sm-10">
										<g:each in="${situacoes}">
											<g:if test="${it.id == protocolo.situacao.id}">
												<option value="${it.id}" selected>
													${it.nome}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.nome}
												</option>
											</g:else>
										</g:each>
								</select>
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Tipo
								Documento</label>
							<div class="col-sm-4">
								<select class="selectpicker" " name="tipoDocumento"
									id="comboTipoDocumento" class="form-control">
									<div class="col-sm-10">
										<g:each in="${tipoDocumentos}">
											<g:if test="${it.id == protocolo.tipoDocumento.id}">
												<option value="${it.id}" selected>
													${it.nome}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.nome}
												</option>
											</g:else>
										</g:each>
								</select>
							</div>
						</div>
						<br>
						</g:each>
						</select> <br>
					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/protocolo/listarProtocolo/">Cancelar</a></li>
						</ul>
					</div>
				</g:form>
			</div>

		</div>
	</section>
</body>
</html>