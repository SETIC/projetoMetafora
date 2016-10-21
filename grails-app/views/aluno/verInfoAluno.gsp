<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Aluno . Módulo Pessoal</title>
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
	  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DO ALUNO</h4>");
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
			Alunos <small>Visualizar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Aluno" action="listar">Alunos</g:link></li>
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
			<g:each in='${alunos?}'>
				<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
				<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.cidadao}" />
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Aluno" action="listar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset id="print">
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								${pessoa.nome}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Nascimento</label>
							<div class="col-sm-10">
								<g:formatDate format="dd/MM/yyyy" date="${pessoa.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CPF</label>
							<div class="col-sm-10">
								${pessoa.cpfCnpj}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNumero3" class="col-sm-2 control-label">Número
								do Registro de Cartório</label>
							<div class="col-sm-10">
									${pessoaFisica.rcNumero}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoCartorio3"
								class="col-sm-2 control-label">Nome do Cartório do
								Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcNomeDoCartorio}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoLivro3" class="col-sm-2 control-label">Número do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcNomeDoLivro}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcFolhaDoLivro3" class="col-sm-2 control-label">Folha
								do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcFolhaDoLivro}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data do Registro</label>
							<div class="col-sm-10">
								<g:formatDate format="dd/MM/yyyy" date="${pessoaFisica.rcDataDoRegistro}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcFolhaDoLivro3" class="col-sm-2 control-label">Cidade do Registro</label>
							<div class="col-sm-10">
								${pessoaFisica.rcCidade}
							</div>
						</div>
						<br>

						
						<div class="form-group">
							<label for="inputsexo3" class="col-sm-2 control-label">Sexo</label>
							<div class="col-sm-10">
								${pessoaFisica.sexo}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputnacionalidade3" class="col-sm-2 control-label">Nacionalidade</label>
							<div class="col-sm-10">
								${cidadao.nacionalidade}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputestadoCivil3" class="col-sm-2 control-label">Estado
								Civil</label>
							<div class="col-sm-10">
								${cidadao.estadoCivil}
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputnumeroDeInscricao3"
								class="col-sm-2 control-label">Número de Inscrição</label>
							<div class="col-sm-10">
								${it.numeroDeInscricao}
								
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Nome do pai</label>
							<div class="col-sm-10">
							<g:if test="${parentescoPai != null}">
								${parentescoPai.pessoa.nome}
							</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Nome da mãe</label>
							<div class="col-sm-10">
							<g:if test="${parentescoMae != null}">
								${parentescoMae.pessoa.nome}
							</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">CEP</label>
							<div class="col-sm-10">
								<g:if test="${reside != null}">
									${reside.cep}
								</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Logradouro</label>
							<div class="col-sm-10">
								<g:if test="${reside != null}">
									${reside.logradouro.logradouro}
								</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Número</label>
							<div class="col-sm-10">
							<g:if test="${reside != null}">
								${reside.numero}
							</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Complemento</label>
							<div class="col-sm-10">
							<g:if test="${reside != null}">
								${reside.complemento}
							</g:if>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Bairro</label>
							<div class="col-sm-10">
							<g:if test="${reside != null}">
								${reside.bairro.bairro}
							</g:if>
								
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">UF</label>
							<div class="col-sm-10">
							<g:if test="${reside != null}">
								${reside.bairro.municipio.estado.abreviacao}
							</g:if>
								
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai"
								class="col-sm-2 control-label">Município</label>
							<div class="col-sm-10">
							<g:if test="${reside != null}">
								${reside.bairro.municipio.municipio}
							</g:if>
								
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label"> RG </label>
							<div class="col-sm-10">
							
								${cidadao.rgNumero}
 								
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label"> RG - Data de Emissão </label>
							<div class="col-sm-10">
							
								${cidadao.rgDataDeEmissao}
 								
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label"> RG - Orgão expedidor </label>
							<div class="col-sm-10">
							
								${cidadao.rgOrgaoExpedidor}
 								
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label"> RG - Complemento </label>
							<div class="col-sm-10">
							
								${cidadao.rgComplemento}
 								
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label">Cor/Raça </label>
							<div class="col-sm-10">
							
								${pessoaFisica.cor}
 								
							</div>
						</div>
						<br>
						
						
						<div class="form-group">
							<label for="inputNomePai" class="col-sm-2 control-label">Necessidades Especiais</label>
							<div class="col-sm-10">
							
								<g:each in="${pessoaFisicaNecessidadesEspeciais}">
									${it.necessidadesEspeciais.descricao} <br>								
																	
								</g:each>
 								
							</div>
						</div>
						<br>
						
					
				
				<table id="notas" class="table table-striped">
					<thead>
						<tr>
							<th style="text-align: left;">Disciplina</th>
							<th style="text-align: left;">1º Bimestre</th>
							<th style="text-align: left;">2º Bimestre</th>
							<th style="text-align: left;">3º Bimestre</th>
							<th style="text-align: left;">4º Bimestre</th>
							<th style="text-align: left;">Recuperação</th>
							<th style="text-align: left;">Prova Final</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${notas?}' var="notasAluno">
							<tr class='linha_registro'>
								<td>
									${notasAluno.disciplina}
								</td>
								<td>
									${notasAluno.nota1}
								</td>
								<td>
									${notasAluno.nota2}
								</td>
								<td>
									${notasAluno.nota3}
								</td>
								<td>
									${notasAluno.nota4}
								</td>
								<td>
									${notasAluno.nota5}
								</td>
								<td>
									${notasAluno.nota6}
								</td>
	
							</tr>
						</g:each>
					</tbody>
				</table>
						
						
						
                      </fieldset>
                      
                      <table id="listarDocumentosAluno" class="table table-bordered">
									<legend class="scheduler-border">Documentos</legend>
									<thead>
										<tr>
											<th>Nome do Documento</th>
											<th style="width:395px">Data</th>
											<th> </th>
										</tr>
										<g:each in="${documentosAluno}">
											<tr class="info">
												<td>
													${it.arquivo}
												</td>
												<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM"
														date="${it.dataDocumento}" /></td>
												<td>
												<g:link action="downloadDocumento" enctype="multipart/form-data" params="[id: it.id]">Baixar</g:link>

												</td>
											</tr>
										</g:each>
									</thead>
								</table>
					<div style="margin: 0 15% auto">
						<button class="btn btn-danger btn-flat" onClick="printDiv('print')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>	
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/aluno/listar/">Voltar</a></li>
						</ul>
					</div>
					<br>	
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