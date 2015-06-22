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
  newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
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
						<label for="inputPesquisa" class="col-sm-2 control-label">NOME/CPF:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="${ }" />
							<button style="margin-left: 36%; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="fa fa-save"></i> Buscar
							</button>

						</div>
					</div>
				</g:form>
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

			<!-- Button trigger modal -->
			<g:if test="${perm2}">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal" onclick="hiddenInput();">
					<i class="fa fa-plus"></i> Novo Aluno
				</button>
			</g:if>
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>


			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				onload="ocultarMensagemDeErro();">
				<div class="modal-dialog" style="width: 950px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Aluno</h4>

							<!-- test Modal 2-->

							<div class="modal fade" id="twoModalsExample"
								style="background-color: white; height: 300px;"
								aria-labelledby="myModalLabel" tabindex="-1" role="dialog"
								aria-hidden="true">
								<h4 class="modal-title" id="myModalLabel">Cadastro de
									filiação</h4>
								<br>
								<div class="modal-body">
									<!--	<g:form class="form-horizontal"> -->
									<div class="form-group">
										<label for="iNome" class="col-sm-2 control-label">nome</label>
										<div class="col-sm-10">
											<g:textField class="form-control" id="iNome" name="nome"
												placeholder="Nome" required="true" />
										</div>
									</div>
									<button id="closemodal" type="button"
										data-dismiss="twoModalsExample"
										class="btn btn-success btn-flat" onclick="salvarPai();">
										Cadastrar</button>


									<!--  	</g:form> -->
								</div>
							</div>
							<!-- test Modal 3-->
							<div class="modal fade" id="twoModalsExample1"
								style="background-color: white; height: 300px;"
								aria-labelledby="myModalLabel" tabindex="-1" role="dialog"
								aria-hidden="true">
								<h4 class="modal-title" id="myModalLabel">Cadastro de
									filiação</h4>
								<br>
								<div class="modal-body">
									<!--	<g:form class="form-horizontal"> -->
									<div class="form-group">
										<label for="iNomeMae" class="col-sm-2 control-label">nome</label>
										<div class="col-sm-10">
											<g:textField class="form-control" id="iNomeMae" name="nomeMae"
												placeholder="Nome" required="true" />
										</div>
									</div>
									<button id="closemodal" type="button"
										data-dismiss="twoModalsExample1"
										class="btn btn-success btn-flat" onclick="salvarMae()">
										Cadastrar</button>


									<!--  	</g:form> -->
								</div>
							</div>
						</div>
						<div class="modal-body">
							<div class="main">
								<g:form controller="Aluno" action="salvar"
									class="form-horizontal">
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
													onclick="javascript: resetActive(div2, event, 35, 'step-2');">
													<div class="row">
														<span class="fa fa-home"></span>
														<p>Endereço</p>
													</div>
												</div>
												<div id="div3" class="col-md-4 mouse-point"
													onclick="javascript: resetActive(div3, event, 70, 'step-3');">
													<div class="row">
														<span class="fa fa-university"></span>
														<p>
															Dados Variáveis <br />(iníco do ano corrente)
														</p>
													</div>
												</div>

											</div>
										</div>
										<div class="activeStepInfo" id="step-1"
											style="margin-top: 2%;">
											<h3>Identificação</h3>
											<div class="form-group">
												<label for="iNome" class="col-sm-2 control-label">Nome</label>
												<div class="col-sm-10">
													<g:textField class="form-control" id="iNome" name="nome"
														placeholder="Nome" required="true" />
												</div>
											</div>
											<div class="form-group">
												<label for="iDataDeNascimento"
													class="col-sm-2 control-label">Data de Nascimento</label>
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
													class="col-sm-2 control-label">Número do Registro
													de Cartório</label>
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
														<g:textField class="form-control" id="iNomePaiInput" name="nomePaiInput"/>
														<div id="iDivSelectPicker" name="divSelectPicker" class="">
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
														<button class="btn btn-primary btn-flat" id="btn1" data-toggle="modal" 
															data-target="#twoModalsExample">Novo</button>
													</div>

												</div>
												


											<div class="form-group">
												<label for="iNomeDaMae" class="col-sm-2 control-label">Nome
													da Mãe</label>
												<div class="col-sm-10">
												<g:textField class="form-control" id="iNomeMaeInput" name="nomeMaeInput"/>
												<div id="iDivSelectPicker1" name="divSelectPicker1" class="">
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
													<button class="btn btn-primary btn-flat" id="btn2"
														data-toggle="modal" data-target="#twoModalsExample1" >Novo</button>
												</div>
											</div>

										</div>
										<div class="form-group">
											<label for="iNacionalidade" class="col-sm-2 control-label">Nacionalidade</label>
											<div class="col-sm-10">
												<g:textField class="form-control" id="iNacionalidade"
													name="nacionalidade" placeholder="Nacionalidade"
													required="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="iEstadoCivil" class="col-sm-2 control-label">Estado
												Civil</label>
											<div class="col-sm-10">
												<select class="form-control" id="iEstadoCivil"
													name="estadoCivil">
													<option value="null" selected disabled>Selecione...</option>
													<option value="SOLTEIRO(A)">SOLTEIRO(A)</option>
													<option value="CASADO(A)">CASADO(A)</option>
													<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
													<option value="VIÚVO(A)">VIÚVO(A)</option>
												</select>
											</div>
										</div>
										<div class="form-group" style="margin-top: 3%;">
											<div class="col-sm-offset-10 col-sm-2"
												style="margin-left: 87.2%;">
												<button type="button" class="btn btn-primary btn-flat"
													onclick="javascript: resetActive(div2, event, 35, 'step-2');">
													Próximo <i class="fa fa-chevron-circle-right"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="hiddenStepInfo" id="step-2" style="margin-top: 2%;">
										<h3>Endereço</h3>
										<div class="form-group">
											<label class="col-sm-2 control-label">Localização/Zona
												de residência</label>
											<div class="col-sm-10 radio" style="padding-top: 0px;">
												<label for="iLocalizacaoUrbana" class="radio-inline">
													<input type="radio" name="localizacao"
													id="iLocalizacaoUrbana" value="URBANA" checked>
													Urbana
												</label> <label for="iLocalizacaoRural" class="radio-inline">
													<input type="radio" name="localizacao"
													id="iLocalizacaoRural" value="RURAL"> Rural
												</label>
											</div>
										</div>
										<div class="form-group">
											<label for="iCep" class="col-sm-2 control-label">CEP</label>
											<div id="iDivInputCep" class="col-sm-10">
												<g:textField type="number" class="form-control"
													data-mask="99999-999" name="cep" id="iCep"
													onfocusout="javascript: requestAjax(this);"
													placeholder="CEP" />
												<p id="iMensagemCEP" class="text-danger">Por favor
													digite um CEP válido.</p>
											</div>
										</div>
										<div class="form-group">
										
										
											<label for="iLogradouro" class="col-sm-2 control-label">Logradouro</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="endereco"
													id="iLogradouro" placeholder="Logradouro">
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
												<input type="text" class="form-control" name="uf" id="iUf"
													placeholder="Estado">
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
										<h3>Dados Variáveis (iníco do ano corrente)</h3>
										<div class="form-group">
											<label for="iEscola" class="col-sm-2 control-label">Escola</label>
											<div class="col-sm-10">
												<select class="form-control selectpicker"
													data-live-search="true" name="escolas" id="comboEscola"
													onchange="mudarEscola();">
													<g:each in="${escolas}">
														<option value="0" disabled="disabled" selected="selected">Selecione
															uma escola</option>
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
													onchange="mudarSerie()">
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
												<select class="form-control" name="turma" id="comboTurma"></select>
											</div>
										</div>
										<div class="form-group">
											<label for="iNumeroMatricula" class="col-sm-2 control-label">Nº
												Matrícula</label>
											<div class="col-sm-10">
												<g:textField class="form-control" name="matricula" value="" />
											</div>
										</div>
										<div class="form-group">
											<label for="iDataDaMatricula" class="col-sm-2 control-label">Data
												da matrícula</label>
											<div class="col-sm-10">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" required="true" name="dataDaMatricula"
													value="" />
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
		</div>
		</div>
		<!-- Script buscar dados de acordo com CEP -->
		<g:javascript src="script-buscar-cep.js" />
		<script type="text/javascript">
			function hiddenInput(){
				console.log('Hidden...');
				document.getElementById("iNomePaiInput").className = 'form-control hidden';
				document.getElementById("iNomeMaeInput").className = 'form-control hidden';
			}
			

			function salvarPai(){
			   var endereco = "localhost";
			   var nome = document.getElementById("iNome").value;
			   
			   $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarPai?nome="+nome,
		            dataType: "json",
		            success: function(result){
		            	console.log(result[result.length-1].nome);
		            	
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
				var endereco = "localhost";
				   var nome = document.getElementById("iNomeMae").value;
				   
				   $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarMae?nomeMae="+nome,
			            dataType: "json",
			            success: function(result){
			            	console.log(result[result.length-1].nome);
			            	
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
					
		</script>
	</section>

</body>
</html>
