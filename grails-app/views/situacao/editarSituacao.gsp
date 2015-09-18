<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Situacao . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Situações <small>Editar Dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i>Inicio</g:link></li>
			<li><g:link controller="Situacao" action="listar">Situacao</g:link></li>
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
			<g:each in='${situacao?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Situacao" action="atualizar" class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text" 
								style="width: 300px" value="${it.nome}">	
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputTipo" class="col-sm-2 control-label">Tipo</label>
							<div class="col-sm-10">
								<g:if test="${situacao.tipo == 'I'}">
									<select class="form-control" name="tipo" style="width: 300px">
										<option value="I" selected>INICIO</option>
										<option value="N">NENHUM</option>
										<option value="F">FINALIZADO</option>
									</select>
								</g:if>
 
								<g:elseif test="${situacao.tipo == 'N'}">
									<select class="form-control" name="tipo" style="width: 300px">
										<option value="I" >INICIO</option>
										<option value="N" selected>NENHUM</option>
										<option value="F">FINALIZADO</option>
									</select>
								</g:elseif>
								
								<g:elseif test="${situacao.tipo == 'F'}">
									<select class="form-control" name="tipo" style="width: 300px">
										<option value="I" >INICIO</option>
										<option value="N" >NENHUM</option>
										<option value="F" selected>FINALIZADO</option>
									</select>
								  </g:elseif>
                                 </div>
                              </div>        			
					     </fieldset>
					<div style="margin: 0 17% auto">
						<button type="submit" class="btn btn-primary btn-flat"><i
									class="fa fa-refresh"></i> Atualizar</button>				
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a href="/projetoMetafora/situacao/listar/">Cancelar</a></li>
						</ul>
					</div>
				</g:form>
			</div>
			
		</div>
	</section>
</body>
</html>