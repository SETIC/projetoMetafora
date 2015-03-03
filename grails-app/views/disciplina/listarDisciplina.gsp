<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Disciplina . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
  newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir esta Disciplina?");

        if (resposta == true){
        location.href="/projetoMetafora/disciplina/deletar/"+id }

       }
 </script>
	<section class="content-header">
		<h1>
			Disciplinas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Disciplina" action="listar">Disciplinas</g:link></li>
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
			<table id="" class="table table-striped table-hover example">
				<g:if test="${!disciplinas?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 50px;"></th>
						<th style="width: 550px;">Disciplina</th>
						<th style="width: 550px;">Carga Horária</th>
					</tr>
				</thead>
				<tbody>
					<g:each in='${disciplinas?}'>
						<tr class='linha_registro'>
							<td>
								<div style="margin-left: -35px" class="opcoes">
									<ul style="display: inline">
										
										<g:if test="${perm2 }">
										
										
										<li class="btn btn-primary btn-xs btn-flat"><a
											style="color: #fff"
											href="/projetoMetafora/disciplina/editarDisciplina/${it.id}"><span
												class="glyphicon glyphicon-pencil"></span></a></li>
										<li onclick="deletar(${it.id})"
											class="btn btn-danger btn-xs btn-flat"><span
											class="glyphicon glyphicon-remove"></span></li>	
											</g:if>
											
											
									</ul>
								</div>
							</td>

							<td>
								${it.disciplina}

							</td>
							<td>
								${it.cargaHoraria}
							</td>

						</tr>
					</g:each>

				</tbody>
			</table>
			
			<!-- Button trigger modal -->
			
										<g:if test="${perm2 }">
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Disciplina
			</button>
			</g:if>
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			<!-- Modal -->
			
			
			<g:if test="${perm2 }">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de
								Disciplina</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Disciplina" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Nome da Disciplina</label>
										<div class="controls">
											<g:textField class="form-control" required="true"
												name="disciplina" value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Carga Horária</label>
										<div class="controls">
											<g:textField class="form-control" name="cargaHoraria"
												value="" required="true" />
										</div>
									</div>
									<br>

								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Cadastrar</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>
			</g:if>
		</div>
	</section>
</body>
</html>
