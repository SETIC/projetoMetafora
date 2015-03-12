<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Escola . Módulo Pessoal</title>
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
        var resposta = confirm("Deseja exluir esta Escola?");

        if (resposta == true){
        location.href="/projetoMetafora/escola/deletar/"+id }

       }
 </script>
	<section class="content-header">
		<h1>
			Escolas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Escola" action="listar">Escolas</g:link></li>
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
			<table id="" class="table table-hover example">
				<g:if test="${!escolas?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 65px;"></th>
						<th style="width: 500px;">Nome</th>
						<th style="width: 200px;">CNPJ</th>
						<th style="width:;">Data de Fundação</th>
						<th style="width:;">INEP</th>
						<th style="width:;">Situação</th>
					</tr>
				</thead>
				<tbody>
					<g:each in='${escolas?}'>
						<g:set var="pessoa" value="${it.pessoaJuridica.pessoa}" />
						<g:set var="pessoaJuridica" value="${it.pessoaJuridica}" />
						
						<g:if test="${pessoa.status == 'Ativo'}">
							<tr class='linha_registro success'>
						</g:if>
						<g:else>
							<tr class='linha_registro'>
						</g:else>
							<td>
								<div style="margin-left: -35px" class="opcoes">
									<ul style="display: inline">
										
											<g:if test="${perm2}">
										<li class="btn btn-primary btn-xs btn-flat"><a
											style="color: #fff"
											href="/projetoMetafora/escola/editarEscola/${pessoa.id}"><span
												class="glyphicon glyphicon-pencil"></span></a></li>
										<li onclick="deletar(${pessoa.id})"
											class="btn btn-danger btn-xs btn-flat"><span
											class="glyphicon glyphicon-remove"></span></li>
										</g:if>
										
										<li class="btn btn-success btn-xs btn-flat"><a style="color: #fff"
											href="/projetoMetafora/escola/verInfoEscola/${pessoa.id}"><span
												class="glyphicon glyphicon-eye-open"></span></a></li>
									</ul>

								</div>
							</td>
							<td>
								${pessoa.nome}
							</td>
							<td>
								${pessoa.cpfCnpj}
							</td>
							<td><g:formatDate format="dd/MM/yyyy"
									date="${pessoa.dataDeNascimento}" /></td>

							<td>
								${it.inepDaEscola}
							</td>
							<td>
								<g:if test="${pessoa.status == 'Ativo'}">
									<span class="label label-success">Ativo</span>
								</g:if>
								<g:else>
									<span class="label label-danger">Inativo</span>
								</g:else>
							</td>
					</g:each>

				</tbody>
			</table>
			
			<!-- Button trigger modal -->
			
			<g:if test="${perm2}"> 
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal"><i class="fa fa-plus"></i> Nova Escola</button>
				</g:if>

				
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Escola</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Escola" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Nome</label>
										<div class="controls">
											<g:textField class="form-control" required="true" name="nome"
												value="" required="true"/>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Data de Fundação</label>
										<div class="controls">
											<g:formatDate format="yyyy-MM-dd" date="${date}" />
											<g:datePicker noSelection="['':'']" precision="day"
												class="form-control" required="true" name="dataDeNascimento"
												value="" />

										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>CNPJ</label>
										<div class="controls">
											<g:textField class="form-control" required="true" id="cpf"
												name="cpfCnpj" value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Razão Social</label>
										<div class="controls">
											<g:textField class="form-control" name="razaoSocial" value=""  required="true"/>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Inscrição Estadual</label>
										<div class="controls">
											<g:textField class="form-control" name="inscricaoEstadual"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>INEP</label>
										<div class="controls">
											<g:textField class="form-control" name="inepDaEscola"
												value="" required="true"/>
										</div>
									</div>
									<br>
								</fieldset>
								
									<button type="submit" class="btn btn-primary btn-flat"> Cadastrar</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
						
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>