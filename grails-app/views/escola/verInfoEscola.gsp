<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Informações da Escola . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
<script>
function printDive(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
  newWin.document.write("<style=''>");
  newWin.document.write("<img src='../static/images/brasao.jpg'; style='width:80px;float:left;margin-top:-9px;'>");

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table>");
  
  newWin.document.write("<h4 style='text-align:center;margin-top:50px;'>${session["escname"]}</h4><br/><br/>");
  newWin.document.write("<h4 style='margin-top:-38px; text-align:center;'>TERMO DE RESPONSABILIDADE</h4>");
  newWin.document.write("<hr><br/><br/>");
  newWin.document.write("<h3 style='text-align:center;margin-top:15%;'>TRANSFERÊNCIA DE ALUNO</h3><br/><br/>");
  newWin.document.write("<p align='Justify' style='center;margin-top:15%;line-height:200%;'>");
  newWin.document.write(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Declaramos, para os fins que se fizerem necessários, que ");

  newWin.document.write(" é aluno(a) vinculado à esta escola, no ");
 
  newWin.document.write(".");
  newWin.document.write("</p>");
  newWin.document.write("<p style='text-align:center;margin-top:15%;'>__________________________________");
  newWin.document.write("<h4 style='text-align:center'>ASSINATURA DA COORDENAÇÃO</h4><br/><br/>");
  newWin.document.write("</p>");
  newWin.document.write("<style type='text/css' >");
  newWin.document.write("#"+id+'{border:none; font-size: 12pt; }');
  newWin.document.write("body{font-family:Arial;}");
  newWin.document.write("img{margin-lefth: 10px;}");
  newWin.document.write("label{text-transform: uppercase; font-weight:bold; }");
  newWin.document.write("</style>");
  newWin.document.write(" ");

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
  
  newWin.document.write ("<p style='font-size:11px;margin-top:10%; margin-left:65%;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+"</p>");

newWin.print();
  newWin.close();
}
</script>

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
	  newWin.document.write("</table>");

	  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
	  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DA ESCOLA");
	  newWin.document.write("<hr>");
      newWin.document.write("</br>");
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
			Escolas <small>Visualizar dados</small>
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
				<g:form controller="Escola" action="listar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset id="print">
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-s-10">
								${pessoa.nome }
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data de Fundação
								</label>
							<div class="col-sm-10">
								<g:formatDate format="dd/MM/yyyy" date="${pessoa.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CNPJ</label>
							<div class="col-sm-10">
								${pessoa.cpfCnpj}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrazaoSocial3" class="col-sm-2 control-label">Razão
								Social</label>
							<div class="col-sm-10">
								${pessoaJuridica.razaoSocial}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputinscricaoEstadual3"
								class="col-sm-2 control-label">Inscrição Estadual</label>
							<div class="col-sm-10">
								${pessoaJuridica.inscricaoEstadual}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">INEP</label>
							<div class="col-sm-10">
								${it.inepDaEscola}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Latitude</label>
							<div class="col-sm-10">
								${it.latitude}
							</div>
						</div>
						<br>
						
												<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Logitude</label>
							<div class="col-sm-10">
								${it.longitude}
							</div>
						</div>
						<br>
						
  						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Bairro</label>
							<div class="col-sm-10">
								${ escolas.pessoaJuridica.pessoa.reside.bairro.bairro[0]}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Logradouro</label>
							<div class="col-sm-10">
								${ escolas.pessoaJuridica.pessoa.reside.logradouro.logradouro[0]}
							</div>
						</div>
						<br>
		
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Número</label>
							<div class="col-sm-10">
								${it.pessoaJuridica.pessoa.reside.numero[0]}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Complemento</label>
							<div class="col-sm-10">
								${escolas.pessoaJuridica.pessoa.reside.complemento[0]}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">CEP</label>
							<div class="col-sm-10">
								${escolas.pessoaJuridica.pessoa.reside.cep[0]}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputinepDaEscola3" class="col-sm-2 control-label">Status</label>
							<div class="col-sm-10">
								${escolas.pessoaJuridica.pessoa.status}
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
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/escola/listar/">Voltar</a></li>
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