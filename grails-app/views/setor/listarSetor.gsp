<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Setor . Módulo Protocolo</title>
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
        var resposta = confirm("Deseja exluir este Setor?");

        if (resposta == true){
        location.href="/projetoMetafora/setor/deletar/"+id }

       }
 </script>
	<section class="content-header">
		<h1>
			Setores <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Setor" action="listar">Setor</g:link></li>
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
				<table id="listarSetor"
					class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th>Nome</th>
							<th>Sigla</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${setor?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">

											<g:if test="${perm2}">
												<li class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/setor/editarSetor/${it.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
												<li onclick="deletar(${it.id})"
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
									${it.sigla}
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
					<i class="fa fa-plus"></i> Novo Setor
				</button>
			</g:if>

			<button class="btn btn-danger btn-flat"
				onClick="printDiv('listarSetor')">
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
								<h4 class="modal-title" id="myModalLabel">Cadastro de Setor</h4>
							</div>
							<div class="modal-body">
								<g:form controller="Setor" action="salvar" class="form">
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
											<label>Sigla</label>
											<div class="controls">
												<g:textField class="form-control" name="sigla"
													required="true" value="" />
											</div>
										</div>
										<br>

										<div class="form-heading">
											<label>Funcionários</label>
											<div class="controls">
												<g:select class="form-control selectpicker"
													data-live-search="true" name="funcionarios"
													multiple="multiple"
													from="${funcionarios.cidadao.pessoaFisica.pessoa}" value=""
													optionKey="id" optionValue="nome" onchange="myFunction()"/>
											</div>
										</div>
										
										
									
										
										
										<br />
										<div class="form-heading" >
											<label>Responsável</label>
											<table id="table-responsavel" class="table table-hover">
												<thead>
													<tr>
														<th>#</th>
														<th>Nome</th>
														<th>Opções</th>
													</tr>
												</thead>
												</div id="dv" >
												<tbody>
												
												</tbody>
												</div>
											</table>
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
		<script>
			function myFunction() {

			    var table = document.getElementById("table-responsavel");
 
			    //for(var i = table.rows.length - 1; i > 0; i--){
			    //    table.deleteRow(i);
			    //    console.log(i);
			    // }
			    
			   //document.getElementById("table-responsavel").innerHTML="";

				while(table.rows.length > 1) {
				  table.deleteRow(1);
				}	
			    
			    var row = table.insertRow(1);
			    
			    var id = row.insertCell(0);
			    var nome = row.insertCell(1);
			    var opcoes = row.insertCell(2);

			    
			    var funcionarios = document.getElementsByClassName("filter-option pull-left");
			 

			    var str = funcionarios[0].innerText;
			    

			    var res = str.split(",");

			    console.log(str);
			    
			    for (i = 0; i < res.length; i++){

			    	var row = table.insertRow(i+1);
				    
				    var id = row.insertCell(0);
				    var nome = row.insertCell(1);
				    var opcoes = row.insertCell(2);
				    
			    	id.innerHTML = "<input type=\"checkbox\" value=\""+res[i]+"\">";
			    	nome.innerHTML = res[i];
			    	opcoes.innerHTML = "<button type=\"button\" class=\"btn btn-danger btn-xs\"><i class=\"fa fa-minus\"></i></button>";
			    }

			}
	
		</script>
	</section>
</body>
</html>