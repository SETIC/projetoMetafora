<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar protocolo . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>

<script>
        	
   	function verificaCheck(id){

    var checkBox = document.getElementsByName("checkAnexo"); 
    for (var i = 0; i < checkBox.length; i++){ 
        if (checkBox[i].checked == true){ 
        	location.href="/projetoMetafora/protocolo/removerAnexo/"+id}
        	//alert(checkBox[i].value + " marcado.");
      
    }
}
   	   	
         </script> 
	<section class="content-header">
		<h1>
			Protocolos <small>Editar Dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i>Inicio</g:link></li>
			<li><g:link controller="Protocolo" action="listar">Protocolo</g:link></li>
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
			<g:each in='${protocolo?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Protocolo" action="atualizar" enctype="multipart/form-data" 
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Número</label>
							<div class="col-sm-10">
								<input class="form-control" required name="numero" type="number"
								<g:if test="${tipoEdicao == 'ACEITO'}">
									readonly="readonly"
								</g:if>
								<g:else>
									""
								</g:else>
								style="width: 300px" value="${it.numero}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="iProtocolo" class="col-sm-2 control-label">Data
								do Protocolo </label>
							<div class="col-sm-10">
								<g:formatDate format="dd/MM/yyyy" date="${date}" />
							<g:if test="${tipoEdicao == 'ACEITO'}">

									<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataProtocolo" name="dataProtocolo"  
									required="true" disabled="true" value="${it.dataProtocolo}" />
								</g:if>
								<g:else>
									<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataProtocolo" name="dataProtocolo"  
									required="true" value="${it.dataProtocolo}" />
								</g:else>

							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="iProtocolo" class="col-sm-2 control-label">Data
								de Emissão </label>
							<div class="col-sm-10">
								<g:formatDate format="dd/MM/yyyy" date="${date}" />

								<g:if test="${tipoEdicao == 'ACEITO'}">
									<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataEmissao" name="dataEmissao"				
									required="true" disabled="true" value="${it.dataEmissao}" />
								</g:if>
								<g:else>
									<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" id="iDataEmissao" name="dataEmissao"				
									required="true" value="${it.dataEmissao}" />
								</g:else>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Numero
								do Documento</label>
							<div class="col-sm-10">
								<input class="form-control" required name="numeroDocumento"
									type="text" style="width: 300px" value="${it.numeroDocumento}">
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Assunto</label>
							<div class="col-sm-4">
								<select class="selectpicker" " name="assunto"
									id="assuntoProtocolo" class="form-control">
									<div class="col-sm-10">
										<g:each in="${assunto}">
											<g:if test="${it.id == protocolo.assunto.id}">
												<option value="${it.id}" selected>
													${it.assunto}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.assunto}
												</option>
											</g:else>
										</g:each>
								</select>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Tipo
								Documento</label>
							<div class="col-sm-4">
								<select class="selectpicker" " name="tipoDocumento"
									id="comboTipoDocumento" class="form-control">
									<div class="col-sm-10">
										<g:each in="${tipoDocumentos}">
											<g:if test="${it.id == protocolo.tipoDocumento.id}">
												<option value="${it.id}" selected>
													${it.nome}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.nome}
												</option>
											</g:else>
										</g:each>
								</select>
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputTipoDocumento" class="col-sm-2 control-label">Situção </label>
							<div class="col-sm-4">
																							
								<g:if test="${protocolo.tramite.dataRecebimento[0] != null}">
								
								<select class="selectpicker" name="situacao" id="comboSituacao" class="form-control">
									<div class="col-sm-10">
	
										<g:each in="${situacoes}">
											<g:if test="${it.id == protocolo.situacao.id}">
												<option value="${it.id}" selected>
													${it.nome}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.nome}
												</option>
											</g:else>
										</g:each>
									</select>
									
								</g:if>	
								<g:else>
								
									<select class="selectpicker" name="situacao" id="comboSituacao" class="form-control" disabled >
									<div class="col-sm-10">
	
										<g:each in="${situacoes}">
											<g:if test="${it.id == protocolo.situacao.id}">
												<option value="${it.id}" selected>
													${it.nome}
												</option>
											</g:if>
											<g:else>
												<option value="${it.id}">
													${it.nome}
												</option>
											</g:else>
										</g:each>
									</select>
									
								</g:else>
									
							</div>
						</div>
						<br>

						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Interessado</label>
							<div class="col-sm-10">
								<input class="form-control" required name="interessado"
									type="text" style="width: 300px" value="${protocolo.interessado}">
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">CPF/CNPJ</label>
							<div class="col-sm-10">
								<input class="form-control" name="cpfCnpj"
									type="text" style="width: 300px" value="${protocolo.cpfCnpj}">
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Telefone</label>
							<div class="col-sm-10">
								<input class="form-control" name="telefone"
									type="text" style="width: 300px" value="${protocolo.telefone}">
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input class="form-control" name="email"
									type="text" style="width: 300px" value="${protocolo.email}">
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="problema" class="col-sm-2 control-label">Descrição da Situação</label>
							<div class="col-sm-4">
								<textarea rows="4" cols="5" class="form-control" placeholder="Descrição da situação do protocolo" name="descricaoSituacao">${protocolo.descricaoSituacao}</textarea>
							</div>
						</div>
						<br>
						<br>
					
					</fieldset>
					
					<table id="listarAnexos" class="table table-bordered">
						<legend class="scheduler-border">Anexos</legend>
						<thead>
						<tbody>
							<tr>
								<th>Nome do Arquivo</th>
								<th style="width:395px">Data</th>
								<th>Remover</th>
							</tr>
							<g:each in="${anexos}">
								<tr class="info">
									<td>
										${it.arquivo}
									</td>
										<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM"
												date="${it.dataAnexo}"/></td>
										<td>  
                                  <a href="/projetoMetafora/protocolo/removerAnexo/${it.id}"><span 
													class="glyphicon glyphicon-remove"></span></a>										
										</td>
											</tr>
										</g:each>
									 </thead>
									</tbody>
								</table>
										<script type="text/javascript">  

										function limparCampoFile(){
											document.getElementById("arquivo[]").value = "";
										}
										
										$(document).ready(function(){  
										    var input = '<label style="display: block"><input type = "file" name ="arquivo[]" id="arquivo[]" class="upload-file" data-max-size="300000000" enctype="multipart/form-data"/><a href="#" class="remove">Excluir</a></label>';  
										    $("input[name='addFile']").click(function(e){  
										        $('#inputs_adicionais').append( input );  
										    });  
										 
										    $('#inputs_adicionais').delegate('a','click',function(e){  
										        e.preventDefault();  
										        $(this).parent('label').remove();  
										    });  
										 
										}); 

										$(function(){
											
											//var inputAnexo = document.getElementById("novoAnexo").disabled = true;
										    var fileInput = $('.upload-file');
										    var maxSize = fileInput.data('max-size');
										    $('.form-horizontal').submit(function(e){
										      var fileSize = fileInput.get(0).files[0].size; //em bytes
										            if(fileSize>maxSize ){
										                alert('o tamanho do arquivo e maior do que ' + maxSize + ' bytes');
										                return false;
											         }
										    
										    });
										});
										 

							</script>
							
							<%--  
					        <label style="display: block"> <input type="button" name="addFile" value="Novo Anexo" id="novoAnexo"/></label>
					        
					        --%><label style="display: block"> <input type = "file" name ="arquivo[]" id="arquivo[]" class="upload-file" data-max-size="300000000" enctype="multipart/form-data"/>
					        <br><input type="button" name="limpar" class="btn btn btn-flat" value="Limpar" onclick="limparCampoFile()"> </label>
					         
					        <fieldset id="inputs_adicionais" style="border: none">  
					        </fieldset> 
					   <div style="margin: 0 17% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/protocolo/listarProtocolo/">Cancelar</a></li>
						</ul>
					</div>
				</g:form>
			</div>

		</div>
	</section>
</body>
</html>