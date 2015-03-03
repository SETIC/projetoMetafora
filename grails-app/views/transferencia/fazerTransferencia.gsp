<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Transferência . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<section class="content-header">
		<h1>
			Transferir <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Transferencia" action="listar">Transferir</g:link></li>
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
			
			<g:form controller="Transferencia" action="concluirTransferencia"
					class="form-horizontal" style="height: 500px;">
					<input type="hidden" name="idAluno" value="${aluno.id}"/>
					<fieldset id="print">
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome do Aluno</label>
							<div class="col-sm-10">
								${aluno.cidadao.pessoaFisica.pessoa.nome }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Matrícula Ativa</label>
							<div class="col-sm-10">
								<g:each in="${matricula}">
									${it.turma.serie.serie }  - Turma ${it.turma.turma}
									<br/><span style="color: red; font-size: 10pt;">*Esta matrícula será desativada se a transferência for efetivada.</span><br/>
								</g:each>
								
							</div> 
							
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-2 control-label">Escola de Destino</label>
							<div class="controls col-sm-3">
								<select class="form-control selectpicker" data-live-search="true" name="idEscola"
												id="comboEscola" >
									<option value="0" disabled="disabled" selected="selected">
										Selecione uma escola
									</option>
									<g:each in="${escolas}" >
										<option value="${it.id}">
										${it.pessoaJuridica.razaoSocial}
									</option>
									</g:each>
								</select>								
							</div>
						</div>
						<br>	
					</fieldset>
					<div style="margin: 0 15% auto">
					
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="glyphicon glyphicon-arrow-right"></i> Concluir
						</button>	
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-danger btn-flat"><a
								href="/projetoMetafora/transferencia/listar/" style="color: #fff;">Cancelar</a></li>
						</ul>
					</div>
					<br>	
				</g:form>
		</div>
	</section>
</body>
</html>
		