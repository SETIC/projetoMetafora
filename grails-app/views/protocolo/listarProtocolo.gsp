<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Protocolo . Módulo Protocolo</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>




function printDiv(id1, id2)

{
  var divToPrint1=document.getElementById(id1);
  var divToPrint2=document.getElementById(id2);
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
  newWin.document.write(divToPrint1.outerHTML);
  newWin.document.write("<hr/>");
  newWin.document.write(divToPrint2.outerHTML);
  newWin.print();
  newWin.close();
 
}
</script>
	<script>
function deletar(id) {
 var resposta = confirm("Deseja exluir este protocolo?");

 if (resposta == true){
 location.href="/projetoMetafora/protocolo/deletar/"+id }

}
</script>
	<section class="content-header">
		<h1>
			Protocolo <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Protocolo" action="listarProtocolo">Protocolo</g:link></li>
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
				<label>Protocolos Enviados</label>
				<table id="listarprotocolosEnviados"
					class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th style="text-align: left;">Número</th>
							<th style="text-align: left;">Data do Protocolo</th>
							<th style="text-align: left;">Data da Emissão</th>
							<th style="text-align: left;">Destino</th>
							<th style="text-align: left;">Assunto</th>
							<th style="text-align: left;">Situação</th>

						</tr>
					</thead>
					<tbody>
						<g:each in='${protocolosEnviados?}'>
							<tr class='linha_registro'>
								<td>
									<div class="opcoes">
										<div style="display: inline" width="400">

											<g:if test="${perm2}">
												<div title="Editar protocolo" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/Protocolo/editar/${it.protocolo.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></div>
												<div title="Excluir protocolo" onclick="deletar(${it.protocolo.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></div>
											</g:if>
											<div title="Ver detalhes do protocolo"
												class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/protocolo/verInfoProtocolo/${it.protocolo.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></div>
										</div>

									</div>
								</td>

								<td>
									${it.protocolo.numero}
								</td>

								<td><g:formatDate format="dd/MM/yyyy" type="datetime" style="MEDIUM"
										date="${it.protocolo.dataProtocolo}" /></td>

								<td><g:formatDate format="dd/MM/yyyy"  type="datetime" style="MEDIUM"

										date="${it.protocolo.dataEmissao}" /></td>

								<td>
									${it.funcionarioSetorDestino.funcionario.cidadao.pessoaFisica.pessoa.nome} - ${it.funcionarioSetorDestino.setor.nome}
								</td>

								<td>
									${it.protocolo.assunto}
								</td>
								
								<td>
									${it.protocolo.situacao.nome} - ${it.protocolo.situacao.tipo}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			<br> <br>


			<script>
			function preencheCampoHidden(id){
				var campo = document.getElementById("idProtocoloHidden");
				campo.value = id;
				
			}
			</script>

			<div class="box box-white">
				<label>Protocolos Recebidos</label>
				<table id="listarprotocolosAceitos"
					class="table table-striped table-hover example">
					<thead>
						<tr>

							<th style="width: 60px;"></th>
							<th style="text-align: left;">Número</th>
							<th style="text-align: left;">Data do Protocolo</th>
							<th style="text-align: left;">Data da Emissão</th>
							<th style="text-align: left;">Origem</th>
							<th style="text-align: left;">Assunto</th>
							<th style="text-align: left;">Situação</th>

						</tr>
					</thead>
					<tbody>
						<g:each in='${protocolosAceitos?}'>
							<tr class='linha_registro'>
								<td>
									<div class="opcoes">
										<div style="display: inline" width="400">

											<g:if test="${perm2}">
												<div title="Editar protocolo" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/Protocolo/editar/${it.protocolo.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></div>
											</g:if>


											<div title="Ver detalhes do protocolo" class="btn btn-success btn-xs btn-flat">

											<a style="color: #fff" href="/projetoMetafora/protocolo/verInfoProtocolo/${it.protocolo.id}">
											<span class="glyphicon glyphicon-eye-open">
											</span>
											</a>
											</div>

											<div title="Tramitar Protocolo" class="btn btn-warning btn-xs btn-flat">
											<a style="color: #fff" data-target="#myModalTramite" data-toggle="modal">
											<span class="glyphicon glyphicon-send" onclick="preencheCampoHidden(${it.protocolo.id})">
											</span>
											</a>
											</div>
											
											</div>

									</div>
								</td>
								<td>
									${it.protocolo.numero}
								</td>

								<td><g:formatDate format="dd/MM/yyyy"  type="datetime" style="MEDIUM"
										date="${it.protocolo.dataProtocolo}" /></td>

								<td><g:formatDate format="dd/MM/yyyy"  type="datetime" style="MEDIUM"

										date="${it.protocolo.dataEmissao}" /></td>

								<td>
									${it.funcionarioSetorOrigem.funcionario.cidadao.pessoaFisica.pessoa.nome} - ${it.funcionarioSetorOrigem.setor.nome}
								</td>

								<td>
									${it.protocolo.assunto}
								</td>
								
								<td>
									${it.protocolo.situacao.nome} - ${it.protocolo.situacao.tipo}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</div>

			<!-- Button trigger modal -->
			<g:if test="${perm2}">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal">
					<i class="fa fa-plus"></i> Novo Protocolo
				</button>
			</g:if>

			<button class="btn btn-danger btn-flat"
				onClick="printDiv('listarprotocolosEnviados', 'listarprotocolosAceitos')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			<!-- Modal -->
			<g:if test="${perm2}">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Cadastro de
									Protocolo</h4>
							</div>
							<div class="modal-body">
								<g:form controller="Protocolo" action="salvar" class="form"
									enctype="multipart/form-data">
									<fieldset>
										<div class="form-heading">
											<label>Número</label>
											<div class="controls">
												<g:textField class="form-control" name="numero" value=""
													required="true" />
											</div>
										</div>
										<br>

										<div class="form-group">
											<label for="iProtocolo" class="col-sm-4 control-label">Data
												do Protocolo </label>
											<div class="col-sm-16">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" id="iDataProtocolo"
													name="dataProtocolo" required="true" />
											</div>
										</div>
										<br>
										<div class="form-group">
											<label for="iDataEmissao" class="col-sm-4 control-label">Data
												de Emissão </label>
											<div class="col-sm-16">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" id="iDataEmissao" name="dataEmissao"
													required="true" />
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Número do Documento</label>
											<div class="controls">
												<g:textField class="form-control" name="numeroDocumento"
													value="" required="true" />
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Assunto</label>
											<div class="controls">
												<g:textField class="form-control" name="assunto" value="" 
													required="true" />
											</div>
										</div>
										<br>
										

										<div class="form-heading">
											<label>Funcionario Setor de Destino</label>
											<div class="controls ">
												<select class="form-control selectpicker"
													data-live-search="true" name="funcionarioSetorDestino"
													id="idFuncionarioSetorDestino" onchange="">
													<g:each in="${funcionarioSetorDestino}">
														<option value="${it.id}">
															${it.funcionario.cidadao.pessoaFisica.pessoa.nome} - ${it.setor.nome}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<br>

										<div class="form-heading">
											<label>Situação</label>
											<div class="controls ">
												<select class="form-control selectpicker"
													data-live-search="true" name="situacao" id="idSituacao"
													onchange="">
													<g:each in="${situacoes}">
														<option value="${it.id}">
															${it.nome} -
															${it.tipo}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Tipo de Documento</label>
											<div class="controls ">
												<select class="form-control selectpicker"
													data-live-search="true" name="tipoDocumento"
													id="idTipoDocumento" onchange="">
													<g:each in="${tipoDocumentos}">
														<option value="${it.id}">
															${it.nome}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										</br>
										<div class="form-heading">
											<label>Observação</label>
											<div>
												<textarea rows="3" class="form-control" name="texto"
													placeholder="Insira uma observação relacionada ao protocolo"></textarea>
											</div>
										</div>

										<br> 
										
									<label>Anexo</label>
										<script type="text/javascript">  
										function limparCampoFile1(){
											document.getElementById("arquivo[]").value = "";
										}
										
										$(document).ready(function(){  
										 
										    var input = '<label style="display: block; font-weight: initial;"> <input type = "file" name ="arquivo[]" id="arquivo[]" enctype="multipart/form-data"/> <a href="#" class="remove"> Excluir </a> </label>';  
										    $("input[name='addFile1']").click(function(e){  
										        $('#inputs_adicionais').append( input );  
										    });  
										 
										    $('#inputs_adicionais').delegate('a','click',function(e){  
										        e.preventDefault();  
										        $(this).parent('label').remove();  
										    });  
										 
						                 }); 
										 
										</script> 
								        <input type = "file" name ="arquivo[]" id="arquivo[]" enctype="multipart/form-data"/>
								        <br />
								        <fieldset id="inputs_adicionais" style="border: none">  
								        </fieldset> 
								        <br />
								        <input type="button" class="btn btn-primary btn-flat" name="addFile1" value="Novo Anexo" />
								        <input type="button" name="limpar" class="btn btn btn-flat" value="Limpar" onclick="limparCampoFile()">
								        
									</fieldset>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary btn-flat">
											<i class="fa fa-save"></i> Cadastrar
										</button>
										<input type="reset" class="btn btn btn-flat" value="Limpar">
									</div>
								</g:form>
			          </g:if>

			<!-- ModalTramite -->
			<div class="modal fade" id="myModalTramite" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Tramite de
								protocolos</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Protocolo" action="salvarTramite"
								class="form" enctype="multipart/form-data">
								<fieldset>
									<div class="form-heading">
										<input type="hidden" name="protocoloHidden" id="idProtocoloHidden"/>
										<label>Destino</label>
										<div class="controls ">

											<select class="form-control selectpicker"
												data-live-search="true"
												name="funcionarioSetorDestinoTramite"
												id="idFuncionarioSetorDestinoTramite" onchange="">
												<g:each in="${funcionarioSetorDestino}">
													<option value="${it.id}">
														${it.funcionario.cidadao.pessoaFisica.pessoa.nome}
													</option>
												</g:each>
											</select>

										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Observação</label>
										<div class="controls">
											<g:textArea class="form-control" name="observacao" value=""
												required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">

									<label>Anexo</label>

										<script type="text/javascript">  

										function limparCampoFile(){
											document.getElementById("arquivo[]").value = "";
										}
										
										$(document).ready(function(){  
										 
										    var input = '<label style="display: block; font-weight: initial;"> <input type = "file" name ="arquivo[]" id="arquivo[]" enctype="multipart/form-data"/> <a href="#" class="remove"> Excluir </a> </label>';  
										    $("input[name='addFile']").click(function(e){  
										        $('#inputs_adicionais_tramite').append( input );  
										    });  
										 
										    $('#inputs_adicionais_tramite').delegate('a','click',function(e){  
										        e.preventDefault();  
										        $(this).parent('label').remove();  
										    });  
										 
										}); 
										 
										</script>
										<input type = "file" name ="arquivo[]" id="arquivo[]" enctype="multipart/form-data"/>
								        <br />
								        <fieldset id="inputs_adicionais_tramite" style="border: none">  
								        </fieldset> 
								        <br />
								        <input type="button" class="btn btn-primary btn-flat" name="addFile" value="Novo Anexo" />
								        <input type="button" name="limpar" class="btn btn btn-flat" value="Limpar" onclick="limparCampoFile()">
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
	</section>
</body>
</html>
