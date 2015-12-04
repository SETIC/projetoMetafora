<!DOCTYPE html>
<%@page import="java.lang.System"%>
<%@page import="br.gov.rn.saogoncalo.academico.Disciplina"%>
<%@page import="br.gov.rn.saogoncalo.pessoa.Professor"%>
<%@page
	import="br.gov.rn.saogoncalo.academico.DisciplinaLecionadaPorProfessor"%>
<html lang="pt-br">
<head>
<title>Editar Professor . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Professores <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Professor" action="listar">Professores</g:link></li>
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
			<g:each in='${professores?}'>
				<g:set var="pessoa"
					value="${it.funcionario.cidadao.pessoaFisica.pessoa}" />
				<g:set var="funcionario" value="${it.funcionario }" />
				<g:set var="pessoaFisica"
					value="${it.funcionario.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.funcionario.cidadao}" />
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Professor" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text"
									style="width: 300px" value="${pessoa.nome }">
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
									value="${pessoa.dataDeNascimento}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">CPF</label>
							<div class="col-sm-10">
								<g:textField class="form-control" id="cpf" name="cpfCnpj"
									style="width: 300px" value="${pessoa.cpfCnpj }" />
							</div>
						</div>
						<!-- 
						<br>
						<div class="form-group">
							<label for="inputrcNumero3" class="col-sm-2 control-label">Número
								do Registro de Cartório</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="rcNumero"
									style="width: 300px" value="${pessoaFisica.rcNumero }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoCartorio3"
								class="col-sm-2 control-label">Nome do Cartório do
								Registro de Cartório</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="rcNomeDoCartorio"
									style="width: 300px" value="${pessoaFisica.rcNomeDoCartorio }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcNomeDoLivro3" class="col-sm-2 control-label">Nome
								do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="rcNomeDoLivro"
									style="width: 300px" value="${pessoaFisica.rcNomeDoLivro }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputrcFolhaDoLivro3" class="col-sm-2 control-label">Folha
								do Livro do Registro de Cartório</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="rcFolhaDoLivro"
									style="width: 300px" value="${pessoaFisica.rcFolhaDoLivro }" />
							</div>
						</div> -->
						<br>
						<div class="form-group">
							<label for="inputsexo3" class="col-sm-2 control-label">Sexo</label>
							<div class="col-sm-10">
								<g:if test="${pessoaFisica.sexo == 'MASCULINO' }">
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
									value="${cidadao.nacionalidade}" />
							</div>
						</div>
						<br>
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
							<label for="inputprofissao3" class="col-sm-2 control-label">Profissão</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true"
									name="profissao" style="width: 300px"
									value="${cidadao.profissao }" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputcargaHoraria3" class="col-sm-2 control-label">Carga
								Horária</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required=""
									name="cargaHoraria" style="width: 300px"
									value="${funcionario.cargaHoraria}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputmatricula3" class="col-sm-2 control-label">Matricula</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true"
									name="matricula" style="width: 300px"
									value="${funcionario.matricula}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputidentificacao3" class="col-sm-2 control-label">Identificação</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="identificacao"
									style="width: 300px" value="${it.identificacao}" readonly="readonly" />
							</div>
						</div>
						<br>
						<div class="form-group" style="min-height: 50px;">
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
					

					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/professor/listar/">Cancelar</a></li>
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