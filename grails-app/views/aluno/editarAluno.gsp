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
			<g:each in='${alunos}'>
				<g:set var="pessoa" value="${it.cidadao.pessoaFisica.pessoa}" />
				<g:set var="pessoaFisica" value="${it.cidadao.pessoaFisica}" />
				<g:set var="cidadao" value="${it.cidadao}" />
			</g:each>
			<div>
				<br>
				
				<g:form controller="Aluno" action="atualizar" enctype="multipart/form-data" class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${pessoa?.id}" />
					<fieldset>
						<div class="row">
							<div class="progress" id="progress1">
								<div class="progress-bar" role="progressbar" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
								<span class="progress-type">Progresso Geral</span><span
									class="progress-completed">0%</span>
							</div>
						</div>
						<div class="row" style="box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5);">
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
								<label for="inputNome3" class="col-sm-2 control-label">Nome *</label>
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
								<label for="iRG" class="col-sm-2 control-label">RG</label>
								<div class="col-sm-10" style="width:330px">
									<g:textField class="form-control" id="iRgNumero"
										name="rgNumero"  value="${cidadao.rgNumero}"/>
								</div>
							</div>
						
							<div class="form-group">
								<label for="iOrgaoEmissorDaIdentidade" class="col-sm-2 control-label">RG - Orgão Expedidor</label>
								<div class="col-sm-10" style="width:330px">
									<g:textField class="form-control" id="iOrgaoExpedidor"
										name="rgOrgaoExpedidor"  value="${cidadao.rgOrgaoExpedidor}" />
								</div>
							</div>
						
							<div class="form-group">
								<label for="iDataDeNascimento" class="col-sm-2 control-label">RG - Data de Emissão</label>
								<div class="col-sm-10">
									<g:formatDate format="yyyy-MM-dd" date="${date}" />
									<g:datePicker noSelection="['':'']" precision="day"
										class="form-control" id="iDataDeEmissao"
										name="rgDataDeEmissao" required="true" />
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="irgComplemento"
									class="col-sm-2 control-label">RG - Complemento</label>
								<div class="col-sm-10" style="width:330px">
									<g:textField class="form-control"
										id="iRgComplemento" name="rgComplemento"
										 value="${cidadao.rgComplemento}"/>
								</div>
							</div>
							
				
							
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
								<label for="inputrcNomeDoLivro3" class="col-sm-2 control-label">Número
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
											<label for="iDataDeNascimento" class="col-sm-2 control-label">Data do Registro</label>
											<div class="col-sm-10">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" id="iDataDoRegistro"
													name="rcDataDoRegistro" value="${pessoaFisica.rcDataDoRegistro}" />
											</div>
										</div>
										<br>
										<div class="form-group">
											<label for="iNomeDoCartorioDoRegistro"
												class="col-sm-2 control-label">Cidade do Cartório do Registro</label>
											<div class="col-sm-10">
												<g:textField class="form-control"
													id="iRcCidade" name="rcCidade" style="width: 300px"
													placeholder="Cidade do registro " value="${pessoaFisica.rcCidade}"/>
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
								<label for="iNomePaiInput" class="col-sm-2 control-label">Nome
									do Pai</label>
								<div class="col-sm-10">
									<g:textField class="form-control hidden" id="iNomePaiInput"
										name="nomePaiInput" />
									<div id="iDivSelectPicker" class="row">
										<div class="col-sm-11" style="width:380px">
										
											
											<g:textField class="form-control" id="combopai" name="pai" style="width: 300px"
													placeholder="" value="${parentescoPai?.pessoa?.nome}" disabled="disabled" />
										
											
											
										</div>
										<div class="col-sm-1">
											<button type="button" class="btn btn-primary btn-flat"
												data-toggle="modal" data-target="#modalCadastrarPai">Novo</button>
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="iNomeMaeInput" class="col-sm-2 control-label">Nome
									da Mãe</label>
								<div class="col-md-10" >
									<g:textField class="form-control hidden" id="iNomeMaeInput" name="nomeMaeInput" />
									<div id="iDivSelectPicker1" class="row">
										<div class="col-sm-11" style="width:380px">
										
									
										<g:textField class="form-control" id="combopai" name="pai" style="width: 300px"
													placeholder="" value="${parentescoMae?.pessoa?.nome}" disabled="disabled" />
										

										</div>
										<div class="col-sm-1">
											<button type="button" class="btn btn-primary btn-flat"
												data-toggle="modal" data-target="#modalCadastrarMae">Novo</button>
										</div>
										</div>
									</div>
								</div>

							<br>
							
							<div class="form-group">
							<label for="inputCorRaca3" class="col-sm-2 control-label" 
								required="true">Raça/Cor</label>
							<div class="col-sm-10" style="width:380px">
								<select name="corRaca" id="iCorRaca"
									class="form-control selectpicker">
										
									<option value="Branca" <g:if test="${pessoaFisica.cor == 'Branca'}"> selected </g:if> >Branca</option> 
									<option value="Amarela" <g:if test="${pessoaFisica.cor == 'Amarela'}"> selected </g:if> >Amarela</option> 
									<option value="Preta" <g:if test="${pessoaFisica.cor == 'Preta'}"> selected </g:if> >Preta</option> 
									<option value="Parda" <g:if test="${pessoaFisica.cor == 'Parda'}"> selected </g:if> >Parda</option> 
									<option value="Indigena" <g:if test="${pessoaFisica.cor == 'Indigena'}"> selected </g:if> >Indigena</option> 
									<option value="Não Declarada" <g:if test="${pessoaFisica.cor == 'Não Declarada'}"> selected </g:if> >Não Declarada</option>
										
								</select>
							</div>
						</div>
										
										<div class="form-group">
											<label class="col-sm-2 control-label">Tipos de Deficiência</label>
											<div class="col-sm-10 controls" style="width:380px" >
							
												<select class="form-control selectpicker"
									data-live-search="true" name="necessidadesEspeciais"
									multiple="multiple">
									<g:each in="${necessidadesEspeciais}" var="allNe">
											<g:if test="${pfne.contains(allNe.id)}">
												<option value="${allNe.id}" selected>
													${allNe.descricao}
												</option>
											</g:if>
											<g:else>
												<option value="${allNe.id}">
													${allNe.descricao}
												</option>
											</g:else>
										
									</g:each>					

								</select>
								
											</div>
										</div>
							<div class="form-group">
								<label for="inputnacionalidade3" class="col-sm-2 control-label">Nacionalidade *</label>
								<div class="col-sm-10">
									<g:textField class="form-control" required="true"
										name="nacionalidade" style="width: 300px"
										value="${cidadao.nacionalidade}" />
								</div>
							</div>
							<br>
							
							<div class="form-group">
							<label for="inputestadoCivil3" class="col-sm-2 control-label"
								required="true">Estado Civil</label>
							<div class="col-sm-4">
								<select name="estadoCivil" id="iestadoCivil"
									class="form-control selectpicker">
									<option value="SOLTEIRO(A)"
										<g:if test="${cidadao.estadoCivil == 'SOLTEIRO(A)'}"> selected </g:if>>SOLTEIRO(A)</option>
									<option value="CASADO(A)"
										<g:if test="${cidadao.estadoCivil == 'CASADO(A)'}"> selected </g:if>>CASADO(A)</option>
									<option value="DIVORCIADO(A)"
										<g:if test="${cidadao.estadoCivil == 'DIVORCIADO(A)'}"> selected </g:if>>DIVORCIADO(A)</option>
									<option value="VIÚVO(A)"
										<g:if test="${cidadao.estadoCivil == 'VIÚVO(A)'}"> selected </g:if>>VIÚVO(A)</option>
								</select>
							</div>
						</div>
						
							 <br>
							 <fieldset>
								<table id="listarDocumentosAluno" class="table table-bordered">
									<legend class="scheduler-border">Documentos</legend>
									<thead>
										<tr>
											<th>Nome do Documento</th>
											<th style="width:395px">Data</th>
											<th>Remover</th>
										</tr>
										<g:each in="${documentosAluno}">
											<tr class="info">
												<td>
													${it.arquivo}
												</td>
												<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM"
														date="${it.dataDocumento}" /></td>
												<td>
					                           <a href="/projetoMetafora/aluno/removerDocumento/${it.id}"><span 
												class="glyphicon glyphicon-remove"></span></a>
												</td>
											</tr>
										</g:each>
									</thead>
								</table>
					        </fieldset>
					        <br>
							<script type="text/javascript">  
								function limparCampoFile1(){
									document.getElementById("documentos[]").value = "";
								}
								
								 $(document).ready(function(){  
								 
								    var input = '<label style="display: block"> <input type = "file" name ="documentos[]" id="documentos[]" enctype="multipart/form-data"/> <a href="#" class="remove">Excluir</a></label>';  
								    $("input[name='addFile1']").click(function(e){  
								        $('#inputs_adicionais').append( input );  
								    });  
								 
								    $('#inputs_adicionais').delegate('a','click',function(e){  
								        e.preventDefault();  
								        $(this).parent('label').remove();  
								    });  
								 
					                }); 
							</script>  
					        <label style="display: block"><input type="button" name="addFile1" value="Novo Documento" /></label>
					        
					        <label style="display: block"><input type = "file" name ="documentos[]" id="documentos[]" enctype="multipart/form-data"/> <input type="button" name="limpar" value="Limpar" onclick="limparCampoFile()"> </label>
					         
					        <fieldset id="inputs_adicionais" style="border: none">  
				       		</fieldset>
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
						</div>
						<div class="hiddenStepInfo" id="step-2" style="margin-top: 2%;">
							<h3>Endereço</h3>

							<div class="form-group">
								<label for="iCep" class="col-sm-2 control-label">CEP</label>
								<div id="iDivInputCep" class="col-sm-10">
									<g:textField type="number" class="form-control"
										data-mask="99999-999" name="cep" id="iCep"
										onfocusout="javascript: requestAjax(this);" placeholder="CEP"
										value="${reside?.cep}" />
									<p id="iMensagemCEP" class="text-danger">Por favor digite
										um CEP válido.</p>
								</div>
							</div>
							<div class="form-group">
								<label for="iLogradouro" class="col-sm-2 control-label">Logradouro</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="endereco"
										id="iLogradouro" placeholder="Logradouro"
										value="${reside?.logradouro?.tipoLogradouro?.tipoLogradouro} ${reside?.logradouro?.logradouro}">
								</div>
							</div>
							<div class="form-group">
								<label for="iNumero" class="col-sm-2 control-label">Número</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" name="numero"
										id="iNumero" placeholder="Número" value="${reside?.numero}">
								</div>
							</div>
							<div class="form-group">
								<label for="iComplemento" class="col-sm-2 control-label">Complemento</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="complemento"
										id="iComplemento" placeholder="Complemento"
										value="${reside?.complemento}">
								</div>
							</div>
							<div class="form-group">
								<label for="iBairro" class="col-sm-2 control-label">Bairro</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="bairro"
										id="iBairro" placeholder="Bairro"
										value="${reside?.bairro?.bairro}">
								</div>
							</div>
							<div class="form-group">
								<label for="iUf" class="col-sm-2 control-label">UF</label>
								<div class="col-sm-10">
										
										       <select  name="uf" id="iUf" class="form-control"> 
													<option value="AC" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'AC'}"> selected </g:if> >Acre</option> 
													<option value="AL" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'AL'}"> selected </g:if> >Alagoas</option> 
													<option value="AM" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'AM'}"> selected </g:if> >Amazonas</option> 
													<option value="AP" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'AP'}"> selected </g:if> >Amapá</option> 
													<option value="BA" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'BA'}"> selected </g:if> >Bahia</option> 
													<option value="CE" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'CE'}"> selected </g:if> >Ceará</option> 
													<option value="DF" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'DF'}"> selected </g:if> >Distrito Federal</option> 
													<option value="ES" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'ES'}"> selected </g:if> >Espírito Santo</option> 
													<option value="GO" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'GO'}"> selected </g:if> >Goiás</option> 
													<option value="MA" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'MA'}"> selected </g:if> >Maranhão</option> 
													<option value="MT" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'MT'}"> selected </g:if> >Mato Grosso</option> 
													<option value="MS" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'MS'}"> selected </g:if> >Mato Grosso do Sul</option> 
													<option value="MG" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'MG'}"> selected </g:if> >Minas Gerais</option> 
													<option value="PA" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'PA'}"> selected </g:if> >Pará</option> 
													<option value="PB" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'PB'}"> selected </g:if> >Paraíba</option> 
													<option value="PR" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'PR'}"> selected </g:if> >Paraná</option> 
													<option value="PE" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'PE'}"> selected </g:if> >Pernambuco</option> 
													<option value="PI" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'PI'}"> selected </g:if> >Piauí</option> 
													<option value="RJ" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'RJ'}"> selected </g:if> >Rio de Janeiro</option> 
													<option value="RN" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'RN'}"> selected </g:if> >Rio Grande do Norte</option> 
													<option value="RO" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'RO'}"> selected </g:if> >Rondônia</option> 
													<option value="RS" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'RS'}"> selected </g:if> >Rio Grande do Sul</option> 
													<option value="RR" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'RR'}"> selected </g:if> >Roraima</option> 
													<option value="SC" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'SC'}"> selected </g:if> >Santa Catarina</option> 
													<option value="SE" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'SE'}"> selected </g:if> >Sergipe</option> 
													<option value="SP" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'SP'}"> selected </g:if> >São Paulo</option> 
													<option value="TO" <g:if test="${reside?.bairro?.municipio?.estado?.abreviacao == 'TO'}"> selected </g:if> >Tocantins</option> 
												</select>
										
								</div>
							</div>
							<div class="form-group">
								<label for="iMunicipio" class="col-sm-2 control-label">Município</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="municipio"
										id="iMunicipio" placeholder="Município"
										value="${reside?.bairro?.municipio?.municipio}">
								</div>
							</div>
							<div class="form-group" style="margin-top: 3%;">
								<div class="col-sm-offset-9 col-sm-3"
									style="margin-left: 77.5%;">
									<button type="button" class="btn btn-primary btn-flat"
										onclick="javascript: resetActive(div1, event, 0, 'step-1');">
										<i class="fa fa-chevron-circle-left"></i> Anterior
									</button>
									<button type="submit" onclick="javascript:;"
										class="btn btn-primary btn-flat">
										<i class="fa fa-refresh"></i> Atualizar
									</button>
									<button style="display: inline-block;" type="submit"
										class="btn btn-default btn-flat">
										<a href="/projetoMetafora/aluno/listar/">Cancelar</a>
										</button>
								</div>
							</div>
						</div>

						<br>
		

					<br>
				</g:form>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalCadastrarPai" tabindex="-1" role="dialog" data-focus-on="input:first" aria-labelledby="myModalLabel"  >
			  <div class="modal-dialog" role="document" style="margin-top: 20%; width:800px">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">Cadastrar Pai</h4>
			      </div>
			      <div class="modal-body">
			        <div class="form-horizontal" >
						
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">CPF:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iCPFPai" name="cpfPai" value="${parentescoPai?.pessoa?.cpfCnpj}" onBlur="validarCpfPai()" />
						    </div>
						  </div>

						 <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Nome:</label>
						    <div class="col-sm-10">
						      <g:textField class="form-control" id="iNomePai" name="nomePai" placeholder="Nome" required="false" value="${parentescoPai?.pessoa?.nome}" />
						    </div>
						  </div>
						  	 
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Estado Civil:</label>
						    <div class="col-sm-10">
						      <select class="form-control" id="iEstadoCivilPai" name="estadoCivilPai" required="true" >
										<option value="SOLTEIRO(A)" <g:if test="${cidadaoPai?.estadoCivil} == 'SOLTEIRO(A)' "> selected </g:if> >SOLTEIRO(A)</option>
										<option value="CASADO(A)" <g:if test="${cidadaoPai?.estadoCivil} == 'CASADO(A)' "> selected </g:if> >CASADO(A)</option>
										<option value="DIVORCIADO(A)" <g:if test="${cidadaoPai?.estadoCivil} == 'DIVORCIADO(A)' "> selected </g:if> >DIVORCIADO(A)</option>
										<option value="VIÚVO(A)" <g:if test="${cidadaoPai?.estadoCivil} == 'VIÚVO(A)' "> selected </g:if> >VIÚVO(A)</option>
									</select>
						    </div>
						  </div>
						  
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Profissão:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iProfissaoPai" name="profissaoPai" value="${cidadaoPai?.profissao}" />
						    </div>
						  </div>
						  
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Tipo Contato:</label>
						    
						    <div class="col-sm-10">
					     
						    	<select class="form-control selectpicker" data-live-search="true" name="tipoContatoPai" id="iTipoContatoPai" >
									<g:each in="${tiposContato}" var="tipoContato">
										<option value="${tipoContato?.id}" <g:if test="${tipoContato?.tipoContato} == ${contatoPai?.tipoContato?.tipoContato} "> selected </g:if> >
											${tipoContato?.tipoContato}
										</option>
									</g:each>
								</select> 
						     
						    </div>
						  </div>
						  
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Contato:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iContatoPai" name="contatoPai" value="${contatoPai?.contato}"/>
						    </div>
						  </div>
						  
						  

					</div>
			      </div>
			      <hr/>
			      <div class="modal-footer">

			        <button type="button" class="btn btn-success btn-flat" data-dismiss="modal" onclick="salvarPai()">Cadastrar</button>
			        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal" >Cancelar</button>

			      </div>
			    </div>
			  </div>
			</div>


			<!-- Modal -->
			<div class="modal fade" id="modalCadastrarMae" tabindex="-1" role="dialog" data-focus-on="input:first" aria-labelledby="myModalLabel"  >
			  <div class="modal-dialog" role="document" style="margin-top: 20%; width:800px">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">Cadastrar Mãe</h4>
			      </div>
			      <div class="modal-body">
			        <div class="form-horizontal" >
						
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">CPF:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iCPFMae" name="cpfMae" value="${parentescoMae?.pessoa?.cpfCnpj}" onBlur="validarCpfMae()"/>
						    </div>
						  </div>

						 <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Nome:</label>
						    <div class="col-sm-10">
						      <g:textField class="form-control" id="iNomeMae" name="nomeMae" placeholder="Nome" required="false" value="${parentescoMae?.pessoa?.nome}"/>
						    </div>
						  </div>
					  	 
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Estado Civil:</label>
						    <div class="col-sm-10">
									<select class="form-control" id="iEstadoCivilMae" name="estadoCivilMae" required="true" >
										<option value="SOLTEIRO(A)" <g:if test="${cidadaoMae?.estadoCivil} == 'SOLTEIRO(A)' "> selected </g:if> >SOLTEIRO(A)</option>
										<option value="CASADO(A)" <g:if test="${cidadaoMae?.estadoCivil} == 'CASADO(A)' "> selected </g:if> >CASADO(A)</option>
										<option value="DIVORCIADO(A)" <g:if test="${cidadaoMae?.estadoCivil} == 'DIVORCIADO(A)' "> selected </g:if> >DIVORCIADO(A)</option>
										<option value="VIÚVO(A)" <g:if test="${cidadaoMae?.estadoCivil} == 'VIÚVO(A)' "> selected </g:if> >VIÚVO(A)</option>
									</select>
						    </div>
						  </div>
						  
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Profissão:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iProfissaoMae" name="profissaoMae" value="${cidadaoMae?.profissao}" />
						    </div>
						  </div>
						  
						  <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Tipo Contato:</label>
						    
						    <div class="col-sm-10">
					     
						    	<select class="form-control selectpicker" data-live-search="true" name="tipoContatoMae" id="iTipoContatoMae" >
									<g:each in="${tiposContato}" var="tipoContato">
										<option value="${tipoContato?.id}" <g:if test="${tipoContato?.tipoContato} == ${contatoMae?.tipoContato?.tipoContato} "> selected </g:if> >
											${tipoContato?.tipoContato}
										</option>
									</g:each>
								</select> 
						     
						    </div>
						  </div>

						 <div class="form-group" style="margin-bottom: 5px;">
    						<label for="inputEmail3" class="col-sm-2 control-label">Contato:</label>
						    <div class="col-sm-10">
						      <g:textField  class="form-control" id="iContatoMae" name="contatoMae" value="${contatoMae?.contato}"/>
						    </div>
						  </div>	
					</div>
			      </div>
			     
						<hr/>
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
        
		<!-- Script buscar dados de acordo com CEP -->
		<g:javascript src="script-buscar-cep.js" />
		<script type="text/javascript">

			function salvarPai(){
				 //var endereco = "192.168.1.252";
			   var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
			   var nome = document.getElementById("iNomePai").value;
			   var cpf = document.getElementById("iCPFPai").value;
			   var estadoCivil = document.getElementById("iEstadoCivilPai").value;
			   var profissao = document.getElementById("iProfissaoPai").value;
			   
			   $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarPai?nome="+nome+"&cpf="+cpf+"&estadoCivil="+estadoCivil+"&profissao="+profissao,
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
				 //var endereco = "192.168.1.252";
				   var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
				   var nome = document.getElementById("iNomeMae").value;
				   var cpf = document.getElementById("iCPFMae").value;
				   var estadoCivil = document.getElementById("iEstadoCivilMae").value;
				   var profissao = document.getElementById("iProfissaoMae").value;

				   console.log("Teste de mae --- " + nome)
				   
				   $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/aluno/cadastrarMae?nome="+nome+"&cpf="+cpf+"&estadoCivil="+estadoCivil+"&profissao="+profissao, 
			            dataType: "json",
			            success: function(result){
			            	console.log(result[result.length-1].nome);
			            	
			            	document.getElementById("iDivSelectPicker1").className = 'form-control hidden';
			            	
			            	document.getElementById('iNomeMaeInput').className = 'form-control';
			            	document.getElementById('iNomeMaeInput').disabled = true;
			            	document.getElementById('iNomeMaeInput').value = result[result.length-1].nome;

			            	$(function() {
								$('#twoModalsExample1').modal('hide');
							});						
					    } 
			        });
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
			

			
			function mudarEscola(){
		    	  
				 //var endereco = "192.168.1.252";
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
			  //var endereco = "192.168.1.252";
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
		       
		    function validarCpfMae() {
				var cpf = document.getElementById("iCPFMae").value;
				$.ajax({
					type : "GET",
					url : "http://localhost:8080/projetoMetafora/Aluno/getPessoaByCPF?cpf=" + cpf,
					//url : "http://192.168.1.252:8080/sisOs/ordemDeServico/validarMatriculaFuncOs?matriculasOS="+matriculasOS,
					dataType : "json",
					success : function(verifCpf) {
						if(verifCpf != null){
							document.getElementById("iNomeMae").value = verifCpf.nome;
							document.getElementById("iProfissaoMae").value = verifCpf.profissao;
							document.getElementById("iContatoMae").value = verifCpf.contato;
	
							document.getElementById("iTipoContatoMae").value = verifCpf.tipoContato;
							document.getElementById("iEstadoCivilMae").value = verifCpf.estadoCivil;
	
							//document.getElementById("idNomeMaeId").value = verifCpf.id;

							
											
						}

						
					if (verifCpf == "") {
						alert("matricula invalida ou inexistente");
						document.getElementById("iCpfMae").focus();

						}
					}
				});
	      }

		    function validarCpfPai() {
				var cpf = document.getElementById("iCPFPai").value;
				$.ajax({
					type : "GET",
					url : "http://localhost:8080/projetoMetafora/Aluno/getPessoaByCPF?cpf=" + cpf,
					//url : "http://192.168.1.252:8080/sisOs/ordemDeServico/validarMatriculaFuncOs?matriculasOS="+matriculasOS,
					dataType : "json",
					success : function(verifCpf) {
						if(verifCpf != null){
							document.getElementById("iNomePai").value = verifCpf.nome;
							document.getElementById("iProfissaoPai").value = verifCpf.profissao;
							document.getElementById("iContatoPai").value = verifCpf.contato;
	
							document.getElementById("iTipoContatoPai").value = verifCpf.tipoContato;
							document.getElementById("iEstadoCivilPai").value = verifCpf.estadoCivil;
	
							//document.getElementById("idNomePaiId").value = verifCpf.id;
											
						}

						
					if (verifCpf == "") {
						alert("matricula invalida ou inexistente");
						document.getElementById("iCpfPai").focus();

						}
					}
				});
	      }   
	       
			
		</script>
	</section>
</body>
</html>