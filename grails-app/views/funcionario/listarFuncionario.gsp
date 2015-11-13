<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Funcionário . Módulo Pessoal</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir este Funcionário?");

        if (resposta == true){
        location.href="/projetoMetafora/funcionario/deletar/"+id }

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
			Funcionários <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Funcionario" action="listar">Funcionários</g:link></li>
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
				<g:form controller="Funcionario" action="pesquisarFuncionarios"
					class="form">
					<div class="form-group">
						<label for="inputPesquisa" class="col-sm-2 control-label">NOME/CPF:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="" />
							<button style="margin-left: 36%; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="fa fa-save"></i> Buscar
							</button>
						</div>
					</div>
				</g:form>
				<table id="listarFuncionario" class="table table-striped table-hover example">
					<g:if test="${!funcionarios?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 65px;"></th>
							<th style="width: 280px;">Nome</th>
							<th style="width:;">Matricula</th>
							<th style="width:;">Cargo</th>						
							<th style="width:;">Vínculo</th>
							<th style="width:;">Função</th>
							<th style="width:65px;">Turno</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${funcionarios?}'>

							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">

											<g:if test="${perm2}">

												<li title="Editar Funcionario "
													class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/funcionario/editarFuncionario/${it.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
												<li title="Remover Funcionario"
													onclick="deletar(${it.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></li>

											</g:if>
											<li title="Ver detalhes do Funcionario"
												class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/funcionario/verInfoFuncionario/${it.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></li>
										</ul>
									</div>
								</td>
								<td>
									${it?.cidadao.pessoaFisica.pessoa.nome}
								</td>
								<td>
									${it?.matricula}
								</td>
								<td>
									 ${it.lotacao.cargo.cargo[0]}
								</td>								
								<td>
									${it.lotacao.vinculo[0]}
								</td>
								<td>
									${it?.lotacao.funcao[0]}
								</td>
								<td>
									${it?.lotacao.turno[0]}
								</td>
							</tr>
						</g:each>

					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			<g:if test="${perm2 }">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal">
					<i class="fa fa-plus"></i> Novo Funcionário
				</button>
			</g:if>
			<button class="btn btn-danger btn-flat" onClick="printDiv('listarFuncionario')">
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
							<h4 class="modal-title" id="myModalLabel">Cadastro de
								Funcionário</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Funcionario" action="salvar" class="form">
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
											<g:textField class="form-control" required="true" id="cpf"
												name="cpfCnpj" value="" />
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
										<label>Vinculo </label>
										<div class="controls">
											<select class="form-control" name="vinculo">
												<option value="EFETIVO">EFETIVO</option>
												<option value="COMISSIONADO">COMISSIONADO</option>
												<option value="ESTAGIARIO">ESTAGIARIO</option>
												<option value="TERCEIRIZADO">TERCEIRIZADO</option>
											</select>
										</div>
										<br>
										<div class="form-heading">
											<label>Função</label>
											<div class="controls">
												<div class="controls">
													<g:textField class="form-control" required="true"name="funcao" value="" />
												</div>
											</div>
											<br>
										</div>
										<div class="form-heading">
											<label>Cargo</label>
											<div class="controls">
												<select class="form-control selectpicker" data-live-search="true"
												id="cargo" name="cargoId" onChange="habilitarDisciplinas()">
													<g:each in="${cargos}">
														<option value="${it.id}">
															${it.cargo}
														</option>
													</g:each>
												</select>
											</div>
										</div>
                                        <br>
                                              
                                              <div id="divDisciplinas" style="display: none;" class="form-heading">
													<label>Disciplinas</label>
													<div class="controls">
														<g:select class="form-control selectpicker"
															data-live-search="true"
															name="disciplinaProf" multiple="multiple"
															from="${br.gov.rn.saogoncalo.academico.Disciplina.list() }"
															value="${id}" optionKey="id" optionValue="disciplina" />
													</div>
											  <br>
											  </div>
											  
											<script>
												function habilitarDisciplinas() {
												    var cargo = document.getElementsByClassName("filter-option pull-left");
												    if(cargo[0].innerText == "PROFESSOR" || cargo[0].innerText == "PROFESSOR PI G") {
												    	document.getElementById("divDisciplinas").style.display = "block";   
													} else {
												    	document.getElementById("divDisciplinas").style.display = "none";
													}
												}
											</script>
											<div class="form-heading">
												<label>Turno</label>
												<div class="controls">
													<label class="checkbox-inline"> <input
														type="checkbox" name="opcao1" value="M" checked>Manhã
													</label> <label class="checkbox-inline"> <input
														type="checkbox" name="opcao2" value="T">Tarde
													</label> <label class="checkbox-inline"> <input
														type="checkbox" name="opcao3" value="N">Noite
													</label>
												</div>
												</br>
											</div>
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
												<div class="form-heading">
													<label>Carga Horária</label>
													<div class="controls">
														<g:textField class="form-control" required="" name="cargaHoraria" value="" />
													</div>
												</div>
												<br>
												<div class="form-heading">
													<label>Matricula</label>
													<div class="controls">
														<g:textField class="form-control" name="matricula" value="" />
													</div>
												</div>
												<br>
												<div class="form-heading">
												<label>Observação</label>
													<div>
														<textarea rows="3" class="form-control" name="observacao" placeholder="Insira uma observação relacionada ao Funcionário"></textarea>
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
