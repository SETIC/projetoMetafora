<!DOCTYPE html>
<%@page import="java.util.regex.Pattern.Script"%>
<html>
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
function mudarCombo(){
 var  x = 1;
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

				<g:form controller="Aluno" action="pesquisarAlunos" class="form">
					<div class="form-group">
						<label for="inputPesquisa" class="col-sm-2 control-label">Nome/CPF:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="" />
							<button style="margin-left: 310px; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="glyphicon glyphicon-search"></i> Buscar

							</button>

						</div>
					</div>
				</g:form>

				<table id="listarAluno"
					class="table table-striped table-hover example">

					<g:if test="${!alunos?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 100px;"></th>
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

													<li title="Editar Aluno"
														class="btn btn-primary btn-xs btn-flat"><a
														style="color: #fff"
														href="/projetoMetafora/aluno/editarAluno/${pessoa.id}"><span
															class="glyphicon glyphicon-pencil"></span></a></li>



													<li title="Remover Aluno" onclick="deletar(${pessoa.id})"
														class="btn btn-danger btn-xs btn-flat"><span
														class="glyphicon glyphicon-remove"></span></li>



													<li title="Transferir Aluno" data-toggle="tooltip"
														data-placement="top"
														class="btn btn-warning btn-xs btn-flat"><a
														style="color: #fff"
														href="/projetoMetafora/aluno/transferencia/${pessoa.id}"><span
															class="glyphicon glyphicon-arrow-right"></span></a></li>

												</g:if>


												<li title="Ver detalhes de Aluno"
													class="btn btn-success btn-xs btn-flat"><a
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
									<td style="text-align: center;"><g:if
											test="${pessoa.status == 'Ativo'}">
											<span class="label label-success">Ativo</span>
										</g:if> <g:else>
											<span class="label label-danger">Inativo</span>
										</g:else></td>
								</tr>
							</g:if>
						</g:each>

					</tbody>
				</table>
			</div>


			<g:if test="${perm2}">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-flat"
					data-toggle="modal" data-target="#modalCadastrarAluno"
					onclick="hiddenInput();">
					<i class="fa fa-plus"></i> Novo Aluno
				</button>
			</g:if>
			<button class="btn btn-danger btn-flat"
				onClick="printDiv('listarAluno')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>

			<!-- Modal -->
			<div class="modal fade" id="modalCadastrarAluno" tabindex="-1"
				role="dialog" data-focus-on="input:first"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document" style="width: 75%;">
					<div class="modal-content"
						style="padding-left: 15px; padding-right: 15px;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Aluno</h4>
						</div>
						<div class="modal-body" style="margin-left: 50px;">
							<g:form controller="Aluno" action="salvar"
								class="form-horizontal" style="width: 96%;">
								<!-- Steps Progress and Details - START -->
								<div class="" style="margin-top:; margin-bottom: 0px;">
									<div class="row">
										<div class="progress" id="progress1">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
												style="width: 0%;"></div>
											<span class="progress-type">Progresso Geral</span> <span
												class="progress-completed">0%</span>
										</div>
									</div>
									<div class="row"
										style="box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);">
										<div class="step">
											<div id="div1" class="col-md-4 mouse-point activestep"
												onclick="javascript: resetActive(div1, event, 0, 'step-1');">
												<div class="row">
													<span class="fa fa-user"></span>
													<p>Identificação</p>
												</div>
											</div>
											<div id="div2" class="col-md-4 mouse-point"
												onclick="validaDados()">
												<!-- javascript: resetActive(div2, event, 35, 'step-2'); -->
												<div class="row">
													<span class="fa fa-home"></span>
													<p>Endereço</p>
												</div>
											</div>
											<div id="div3" class="col-md-4 mouse-point"
												onclick="javascript: resetActive(div3, event, 70, 'step-3');">
												<div class="row">
													<span class="fa fa-university"></span>
													<p>Matrícula</p>
												</div>
											</div>
										</div>
									</div>
									<div class="activeStepInfo" id="step-1" style="margin-top: 2%;">
										<h3>Identificação</h3>
										<div class="form-group">
											<label for="iNome" class="col-sm-2 control-label">Nome
												*</label>
											<div class="col-sm-10">
												<g:textField class="form-control" id="iNome" name="nome"
													placeholder="Nome" required="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="iDataDeNascimento" class="col-sm-2 control-label">Data
												de Nascimento </label>
											<div class="col-sm-10">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" id="iDataDeNascimento"
													name="dataDeNascimento" required="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="iCpf" class="col-sm-2 control-label">CPF</label>
											<div class="col-sm-10">
												<g:textField class="form-control" id="iCpfCnpj"
													name="cpfCnpj" placeholder="CPF" />
											</div>
										</div>
										<div class="form-group">
											<label for="iNumeroDoRegistroDeCartorio"
												class="col-sm-2 control-label">Número do Registro de
												Cartório</label>
											<div class="col-sm-10">
												<g:textField class="form-control"
													id="iNumeroDoRegistroDeCartorio" name="rcNumero"
													placeholder="Número do Registro de Cartório" />
											</div>
										</div>
										<div class="form-group">
											<label for="iNomeDoCartorioDoRegistro"
												class="col-sm-2 control-label">Nome do Cartório do
												Registro</label>
											<div class="col-sm-10">
												<g:textField class="form-control"
													id="iNomeDoCartorioDoRegistro" name="rcNomeDoCartorio"
													placeholder="Nome do Cartório do Registro" />
											</div>
										</div>
										<div class="form-group">
											<label for="iNomeDoLivroDoRegistroDeCartorio"
												class="col-sm-2 control-label">Nome do Livro do
												Registro de Cartório</label>
											<div class="col-sm-10">
												<g:textField class="form-control"
													id="iNomeDoLivroDoRegistroDeCartorio" name="rcNomeDoLivro"
													placeholder="Nome do Livro do Registro de Cartório" />
											</div>
										</div>
										<div class="form-group">
											<label for="iFolhaDoLivroDoRegistroDeCartorio"
												class="col-sm-2 control-label">Folha do Livro do
												Registro de Cartório</label>
											<div class="col-sm-10">
												<g:textField class="form-control"
													id="iFolhaDoLivroDoRegistroDeCartorio"
													name="rcFolhaDoLivro"
													placeholder="Folha do Livro do Registro de Cartório" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Sexo</label>
											<div class="col-sm-10 radio" style="padding-top: 0px;">
												<label for="iSexoMasculino" class="radio-inline"> <input
													type="radio" name="sexo" id="iSexoMasculino"
													value="MASCULINO" checked> Masculino
												</label> <label for="iSexoFeminino" class="radio-inline"> <input
													type="radio" name="sexo" id="iSexoFeminino"
													value="FEMININO"> Feminino
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="iNomeDoPai" class="col-sm-2 control-label">Nome
												do Pai</label>
											<div class="col-sm-10">
												<g:textField class="form-control" id="iNomePaiInput"
													name="nomePaiInput" />

												<input type="hidden" name="idNomePai" id="idNomePaiId"
													value="">

												<div id="iDivSelectPicker" class="row">
													<div class="col-sm-11">
														<select class="form-control selectpicker"
															data-live-search="true" name="pai" id="comboPai">
															<option value="0">Nome do Pai</option>
															<g:each in="${pHomens}">
																<option value="${it.id}">
																	${it.nome}
																</option>
															</g:each>
														</select>
													</div>
													<div class="col-sm-1">
														<button type="button" class="btn btn-primary btn-flat"
															data-toggle="modal" data-target="#modalCadastrarPai">Novo</button>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="iNomeDaMae" class="col-sm-2 control-label">Nome
												da Mãe</label>
											<div class="col-md-10">

												<input type="hidden" name="idNomeMae" id="idNomeMaeId"
													value="">

												<g:textField class="form-control" id="iNomeMaeInput"
													name="nomeMaeInput" />
												<div id="iDivSelectPicker1" class="row">
													<div class="col-sm-11">
														<select class="form-control selectpicker"
															data-live-search="true" name="mae" id="comboMae">
															<option value="0">Nome da Mãe</option>
															<g:each in="${pMulheres}">
																<option value="${it.id}">
																	${it.nome}
																</option>
															</g:each>
														</select>
													</div>
													<div class="col-sm-1">
														<button type="button" class="btn btn-primary btn-flat"
															data-toggle="modal" data-target="#modalCadastrarMae">Novo</button>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="iNacionalidade" class="col-sm-2 control-label">Nacionalidade
												*</label>
											<div class="col-sm-10">
												<g:textField class="form-control" id="iNacionalidade"
													name="nacionalidade" placeholder="Nacionalidade"
													required="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="iEstadoCivil" class="col-sm-2 control-label">Estado
												Civil *</label>
											<div class="col-sm-10">
												<select class="form-control" id="iEstadoCivil"
													name="estadoCivil" required="true">
													<option value="null" selected disabled>Selecione...</option>
													<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
													<option value="CASADO(A)">CASADO(A)</option>
													<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
													<option value="VIÚVO(A)">VIÚVO(A)</option>
												</select>
											</div>
										</div>
										<div class="form-group" style="margin-top: 3%;">
											<hr style="border-top: 2px solid #DFDFDF;" />
											<div class="col-md-1 col-md-offset-11">
												<button type="button" class="btn btn-primary btn-flat"
													onclick="validaDados();">
													Próximo<i class="fa fa-chevron-circle-right"></i>
												</button>
											</div>
										</div>
										
										
										
									</div>
									<div class="hiddenStepInfo" id="step-2" style="margin-top: 2%;">
										<h3>Endereço</h3>
										<div class="form-group">
											<label for="iCep" class="col-sm-2 control-label">CEP</label>
											<div id="iDivInputCep" class="col-sm-10">
												<g:textField type="number" class="form-control"
													data-mask="99999-999" name="cep" id="iCep"
													onfocusout="javascript: requestAjax(this);"
													placeholder="CEP" value="${reside?.cep}" />
												<p id="iMensagemCEP" class="text-danger">Por favor
													digite um CEP válido.</p>
											</div>
										</div>
										<div class="form-group">
											<label for="iLogradouro" class="col-sm-2 control-label">Logradouro</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="endereco"
													id="iLogradouro" placeholder="Logradouro"
													value="${reside?.logradouro?.logradouro}">
											</div>
										</div>
										<div class="form-group">
											<label for="iNumero" class="col-sm-2 control-label">Número</label>
											<div class="col-sm-10">
												<input type="number" class="form-control" name="numero"
													id="iNumero" placeholder="Número">
											</div>
										</div>
										<div class="form-group">
											<label for="iComplemento" class="col-sm-2 control-label">Complemento</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="complemento"
													id="iComplemento" placeholder="Complemento">
											</div>
										</div>
										<div class="form-group">
											<label for="iBairro" class="col-sm-2 control-label">Bairro</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="bairro"
													id="iBairro" placeholder="Bairro">
											</div>
										</div>
										<div class="form-group">
											<label for="iUf" class="col-sm-2 control-label">UF</label>
											<div class="col-sm-10">
												<select name="uf" id="iUf" class="form-control">
													<option value="AC">Acre</option>
													<option value="AL">Alagoas</option>
													<option value="AM">Amazonas</option>
													<option value="AP">Amapá</option>
													<option value="BA">Bahia</option>
													<option value="CE">Ceará</option>
													<option value="DF">Distrito Federal</option>
													<option value="ES">Espírito Santo</option>
													<option value="GO">Goiás</option>
													<option value="MA">Maranhão</option>
													<option value="MT">Mato Grosso</option>
													<option value="MS">Mato Grosso do Sul</option>
													<option value="MG">Minas Gerais</option>
													<option value="PA">Pará</option>
													<option value="PB">Paraíba</option>
													<option value="PR">Paraná</option>
													<option value="PE">Pernambuco</option>
													<option value="PI">Piauí</option>
													<option value="RJ">Rio de Janeiro</option>
													<option value="RN" selected>Rio Grande do Norte</option>
													<option value="RO">Rondônia</option>
													<option value="RS">Rio Grande do Sul</option>
													<option value="RR">Roraima</option>
													<option value="SC">Santa Catarina</option>
													<option value="SE">Sergipe</option>
													<option value="SP">São Paulo</option>
													<option value="TO">Tocantins</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label for="iMunicipio" class="col-sm-2 control-label">Município</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="municipio"
													id="iMunicipio" placeholder="Município">
											</div>
										</div>
										<div class="form-group" style="margin-top: 3%;">
											<div class="col-sm-offset-9 col-sm-3"
												style="margin-left: 77.5%;">
												<button type="button" class="btn btn-primary btn-flat"
													onclick="javascript: resetActive(div1, event, 0, 'step-1');">
													<i class="fa fa-chevron-circle-left"></i> Anterior
												</button>
												<button type="button" class="btn btn-primary btn-flat"
													onclick="javascript: resetActive(div3, event, 70, 'step-3');">
													Próximo <i class="fa fa-chevron-circle-right"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="hiddenStepInfo" id="step-3" style="margin-top: 2%;">
										<h3>Matrícula</h3>


										<div class="form-group">
											<label class="col-sm-2 control-label">Realizar
												Matricula?</label>
											<div class="col-sm-10 radio" style="padding-top: 0px;">
												<label for="iRealizarMatricula" class="radio-inline">
													<input type="radio" name="realizarMatricula"
													id="iRealizarMatricula" value="SIM"
													onChange="disableInput('show')"> Sim
												</label> <label for="iRealizarMatricula" class="radio-inline">
													<input type="radio" name="realizarMatricula"
													id="iRealizarMatricula" value="NAO"
													onChange="disableInput('hide')" checked> Não
												</label>
											</div>
										</div>


										<div class="form-group">
											<label for="iEscola" class="col-sm-2 control-label">Escola</label>
											<div class="col-sm-10">
												<select class="form-control selectpicker"
													data-live-search="true" name="escolas" id="comboEscola"
													onchange="mudarEscola();">
													<option value="0" disabled="true" selected="selected">Selecione
														uma escola</option>
													<g:each in="${escolas}">
														<option value="${it.id}">
															${it.pessoaJuridica.razaoSocial}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="iSerie" class="col-sm-2 control-label">Série</label>
											<div class="col-sm-10">
												<select id="comboSerie" name="series" class="form-control"
													onchange="mudarSerie()" disabled="true">
													<g:each in='${series?}'>
														<option value="${it.id}">
															${it.serie}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="iTurma" class="col-sm-2 control-label">Turma</label>
											<div class="col-sm-10">
												<div id="teste"></div>
												<select class="form-control" name="turma" id="comboTurma"
													disabled="true"></select>
											</div>
										</div>
										<div class="form-group">
											<label for="iNumeroMatricula" class="col-sm-2 control-label">Nº
												Matrícula</label>
											<div class="col-sm-10">
												<g:textField class="form-control" name="matricula" value=""
													id="numMatricula" disabled="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="iDataDaMatricula" class="col-sm-2 control-label">Data
												da matrícula</label>
											<div class="col-sm-10">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" required="true" name="dataDaMatricula"
													value="" id="dataMatricula" />
											</div>
										</div>
										<div class="form-group" style="margin-top: 3%;">
											<div class="col-sm-offset-9 col-sm-3"
												style="margin-left: 77.5%;">
												<button type="button" class="btn btn-primary btn-flat"
													onclick="javascript: resetActive(div2, event, 35, 'step-2');">
													<i class="fa fa-chevron-circle-left"></i> Anterior
												</button>
												<button type="submit" class="btn btn-success btn-flat"
													onclick="javascript: inputsHabilitado(); resetActive(div4, event, 100, 'step-3');">
													Finalizar <i class="fa fa-check-circle"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalCadastrarPai" tabindex="-1"
				role="dialog" data-focus-on="input:first"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document" style="margin-top: 20%">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastrar Pai</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label style="padding-top: 5px;" for="iNomePai"
									class="col-sm-1 control-label">Nome:</label>
								<div class="col-sm-11">
									<g:textField class="form-control" id="iNomePai" name="nomePai"
										placeholder="Nome" required="false" />
								</div>
								<label for="iCpf" style="margin-top: 5px; padding-top: 5px;"
									class="col-sm-1 control-label">CPF:</label>
								<div class="col-sm-11">
									<g:textField style="margin-top: 5px;" class="form-control"
										id="iCPFPai" name="cpfPai" />
								</div>
							</div>
						</div>
						<hr />
						<div class="modal-footer">
							<button type="button" class="btn btn-success btn-flat"
								data-dismiss="modal" onclick="salvarPai()">Cadastrar</button>
							<button type="button" class="btn btn-default btn-flat"
								data-dismiss="modal">Cancelar</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalCadastrarMae" tabindex="-1"
				role="dialog" data-focus-on="input:first"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document" style="margin-top: 20%">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastrar Mãe</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label style="padding-top: 5px;" for="iNomeMae"
									class="col-sm-1 control-label">Nome:</label>
								<div class="col-sm-11">
									<g:textField class="form-control" id="iNomeMae" name="nomeMae"
										placeholder="Nome" required="false" />
								</div>
								<label for="iCpf" style="margin-top: 5px; padding-top: 5px;"
									class="col-sm-1 control-label">CPF:</label>
								<div class="col-sm-11">
									<g:textField style="margin-top: 5px;" class="form-control"
										id="iCPFMae" name="cpfMae" />
								</div>
							</div>
						</div>
						<hr />
						<div class="modal-footer">
							<button type="button" class="btn btn-success btn-flat"
								data-dismiss="modal" onclick="salvarMae()">Cadastrar</button>
							<button type="button" class="btn btn-default btn-flat"
								data-dismiss="modal">Cancelar</button>

						</div>
					</div>
				</div>
			</div>
		</div>


		<g:javascript src="script-buscar-cep.js" />
		<!-- valida campos -->
		<script type="text/javascript"> 
         //validaçao dos campos de aluno
		
		 function validaDados(){

			 var nome = iNome.value;
		     var nacionalidade = iNacionalidade.value;
		     var estadoCivil = iEstadoCivil.value;
		     var selecionaEstadoCivil = document.getElementById("iEstadoCivil");  
		     
			 if (nome == "" || nome == null){
			   alert('preencha o campo nome');
			   document.getElementById("iNome").focus();
			   return false;

		        }

			  if(nacionalidade == "" || nacionalidade == null){
				   alert('preencha o campo nacionalidade');
				   document.getElementById("iNacionalidade").focus();
				   return false;
    			 }
 		     
 			 
			  if (selecionaEstadoCivil.options[selecionaEstadoCivil.selectedIndex].value == "null" ){
				   alert('preencha o campo estado civil');
				   document.getElementById("iEstadoCivil").focus();
			       return false;
                 				  
			     } 
			     
		
			else{
			
				resetActive(div2, event, 35, 'step-2');
				 }
			
			  }
		
		</script>

		<!-- Script buscar dados de acordo com CEP -->

		<script type="text/javascript">

		

			function hiddenInput(){
				console.log('Hidden...');
				document.getElementById("iNomePaiInput").className = 'form-control hidden';
				document.getElementById("iNomeMaeInput").className = 'form-control hidden';
			}
			
			function disableInput(type){

				if(type=="hide"){
					console.log('Hidden inputs...');
					//document.getElementById("comboEscola").disabled = true;
					document.getElementById("comboSerie").disabled = true;
					document.getElementById("comboTurma").disabled = true;
					document.getElementById("numMatricula").disabled = true;
					//document.getElementById("dataMatricula").disabled = true;

					
					}
				else{
					console.log('show inputs...');
					//document.getElementById("comboEscola").disabled = false;
					document.getElementById("comboSerie").disabled = false;
					document.getElementById("comboTurma").disabled = false;
					document.getElementById("numMatricula").disabled = false;
					//document.getElementById("dataMatricula").disabled = false;
					}

				}
			

			function salvarPai(){
			   //var endereco = "192.168.1.247";
			   var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
			   var nome = document.getElementById("iNomePai").value;
			   var cpf
			   
			   if(document.getElementById("iCPFPai").value == ''){
			   		cpf = "0";
			   }else{	
			   
			   		cpf = document.getElementById("iCPFPai").value;
			   }
			   
			   console.log("CPF -- " + cpf);
			   $.ajax({ 
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarPai?nome="+nome+"&cpf="+cpf,
		            dataType: "json",
		            success: function(result){
		            	console.log(result[result.length-1].nome);

		            	document.getElementById("idNomePaiId").value = result[result.length-1].id;
		            	
		            	document.getElementById("iDivSelectPicker").className = 'form-control hidden';
		            	
		            	document.getElementById("iNomePaiInput").className = 'form-control';
		            	document.getElementById("iNomePaiInput").disabled = true;
		            	document.getElementById("iNomePaiInput").value = result[result.length-1].nome;

		            	$(function() {
							$('#twoModalsExample').modal('hide');
						});						
				    } 
		        });
			}
			
			function salvarMae(){
				//var endereco = "192.168.1.247";
				var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
				   var nome = document.getElementById("iNomeMae").value;
				   var cpf
				if(document.getElementById("iCPFMae").value == ''){
			   		cpf = "0";
			    }else{	
				    cpf = document.getElementById("iCPFMae").value;
					 }
				   
				   $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarMae?nome="+nome+"&cpf="+cpf,
			            dataType: "json",
			            success: function(result){
			            	console.log(result[result.length-1].nome);
	
							document.getElementById("idNomeMaeId").value = result[result.length-1].id;
			            				            	
			            	document.getElementById("iDivSelectPicker1").className = 'form-control hidden';
			            	
			            	document.getElementById("iNomeMaeInput").className = 'form-control';
			            	document.getElementById("iNomeMaeInput").disabled = true;
			            	document.getElementById("iNomeMaeInput").value = result[result.length-1].nome;

			            	$(function() {
								$('#twoModalsExample1').modal('hide');
							});						
					    } 
			        });
				}


			function mudarEscola(){
		    	  
				//var endereco = "192.168.1.247";
				var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
		        var comboTurma = document.getElementById("comboTurma");
		        comboTurma.options[comboTurma.options.length] = new Option("Buscando Turmas", 0);

		        var idEscola = document.getElementById("comboEscola").value;
				var idSerie = document.getElementById("comboSerie").value;
		        
		        
		        $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/turma/getTurmaByEscolaAndSerie?idEscola="+idEscola+"&idSerie="+idSerie,
		            dataType: "json",
		            success: function(result){
		            	comboTurma.options.length = 0;
			        if (result.id.length == 0){
			        	comboTurma.options[comboTurma.options.length] = new Option("Não há turma cadastrada", 0);
			        }else{
						for (i=0;i<result.id.length;i++){
							comboTurma.options[comboTurma.options.length] = new Option(result.turma[i], result.id[i]);
		           		}
			        }
		            }
		        });
				
		   }

		  function mudarSerie(){
			  //var endereco = "192.168.1.247";
			  var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
			   var comboTurma = document.getElementById("comboTurma");
		        comboTurma.options[comboTurma.options.length] = new Option("Buscando Turmas", 0);

		        var idEscola = document.getElementById("comboEscola").value;
				var idSerie = document.getElementById("comboSerie").value;

		        
		        $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/turma/getTurmaByEscolaAndSerie?idEscola="+idEscola+"&idSerie="+idSerie,
		            dataType: "json",
		            success: function(result){
		            	comboTurma.options.length = 0;
			        if (result.id.length == 0){
			        	comboTurma.options[comboTurma.options.length] = new Option("Não há turma cadastrada", 0);
			        }else{
						for (i=0;i<result.id.length;i++){
							comboTurma.options[comboTurma.options.length] = new Option(result.turma[i], result.id[i]);
		           		}
			        }
		            }
		        });
		    
		       }
			
		</script>
	</section>
</body>
</html>
