<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Atividade . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
		function deletar(id) {
			var resposta = confirm("Deseja exluir este Atividade?");

			if (resposta == true) {
				location.href = "/projetoMetafora/atividade/deletar/" + id
			}

		}
	</script>
	<script>
		function printDiv(id) {
			var divToPrint = document.getElementById(id);
			newWin = window.open("");

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
			Atividade <small>Lançar Notas</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Aluno" action="listar">Atividade</g:link></li>
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
			
			<div style="margin-left: 2px" class="col-sm-12">
				<div class="box box-white" style="margin-bottom: 2%;">
					<g:form controller="Atividade" action="salvarNota" class="form-horizontal">
					<g:hiddenField type="number" name="atividadeId" value="${atividade?.id}"/>
						<fieldset id="print">
							<div class="form-group">
								<div class="col-sm-6">
									<h4 style="font-weight: bold;">${atividade?.nomeAtividade }</h4>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-2" style="text-align: justify;">
									<label>Tipo de Atividade </label>
									<h5>${atividade?.tipoAtividade}</h5>	
								</div>
								<div class="col-sm-1" style="text-align: justify;">
									<label>Bimestre </label>
									<h5>${atividade?.bimestre}</h5>	
								</div>
								<div class="col-sm-1" style="text-align: justify;">
									<label>Nota Máxima </label>
									<h5>${atividade?.notaMaxima}</h5>	
								</div>
								<div class="col-sm-2" style="text-align: justify;">
									<label>Peso da Atividade </label>
									<h5>${atividade?.pesoAtividade}</h5>	
								</div>
								<div class="col-sm-2" style="text-align: justify;">
									<label>Data de Início </label>
									<h5><g:formatDate format="dd/MM/yyyy"
											date="${atividade?.dataInicio}" /></h5>	
								</div>
								<div class="col-sm-2" style="text-align: justify;">
									<label>Data de Termino </label>
									<h5><g:formatDate format="dd/MM/yyyy"
											date="${atividade?.dataFim}" /></h5>	
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-sm-10" style="text-align: justify;">
									<label>Descrição </label>
									<h5>${atividade?.descricaoAtividade}</h5>	
								</div>
							</div>
							<br>
							<div class="form-group">
								<div class="col-sm-10">
									<table id="example" class="table table-striped table-hover">
										<thead>
											<tr>
												<th>Aluno</th>
												<th>Nota</th>
												<th>Observação</th>
											</tr>
										</thead>
										<tbody>	
											
											<%
											def sizeMatriculas =  alunos.id
											def notasMatId = notas.matricula.id
											 %>
											 
											<g:each in="${alunos}" var="aluno">
											
											<tr class='linha_registro'>
												<td>
													${aluno.aluno.cidadao.pessoaFisica.pessoa.nome}
												</td>
												<g:if test="${notasMatId.contains(aluno.id)}">		
														<%
														def index = notasMatId.indexOf(aluno.id)
														 %>
														
															<td>
																<div class="col-xs-5">
												                      	<input style="min-width: 70px;" name="mat-${aluno.id}" type="number" max="${atividade.notaMaxima}" min="0" value="${notas[index].pontuacao}" step="0.1" class="form-control">
												                    </div>
																</td>
																<td>
																	<div class="col-xs-12">
												                      	<input name="mat-${aluno.id}" type="text" value="${notas[index].observacao}" class="form-control">
												                    </div>
																</td>
												</g:if>
												<g:else>
												
														<td>
														<div class="col-xs-5">
										                      	<input style="min-width: 70px;" name="mat-${aluno.id}" type="number" max="${atividade.notaMaxima}" min="0" value="0" step="0.1" class="form-control">
										                    </div>
														</td>
														<td>
															<div class="col-xs-12">
										                      	<input name="mat-${aluno.id}" type="text" class="form-control">
										                    </div>
														</td>
												</g:else>
	
											</tr>
											
											</g:each>
	
											
										</tbody>
									</table>
								</div>
							</div>
							<br>
						</fieldset>
						<div style="margin: 0 28% auto">
							<button style="margin-right: 10px;" class="btn btn-default btn-flat" onClick="printDiv('example')" type="button">
								<i class="glyphicon glyphicon-print"></i> Imprimir
							</button>
							<button class="btn btn-success btn-flat">
								<i class="glyphicon glyphicon-ok"></i> Lançar Notas
							</button>
							<ul style="display: inline-block; margin-left: -30px">
								<li class="btn btn-danger btn-flat"><a style="color: #fff;"
									href="/projetoMetafora/atividade/listar/"><i class="fa fa-close"></i> Cancelar</a></li>
							</ul>
						</div>
						<br>
					</g:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
