<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Aluno . Módulo Pessoal</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Alunos <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Aluno" action="listar">Alunos</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
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
			 <style onload="hiddenInput();"></style>
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
			<g:each in='${alunos?}'>
				<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
				<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.cidadao}" />
			</g:each>
			<div>
			<br>
			<!-- modais-->
				<div class="modal fade" id="twoModalsExample"
					style="background-color: white; height: 300px;"
					aria-labelledby="myModalLabel" tabindex="-1" role="dialog"
					aria-hidden="true">
					<h4 class="modal-title" id="myModalLabel">Cadastro de filiação</h4>
					<br>
					<div class="modal-body">
						<!--	<g:form class="form-horizontal"> -->
						<div class="form-group">
							<label for="iNome" class="col-sm-2 control-label">nome</label>
							<g:textField class="form-control" id="iNome" name="nome" placeholder="Nome" required="true" />
							<br>
							<label for="iCpf" class="col-sm-2 control-label">CPF</label>
							<g:textField class="form-control" id="iCpf" name="cpf" placeholder="CPF" required="true" />
						</div>
						<button id="closemodal" type="button"
							data-dismiss="twoModalsExample" class="btn btn-success btn-flat"
							onclick="salvarPai();">Cadastrar</button>
						<!--  	</g:form> -->
					</div>
				</div>
				<br>
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
				<g:form controller="Aluno" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset>

						<div class="row">
							<div class="progress" id="progress1">
								<div class="progress-bar" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
								<span class="progress-type">Progresso Geral</span> <span
									class="progress-completed">0%</span>
							</div>
						</div>
						<div class="row"
							style="box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5);">
							<div class="step">
								<div id="div1" class="col-md-6 mouse-point activestep"
									onclick="javascript: resetActive(div1, event, 0, 'step-1');">
									<div class="row">
										<span class="fa fa-user"></span>
										<p>Identificação</p>
									</div>
								</div>
								<div id="div2" class="col-md-6 mouse-point"
									onclick="javascript: resetActive(div2, event, 50, 'step-2');">
									<div class="row">
										<span class="fa fa-home"></span>
										<p>Endereço</p>
									</div>
								</div>
							</div>
						</div>
						<div class="activeStepInfo" id="step-1" style="margin-top: 2%;">
							<h3>Identificação</h3>


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
							</div>
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
								<label for="iNomeDoPai" class="col-sm-2 control-label">Nome
									do Pai</label>
								<div class="col-sm-10">
									<g:textField class="form-control" id="iNomePaiInput"
										name="nomePaiInput" />
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
									<button class="btn btn-primary btn-flat" id="btn1"
										data-toggle="modal" data-target="#twoModalsExample">Novo</button>
								</div>

							</div>
							<br>
							<div class="form-group">
								<label for="iNomeDaMae" class="col-sm-2 control-label">Nome
									da Mãe</label>
								<div class="col-sm-10">
									<g:textField class="form-control" id="iNomeMaeInput"
										name="nomeMaeInput" />
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
										data-toggle="modal" data-target="#twoModalsExample1">Novo</button>
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
											<option value="${cidadao.estadoCivil}" selected>
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
											<option value="${cidadao.estadoCivil}" selected>
												${cidadao.estadoCivil}
											</option>
											<option value="SOLTEIRO(A)" selected>SOLTEIRO(A)</option>
											<option value="CASADO(A)">CASADO(A)</option>
											<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
											<option value="VIÚVO(A)">VIÚVO(A)</option>
										</select>

									</g:elseif>
									<g:elseif test="${cidadao.estadoCivil == 'CASADO(A)' }">
										<select class="form-control" name="estadoCivil"
											style="width: 300px">
											<option value="${cidadao.estadoCivil}" selected>
												${cidadao.estadoCivil}
											</option>
											<option value="SOLTEIRO(A)" selected>SOLTEIRO(A)</option>
											<option value="DIVORCIADO(A)">DIVORCIADO(A)</option>
											<option value="VIÚVO(A)">VIÚVO(A)</option>
										</select>

									</g:elseif>

									<g:elseif test="${cidadao.estadoCivil == 'DIVORCIADO(A)' }">
										<select class="form-control" name="estadoCivil"
											style="width: 300px">
											<option value="${cidadao.estadoCivil}" selected>
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
											<option value="${cidadao.estadoCivil}" selected>
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
								<label for="iCep" class="col-sm-2 control-label">CEP</label>
								<div id="iDivInputCep" class="col-sm-10">
									<g:textField type="number" class="form-control"
										data-mask="99999-999" name="cep" id="iCep"
										onfocusout="javascript: requestAjax(this);" placeholder="CEP" />
									<p id="iMensagemCEP" class="text-danger">Por favor digite
										um CEP válido.</p>
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
									<button type="submit" onclick="javascript: inputsHabilitado();"
											class="btn btn-primary btn-flat">
										<i class="fa fa-refresh"></i> Atualizar
									</button>
									<button style="display: inline-block;" type="submit"
										class="btn btn-default btn-flat">
										<a href="/projetoMetafora/aluno/listar/">Cancelar</a>
								</div>
							</div>
						</div>
						<br>
					</fieldset>

					<br>
				</g:form>
			</div>
			
		
		<g:javascript src="script-buscar-cep.js"/>
	</section>
</body>
</html>