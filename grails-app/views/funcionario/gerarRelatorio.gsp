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
		<br>
			<label style="margin-left:15px;">Relação por Escola</label><select class="col-sm-6 selectpicker" data-live-search="true"
				name="escola" id="comboEscola" onchange="mudarEscola();">
				<option value="0" disabled="disabled" selected="selected">
					Selecione uma escola</option>
				<g:each in="${escolas}">
					<option value="${it.id}">
						${it.pessoaJuridica.razaoSocial}
					</option>
				</g:each>
			</select><button style="margin-left: 65%; margin-top: -56px;" type="submit" class="btn btn-primary btn-flat">
								<i class="glyphicon glyphicon-search"></i> Buscar
							</button>
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

			<div style="margin-left: 10px">
				<g:form controller="Funcionario" action="gerarRelatorio"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<div id="print" class="box box-white">

						<!-- 	<g:form controller="Funcionario" action="pesquisarFuncionarios"
					class="form">
					<div class="form-group">
						<label for="inputPesquisa" class="col-sm-2 control-label">NOME/MATRICULA:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="" />
							<button style="margin-left: 36%; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="fa fa-save"></i> Buscar
							</button>
						</div>
					</div>
				</g:form>
					
					 -->
						<table id="" class="table table-bordered">
							<thead>
								<tr class ="success">
									<th style="width: 20px;">Nº</th>
									<th style="width: 20px;">Nome</th>
									<th style="width: 20px;">Matricula</th>
									<th style="width: 20px;">Cargo</th>
									<th style="width: 20px;">Turno</th>
									<th style="width: 20px;">Funcão</th>
									<th style="width: 20px;">Vinculo</th>
                                    <th style="width: 20px;">Escola</th>
                                      									
								</tr>
							</thead>
							<tbody>
								<g:set var="i" value="${1}" />
								<g:each in='${funcionario?}'>
									<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
									<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
									<g:set var="cidadao" value="${it.cidadao}" />

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
										<td>
										<g:findAll in="${escola}" expr="it.escola == 8 ">
                                         <p>escola: ${pessoaJuridica.razaoSocial}</p>
										</td>
                                        </g:findAll>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
					<div style="margin: 0%">
						<button class="btn btn-danger btn-flat"
							onClick="printDiv('print')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/funcionario/gerarRelatorio/">Voltar</a></li>
						</ul>
				</g:form>
	</section>
</body>
</html>