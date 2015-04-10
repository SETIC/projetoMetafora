<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Aluno . Módulo Pessoal</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir este Aluno?");

        if (resposta == true){
        location.href="/projetoMetafora/aluno/deletar/"+id }

       }
 </script>
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

	<section class="content-header">
		<h1>
			Alunos <small>Visualização e Gerenciamento</small>
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
			<div class="box box-white">
				<table id="" class="table table-striped table-hover example">
					<g:if test="${!alunos?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 100px;">Funções</th>
							<th style="width: 350px;">Nome</th>
							<th style="width: 80px;">CPF</th>
							<th style="width: 80px;">Data de Nascimento</th>
							<th style="width: 110px;">Sexo</th>
							<th style="width: 80px;">Estado Civil</th>
							<th style="width: 100px; text-align: center;">Situação</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${alunos?}'>
							<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
							<g:set var="cidadao" value="${it.cidadao}" />
							<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
	
							<g:if test="${escolaid == escid}">
	
								<tr class='linha_registro'>
									<td>
										<div style="margin-left: -35px" class="opcoes">
											
											
											<ul style="display: inline">
												
										<g:if test="${perm2}">
											
											<li title="Editar Aluno" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/aluno/editarAluno/${pessoa.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>

												
												
												<li title="Remover Aluno" onclick="deletar(${pessoa.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></li>
												
										
												
												<li title="Transferir Aluno" data-toggle="tooltip"
												data-placement="top" class="btn btn-warning btn-xs btn-flat"><a style="color: #fff"
													href="/projetoMetafora/aluno/transferencia/${pessoa.id}"><span
														class="glyphicon glyphicon-arrow-right"></span></a></li>
										
										</g:if>
											
													
												<li title="Ver detalhes de Aluno" class="btn btn-success btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/aluno/verInfoAluno/${pessoa.id}"><span
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
										${pessoaFisica.sexo}
									</td>
									<td>
										${cidadao.estadoCivil}
									</td>
									<td style="text-align: center;">
										<g:if test="${pessoa.status == 'Ativo'}">
											<span class="label label-success">Ativo</span>
										</g:if>
										<g:else>
											<span class="label label-danger">Inativo</span>
										</g:else>
									</td>
								</tr>
							</g:if>
						</g:each>
	
					</tbody>
				</table>
			</div>	
			
			<!-- Button trigger modal -->
			<g:if test="${perm2}">
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Novo Aluno
			</button>
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
							<h4 class="modal-title" id="myModalLabel">Cadastro de Aluno</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Aluno" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Nome</label>
										<div class="controls">
											<g:textField class="form-control" required="true" name="nome"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Data de Nascimento</label>
										<div class="controls">
											<g:formatDate format="yyyy-MM-dd" date="${date}" />
											<g:datePicker noSelection="['':'']" precision="day"
												class="form-control" required="true" name="dataDeNascimento"
												value="" />

										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>CPF</label>
										<div class="controls">
											<g:textField class="form-control" id="cpf" name="cpfCnpj"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Número do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNumero" value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nome do Cartório do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNomeDoCartorio"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nome do Livro do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcNomeDoLivro"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Folha do Livro do Registro de Cartório</label>
										<div class="controls">
											<g:textField class="form-control" name="rcFolhaDoLivro"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Sexo</label>
										<div class="controls">
											<label class="radio-inline"> <input type="radio"
												name="sexo" id="inlineRadio1" value="MASCULINO">
												MASCULINO
											</label> <label class="radio-inline"> <input type="radio"
												name="sexo" id="inlineRadio2" value="FEMININO">
												FEMININO
											</label>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nacionalidade</label>
										<div class="controls">
											<g:textField class="form-control" required="true"
												name="nacionalidade" value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Estado Civil</label>
										<div class="controls">
											<select class="form-control" name="estadoCivil">
												<option value="null">Selecione...</option>
												<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
												<option value="CASADO(A)">CASADO(A)</option>
												<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
												<option value="VIÚVO(A)">VIÚVO(A)</option>
											</select>
										</div>
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
		</div>
	</section>
	
</body>
</html>
