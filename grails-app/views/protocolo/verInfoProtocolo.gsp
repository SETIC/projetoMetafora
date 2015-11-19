<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Informacoes do Protocolo . Módulo Protocolo</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
  newWin.document.write("<style=''>");

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table><br>");
  
  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DO PROTOCOLO</h4>");
  newWin.document.write("<hr>");
  newWin.document.write("<style type='text/css' >");
  newWin.document.write("#"+id+'{border:none; font-size: 12pt; }');
  newWin.document.write("body{font-family:Arial;}");
  newWin.document.write("img{margin-lefth: 10px;}");
  newWin.document.write("label{text-transform: uppercase; font-weight:bold; }");
  newWin.document.write("</style>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  var now = new Date();

  meses = new Array(12);

  meses[0] = "Janeiro";
  meses[1] = "Fevereiro";
  meses[2] = "Março";
  meses[3] = "Abril";
  meses[4] = "Maio";
  meses[5] = "Junho";
  meses[6] = "Julho";
  meses[7] = "Agosto";
  meses[8] = "Setembro";
  meses[9] = "Outubro";
  meses[10] = "Novembro";
  meses[11] = "Dezembro";
  
  newWin.document.write ("<center style='font-size:11px;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+"</center>");

  newWin.print();
  newWin.close();
}
</script>
	<section class="content-header">
		<h1>
			Protocolo <small>Visualizar Dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Protocolo" action="listar">Protocolos</g:link></li>
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
				<g:form controller="Protocolo" action="verInfoProtocolo"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${protocolos.id}" />
					<fieldset id="print">
						<div class="form-group">
							<label for="inputNumero" class="col-sm-2 control-label">Numero</label>
							<div class="col-sm-10">
								${protocolos?.numero}
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="iProtocolo" class="col-sm-2 control-label">Data
								do Protocolo </label>
							<div class="col-sm-14">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataProtocolo" name="dataProtocolo"
									required="true" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="iDataEmissao" class="col-sm-2 control-label">Data
								de Emissão </label>
							<div class="col-sm-14">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataEmissao" name="dataEmissao"
									required="true" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNumeroDocumento" class="col-sm-2 control-label">Numero
								do Documento</label>
							<div class="col-sm-10">
								${protocolos.numeroDocumento}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputAssunto" class="col-sm-2 control-label">Assunto</label>
							<div class="col-sm-10">
								${protocolos.assunto}
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputSituacao" class="col-sm-2 control-label">Situação</label>
							<div class="col-sm-10">
								${protocolos.situacao.nome}
							</div>
						</div>

						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Tipo
								de Documento</label>
							<div class="col-sm-10">
								${protocolos.tipoDocumento.nome}
							</div>
						</div>
						<br>

						<div class="form-group">
							<div class="box box-white">
								<table id="listarTramites" class="table table-bordered ">
									<legend class="scheduler-border">Tramitação</legend>
									<thead>
										<tr>
											<th>Data de Disponibilização</th>
											<th>Data de Recebimento</th>
											<th>Funcionário Setor Origem</th>
											<th>Funcionário Setor Destino</th>
										</tr>
										<g:each in='${tramites?}'>
											<tr class="info">

												<td><g:formatDate format="dd/MM/yyyy"  type="datetime" style="MEDIUM"
														date="${it.dataDisponibilizacao}" /></td>

												<td><g:formatDate format="dd/MM/yyyy"  type="datetime" style="MEDIUM"
														date="${it.dataRecebimento}" /></td>

												<td>
													${it.funcionarioSetorOrigem.funcionario.cidadao.pessoaFisica.pessoa.nome}
													-${ it.funcionarioSetorOrigem.setor.nome}
												</td>
												<td>
													${it.funcionarioSetorDestino.funcionario.cidadao.pessoaFisica.pessoa.nome}
													-${ it.funcionarioSetorOrigem.setor.nome}
												</td>
											</tr>
										</g:each>
									</thead>
								</table>
								</br> </br>

								<table id="listarObservacoes" class="table table-bordered">
									<legend class="scheduler-border">Observações</legend>
									<thead>
										<tr>
											<th>Observação</th>
											<th>Data</th>
										</tr>
										<g:each in='${observacoes?}'>
											<tr class="info">
												<td>
													${it.texto}
												</td>
												<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM"
														date="${it.dataObservacao}" /></td>
											</tr>
										</g:each>
									</thead>
								</table>

								<table id="listarAnexos" class="table table-bordered">
									<legend class="scheduler-border">Anexos</legend>
									<thead>
										<tr>
											<th>Nome do Arquivo</th>
											<th style="width:838px">Data</th>
											<th> </th>
										</tr>
										<g:each in="${anexos}">
											<tr class="info">
												<td>
													${it.arquivo}
												</td>

												<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM" 
														date="${it.dataAnexo}" /></td>
												<td>
													<g:link action="downloadFile" params="[id: it.id]"> Baixar </g:link>																									
												</td>
											</tr>
										</g:each>
									</thead>
								</table>
					</fieldset>
					<div style="margin: 0 -1% auto">
						<button class="btn btn-danger btn-flat"
							onClick="printDiv('print')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/protocolo/listarProtocolo/">Voltar</a></li>
						</ul>
						</button>
					</div>
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