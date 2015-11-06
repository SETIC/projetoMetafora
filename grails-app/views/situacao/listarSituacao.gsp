<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Situacao . Módulo Protocolo</title>
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
        var resposta = confirm("Deseja exluir esta situacao?");

        if (resposta == true){
        location.href="/projetoMetafora/situacao/deletar/"+id }

       }
 </script>
	<section class="content-header">
		<h1>
			Situações <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Situacao" action="listar">situacao</g:link></li>
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
			<div class="box box-white">
				<table id="listarSituacao" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th>Nome</th>
							<th>Tipo</th>
							
						</tr>
					</thead>
					<tbody>
						<g:each in='${situacao?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">
	
											<g:if test="${perm2}">
												<li title="Editar situacao"
												    class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/situacao/editarSituacao/${it.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
												<li title="Excluir situacao"
												    onclick="deletar(${it.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></li>
											</g:if>
										</ul>
	
									</div>
								</td>
								
								<td>
									${it.nome}
								</td>
								<td>
						      <g:if test="${ it.tipo == 'I'}">
									Inicio
									 </g:if>
						      <g:if test="${ it.tipo == 'N'}">
									 Nenhum
									 </g:if>
						      <g:if test="${ it.tipo == 'F'}">
									Fim
									 </g:if> 
								</td>	 
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>

			<!-- Button trigger modal -->
			<g:if test="${perm2}">		
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Situacão
			</button>
			</g:if>
			
			<button class="btn btn-danger btn-flat" onClick="printDiv('listarSituacao')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			<!-- Modal -->
			<g:if test="${perm2}">	
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Situacão</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Situacao" action="salvar" class="form">
								<fieldset>
									
									<div class="form-heading">
										<label>Nome</label>
										<div class="controls">
											<g:textField class="form-control" name="nome" value=""
												required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Tipo</label>
										<div class="controls">
											<select class="form-control" name="tipo">
												<option value='I'>Inicio</option>
												<option value='N'>Fim</option>
												<option value='F' selected>Nenhum</option>
											</select>
										</div>
									<br>
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
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