<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Funcionário . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Funcionários <small>Editar dados</small>
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
			<g:each in='${funcionarios?}'>
				<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
				<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.cidadao}" />
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Funcionario" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text"
									style="width: 300px" value="${pessoa?.nome }">
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
									value="${pessoa?.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CPF</label>
							<div class="col-sm-10">
								<g:textField class="form-control" id="cpf" name="cpfCnpj"
									style="width: 300px" value="${pessoa?.cpfCnpj}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputsexo3" class="col-sm-2 control-label">Sexo</label>
							<div class="col-sm-10">
								<g:if test="${pessoaFisica?.sexo == 'MASCULINO'}">
									<label class="radio-inline"> <input type="radio"
										name="sexo" id="inlineRadio1" value="MASCULINO"
										checked="checked"> MASCULINO
									</label>
									<label class="radio-inline"> <input type="radio"
										name="sexo" id="inlineRadio2" value="FEMININO">
										FEMININO
									</label>
								</g:if>
								<g:else>
									<label class="radio-inline"> <input type="radio"
										name="sexo" id="inlineRadio1" value="MASCULINO">
										MASCULINO
									</label>
									<label class="radio-inline"> <input type="radio"
										name="sexo" id="inlineRadio2" value="FEMININO"
										checked="checked"> FEMININO
									</label>
								</g:else>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputnacionalidade3" class="col-sm-2 control-label">Nacionalidade</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true"
									name="nacionalidade" style="width: 300px"
									value="${cidadao?.nacionalidade}" />
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputvinculo3" class="col-sm-2 control-label">Vinculo</label>
							<div class="col-sm-10">

								<g:if test="${funcionarios?.lotacao?.vinculo[0] == ''}">
									<select class="form-control" name="vinculo"
										style="width: 300px">
										<option value="EFETIVO" selected>EFETIVO</option>
										<option value="COMISSIONADO">COMISSIONADO</option>
										<option value="ESTAGIÁRIO">ESTAGIÁRIO</option>
										<option value="TERCEIRIZADO">TERCEIRIZADO</option>
									</select>
								</g:if>

								<g:elseif
									test="${funcionarios?.lotacao?.vinculo[0] == 'EFETIVO'}">
									<select class="form-control" name="vinculo"
										style="width: 300px">
										<option value="EFETIVO" selected>EFETIVO</option>
										<option value="COMISSIONADO">COMISSIONADO</option>

										<option value="ESTAGIÁRIO">ESTAGIÁRIO</option>
										<option value="TERCEIRIZADO">TERCEIRIZADO</option>
									</select>
								</g:elseif>


								<g:elseif
									test="${funcionarios?.lotacao?.vinculo[0] == 'COMISSIONADO'} ">
									<select class="form-control" name="vinculo"
										style="width: 300px">
										<option value="EFETIVO">EFETIVO</option>
										<option value="COMISSIONADO" selected>COMISSIONADO</option>
										<option value="ESTAGIÁRIO">ESTAGIÁRIO</option>
										<option value="TERCEIRIZADO">TERCEIRIZADO</option>
									</select>
								</g:elseif>

								<g:elseif
									test="${funcionarios?.lotacao?.vinculo[0] == 'ESTAGIÁRIO'} ">
									<select class="form-control" name="vinculo"
										style="width: 300px">
										<option value="EFETIVO">EFETIVO</option>
										<option value="COMISSIONADO">COMISSIONADO</option>
										<option value="ESTAGIÁRIO" selected>ESTAGIÁRIO</option>
										<option value="TERCEIRIZADO">TERCEIRIZADO</option>
									</select>
								</g:elseif>

								<g:elseif
									test="${funcionarios?.lotacao?.vinculo[0] == 'TERCEIRIZADO'} ">
									<select class="form-control" name="vinculo"
										style="width: 300px">
										<option value="EFETIVO">EFETIVO</option>
										<option value="COMISSIONADO">COMISSIONADO</option>
										<option value="ESTAGIÁRIO">ESTAGIÁRIO</option>
										<option value="TERCEIRIZADO" selected>TERCEIRIZADO</option>
									</select>
								</g:elseif>



							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputfuncao3" class="col-sm-2 control-label">Função</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true" name="funcao"
									style="width: 300px"
									value="${funcionarios?.lotacao?.funcao[0]}" />

							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputcargo3" class="col-sm-2 control-label">Cargo</label>
							<div class="col-sm-4">
								<select name="cargo" id="comboCargo" class="form-control" onChange="habilitarDisciplinas()">
										<g:each in="${cargo}">
											<g:if test="${it.id == funcionarios?.lotacao?.cargo.id[0] }">
												<option value="${it.id}" selected>
													${it.cargo}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.cargo}
												</option>
											</g:else>
										</g:each>
								</select>
							</div>
						</div>
						<br>
						<div id="divDisciplinas" class="form-group">
							<label for="inputdlpp3" class="col-sm-2 control-label">Disciplinas
								do Professor</label>
							<div class="col-sm-10">
								<select class="form-control selectpicker"
									data-live-search="true" name="disciplinaLecionadaPorProfessor"
									multiple="multiple">

									<g:each in="${disc}" var="allDisc">

										<g:if test="${dlppl.contains(allDisc.id)}">

											<option value="${allDisc.id}" selected>
												${allDisc.disciplina }
											</option>
										</g:if>
										<g:else>
											<option value="${allDisc.id}">
												${allDisc.disciplina }
											</option>
										</g:else>

									</g:each>

								</select>
							</div>
						</div>
						<script>
							function habilitarDisciplinas() {
								var index = document.getElementById("comboCargo").selectedIndex;
								var cargo = document.getElementById("comboCargo").options[index].innerHTML.trim();
								if (cargo == "PROFESSOR" || cargo == "PROFESSOR PI G") {
									document.getElementById("divDisciplinas").style.display = "block";
								} else {
									document.getElementById("divDisciplinas").style.display = "none";
								}
							}
							habilitarDisciplinas();
						</script>
						<div class="form-group">
							<label class="col-sm-2 control-label">Turno</label>
							<div class="controls">
								<div class="col-sm-4">
									<g:if test="${charManha == "M"}">
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao1" value="M" checked>Manhã </label>
									</g:if>
									<g:else>
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao1" value="M">Manhã </label>
									</g:else>

									<g:if test="${charTarde == "T"}">
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao2" value="T" checked>Tarde </label>
									</g:if>
									<g:else>
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao2" value="T">Tarde </label>
									</g:else>

									<g:if test="${charNoite == "N"}">
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao3" value="N" checked>Noite </label>
									</g:if>
									<g:else>
										<label class="checkbox-inline"><input type="checkbox"
											name="opcao3" value="N">Noite </label>
									</g:else>
								</div>
							</div>
						</div>
						</br>
						<div class="form-group">
							<label for="inputestadoCivil3" class="col-sm-2 control-label">Estado
								Civil</label>
							<div class="col-sm-10">
								<g:if test="${cidadao.estadoCivil == 'SOLTEIRO(A)' }">
									<select class="form-control" name="estadoCivil"
										style="width: 300px">
										<option value="">
											${cidadao.estadoCivil}
										</option>
										<option value="CASADO(A)">CASADO(A)</option>
										<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
										<option value="VIÚVO(A)">VIÚVO(A)</option>
									</select>
								</g:if>
								<g:elseif test="${cidadao.estadoCivil == '' }">
									<select class="form-control" name="estadoCivil"
										style="width: 300px">
										<option value="">
											${cidadao.estadoCivil}
										</option>
										<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
										<option value="CASADO(A)">CASADO(A)</option>
										<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
										<option value="VIÚVO(A)">VIÚVO(A)</option>
									</select>

								</g:elseif>
								<g:elseif test="${cidadao.estadoCivil == 'CASADO(A)' }">
									<select class="form-control" name="estadoCivil"
										style="width: 300px">
										<option value="">
											${cidadao.estadoCivil}
										</option>
										<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
										<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
										<option value="VIÚVO(A)">VIÚVO(A)</option>
									</select>

								</g:elseif>

								<g:elseif test="${cidadao.estadoCivil == 'DIVORCIADO(A)' }">
									<select class="form-control" name="estadoCivil"
										style="width: 300px">
										<option value="">
											${cidadao.estadoCivil}
										</option>
										<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
										<option value="CASADO(A)">CASADO(A)</option>
										<option value="VIÚVO(A)">VIÚVO(A)</option>
									</select>

								</g:elseif>

								<g:else>
									<select class="form-control" name="estadoCivil"
										style="width: 300px">
										<option value="">
											${cidadao.estadoCivil}
										</option>
										<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
										<option value="CASADO(A)">CASADO(A)</option>
										<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
									</select>

								</g:else>
							</div>
						</div>

						<br>
						<div class="form-group">
							<label for="inputcargaHoraria3" class="col-sm-2 control-label">Carga
								Horária</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required=""
									name="cargaHoraria" style="width: 300px"
									value="${funcionarios.cargaHoraria}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputmatricula3" class="col-sm-2 control-label">Matricula</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="matricula"
									style="width: 300px" value="${funcionarios.matricula}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputmatricula3" class="col-sm-2 control-label">Observação</label>
							<div class="col-sm-5">
								<textarea rows="3" class="form-control" name="observacao"
									placeholder="Insira uma observação relacionada ao Funcionário">
									${funcionarios.observacao}
								</textarea>
							</div>
						</div>
						<br>
					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/funcionario/listar/">Cancelar</a></li>
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

				function mudarSelect() {
					var endereco = "192.168.1.247";

					var comboCargo = document.getElementById("comboCargo");
					comboCargo.options[comboCargo.options.length] = new Option(
							"Buscando cargo", 0);
					var idFuncionario = document.getElementById("id").value;

					$
							.ajax({
								type : "GET",
								url : "http://"
										+ endereco
										+ ":8080/projetoMetafora/funcionario/editarFuncionario"
										+ idFuncionario,
								dataType : "json",
								success : function(result) {
									comboCargo.options.length = 0;
									if (result.id.length == 0) {
										comboCargo.options[comboCargo.options.length] = new Option(
												"Não há turma cadastrada", 0);
									} else {
										for (i = 0; i < result.id.length; i++) {
											comboCargo.options[comboCargo.options.length] = new Option(
													result.cargo[i],
													result.id[i]);
										}
									}
								}
							});

				}
			</script>

		</div>
	</section>
</body>
</html>
