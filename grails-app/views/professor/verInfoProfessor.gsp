<!DOCTYPE html>
<%@page import="java.lang.System"%>
<%@page import="br.gov.rn.saogoncalo.academico.Disciplina"%>
<%@page import="br.gov.rn.saogoncalo.pessoa.Professor"%>
<%@page
	import="br.gov.rn.saogoncalo.academico.DisciplinaLecionadaPorProfessor"%>
<html lang="pt-br">
<head>
<title>Editar Professor . Módulo Pessoal</title>
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
	  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DO PROFESSOR</h4>");
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
			Professores <small>Visualizar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Professor" action="listar">Professores</g:link></li>
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
			<g:each in='${professores?}'>
				<g:set var="pessoa"
					value="${it.funcionario.cidadao.pessoaFisica.pessoa}" />
				<g:set var="funcionario" value="${it.funcionario }" />
				<g:set var="pessoaFisica"
					value="${it.funcionario.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.funcionario.cidadao}" />
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Professor" action="listar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset id="print">
					
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								
									 ${pessoa.nome }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Nascimento</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataDeNascimento"
									value="${pessoa.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CPF</label>
							<div class="col-sm-10">
								${pessoa.cpfCnpj }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNumero3" class="col-sm-2 control-label">Número
								do Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcNumero }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoCartorio3"
								class="col-sm-2 control-label">Nome do Cartório do
								Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcNomeDoCartorio }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoLivro3" class="col-sm-2 control-label">Nome
								do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcNomeDoLivro }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcFolhaDoLivro3" class="col-sm-2 control-label">Folha
								do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								${pessoaFisica.rcFolhaDoLivro }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputsexo3" class="col-sm-2 control-label">Sexo</label>
							<div class="col-sm-10">
								${pessoaFisica.sexo }
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
							<label for="inputprofissao3" class="col-sm-2 control-label">Profissão</label>
							<div class="col-sm-10">
								${cidadao.profissao }
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputcargaHoraria3" class="col-sm-2 control-label">Carga
								Horária</label>
							<div class="col-sm-10">
								${funcionario.cargaHoraria}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputmatricula3" class="col-sm-2 control-label">Matricula</label>
							<div class="col-sm-10">
								${funcionario.matricula}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputidentificacao3" class="col-sm-2 control-label">Identificação</label>
							<div class="col-sm-10">
								${it.identificacao}
							</div>
						</div>
						<br>
						<div class="form-group" style="min-height: 150px;">
							<label for="inputdlpp3" class="col-sm-2 control-label">Disciplinas
								do Professor</label>
							<div class="col-sm-10">
								

									<g:each in="${disc}" var="allDisc">
										
											<g:if test="${dlppl.contains(allDisc.id)}">
											
												
													${allDisc.disciplina} <br>
												
											</g:if>
											
										
									</g:each>					

								
							</div>
						</div>
						<br>

					</fieldset>
					<div style="margin: 0 15% auto">
						<button class="btn btn-danger btn-flat" onClick="printDiv('print')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/professor/listar/">Voltar</a></li>
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