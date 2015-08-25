<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Gerar Relatorio do Funcionario</title>
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
			  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
			  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>RELAÇÃO DE SERVIDORES</h4>");
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
			<center>Relação de Servidores</center>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Funcionario" action="gerarRelatorio">Funcionários</g:link></li>
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


			
					
				<g:form controller="Funcionario" action="pesquisarFuncionariosByEscola" class="form">
				<div class="form-heading">
				<label style="margin-left:15px;">Escola</label>
			

					<select class="col-sm-6 selectpicker" data-live-search="true"
						name="escola" id="comboEscola">
						<option value="0" disabled="disabled" selected="selected">
							Selecione uma escola</option>
						<g:each in="${escolas}">

							<option value="${it.id}">
								${it.pessoaJuridica.razaoSocial}
							</option>
						</g:each>
					</select>

					<button style="margin-left: 55%; margin-top: -56px;"
						type="submit" class="btn btn-primary btn-flat">
						<i class="glyphicon glyphicon-search"></i> Buscar
					</button>
				</g:form>
					
					

		

			</div>
			
			

				<table id="listarFuncionarios"
					class="table table-striped table-hover table-bordered example">

					<g:if test="${!funcionarios?.isEmpty()})"></g:if>
					<thead>
						<tr class = "table table-bordered">
									<th style="width: 20px;">Nº</th>
									<th style="width: 20px;">Nome</th>
									<th style="width: 20px;">Matricula</th>
									<th style="width: 20px;">Cargo</th>
									<th style="width: 20px;">Turno</th>
									<th style="width: 20px;">Funcão</th>
									<th style="width: 20px;">Vinculo</th>
						</tr>
					</thead>
					<tbody>
					    <g:set var="i" value="${1}" />
						<g:each in='${funcionarios?}'>

								
                                    <tr class="success">
									<td>
											${i++}
										</td>
										<td>
											${it.cidadao.pessoaFisica.pessoa.nome}
										</td>
										<td>
											${it.matricula}
										</td>
										<td>
											${it.lotacao.cargo.cargo[0]}
										</td>
										<td>
											${it.lotacao.turno[0]}
										</td>
										<td>
											${it.lotacao.funcao[0]}
										</td>
										<td>
											${it.lotacao.vinculo[0]}
										</td>
								</tr>
							
						</g:each>

					</tbody>
				</table>


						<button class="btn btn-danger btn-flat"
							onClick="printDiv('listarFuncionarios')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>

	</section>
</body>
</html>