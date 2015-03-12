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
			newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
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
			<div style="margin-left: 120px">
				<g:form controller="Aluno" action="listar" class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset id="print">
						<div class="form-group">
							<div class="col-sm-10">
								<h4 style="font-weight: bold;">Descobrimento do Brasil</h4>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="col-sm-10" style="text-align: justify;">
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Uma pesquisa sobre a descoberta, ou descobrimento do Brasil que refere-se à chegada, em 22 de abril 
								de 1500, da frota comandada por Pedro Álvares Cabral ao território onde hoje se localiza o 
								Brasil. O termo "descobrir" é utilizado nesse caso em uma perspectiva eurocêntrica, 
								referindo-se estritamente à chegada de europeus, mais especificamente portugueses, às 
								terras de "Vera Cruz", o atual Brasil, que já eram habitadas por vários povos indígenas. 
								Tal descoberta faz parte dos descobrimentos portugueses.</p>	
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
										</tr>
									</thead>
									<tbody>		
										<tr class='linha_registro'>
											<td>
												ROBERTO MANAIA DOS SANTOS JUNIOR
											</td>
											<td>
												<div class="col-xs-3">
							                      	<input type="text" class="form-control" placeholder="">
							                    </div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br>
					</fieldset>
					<div style="margin: 0 28% auto">
						<button class="btn btn-success btn-flat">
							<i class="glyphicon glyphicon-ok"></i> Lançar Notas
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-danger btn-flat"><a style="color: #fff;"
								href="/projetoMetafora/atividade/listar/">Cancelar</a></li>
						</ul>
					</div>
					<br>
				</g:form>
			</div>
		</div>
	</section>
</body>
</html>
