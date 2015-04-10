<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Informações da Escola . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<script type="text/javascript">
	$().ready(function() {
		$('#cpf').mask('999.999.999-99');

	});
</script>
</head>
<body>

	<script>
/*function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
  newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}*/
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
  newWin.document.write("<style=''>");
  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DAS ATIVIDADES</h4>");
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
			Atividades <small>Visualizar dados</small>
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
	
			<div style="margin-left: 120px">
				<g:form controller="Escola" action="listar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${atividade?.id}" />
					<fieldset id="print">
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome da atividade</label>
							<div class="col-s-10">
								<h5>${atividade.nomeAtividade }</h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nota Máxima</label>
							<div class="col-s-10">
								<h5>${atividade.notaMaxima }</h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Turma</label>
							<div class="col-s-10">
								<h5>${atividade.turmaDisciplina.turma.turma }</h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputDataInicio3" class="col-sm-2 control-label">Data
								de início</label>
							<div class="col-s-10">
								<h5><g:formatDate format="dd/MM/yyyy - HH:mm" date="${atividade.dataInicio}" /></h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputDataFim" class="col-sm-2 control-label">Data
								de Término</label>
							<div class="col-s-10">
								<h5><g:formatDate format="dd/MM/yyyy - HH:mm" date="${atividade.dataFim}" /></h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">Bimestre</label>
							<div class="col-s-10">
								<h5>${atividade.bimestre}</h5>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">Descrição da atividade</label>
							<div class="col-s-10">
								<h5>${atividade.descricaoAtividade}</h5>
							</div>
						</div>
						<br>					
					</fieldset>
					<div style="margin: 0 15% auto">
						<button class="btn btn-danger btn-flat"
							onClick="printDiv('print')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a style="color: #fff;"
								href="/projetoMetafora/atividade/listar/">Voltar</a></li>
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