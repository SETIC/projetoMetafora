<!DOCTYPE html>

<html lang="pt-br">
<head>
<title>Editar Turma . Módulo Acadêmico</title>
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

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table><br>");
  
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
	<section class="content-header">
		<h1>
			Turmas <small>Visualizar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turma" action="listar">Turmas</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content" style="min-height: 875px;">
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
			<g:each in='${turmas?}'></g:each>
			<div style="margin-left: 120px;">
				<g:form controller="Turma" action="listar" class="form-horizontal">
					<g:hiddenField name="id" value="${it.id}" />
					<div id="print">
						<div class="form-group">
							<label for="escola" class="col-sm-2 control-label">Escola</label>
							<div class="col-sm-8">
								${it.escola.pessoaJuridica.pessoa.nome}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Nome da
								Turma</label>
							<div class="col-sm-3">
								${it.turma}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Turno</label>
							<div class="col-sm-3">
								${it.turno}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="vagas" class="col-sm-2 control-label">Nº de
								Vagas</label>
							<div class="col-sm-3">
								${it.vagas}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Série</label>
							<div class="col-sm-4">
								${it.serie.serie}
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="disciplinas" class="col-sm-2 control-label">Disciplinas</label>
							<div class="col-sm-4">

								<g:each in='${dlpp}' var="dlppl">
									<g:if test="${td.contains(dlppl.id)}">
										${dlppl.professor.funcionario.cidadao.pessoaFisica.pessoa.nome} - 
										${dlppl.disciplina.disciplina}
										<br>
									</g:if>

								</g:each>


							</div>
						</div>
						<br>

						<div class="form-group">


							<label for="matriculados" class="col-sm-2 control-label">Matriculados</label>
							<div class="col-sm-4">
								<table id="example" class="table table-striped table-hover">
									<g:each in='${matriculados?}' var="alunosMatriculados"
										status="i">


										<tr class='linha_registro'>
											<td>
												<div style="margin-left: -45px" class="opcoes">
													<ul style="display: inline">

														<li class="btn btn-primary btn-xs btn-flat"><a
															style="color: #fff"
															href="/projetoMetafora/matricula/listar"><span
																class="glyphicon glyphicon-pencil" alt="Editar Matricula"></span></a></li>

													</ul>
												
												</div>
											</td>
											<td>
												${i+1} - ${alunosMatriculados.nome}
											</td>

										</tr>

									</g:each>
								</table>


							</div>
						</div>
						<br>

					</div>
					<div style="margin: 0 15% auto">
						<button class="btn btn-danger btn-flat"
							onClick="printDiv('print')">
							<i class="glyphicon glyphicon-print"></i> Imprimir
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info btn-flat"><a
								href="/projetoMetafora/turma/listar/">Voltar</a></li>
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
