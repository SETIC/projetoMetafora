<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Protocolo . Módulo Protocolo</title>
<meta name="layout" content="public" />
</head>
<body>
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
	<script>
function deletar(id) {
 var resposta = confirm("Deseja exluir esta protocolo?");

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
				<table id="listarprotocolo"
					class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th>Numero</th>
							<th>Data do Protocolo</th>
							<th>Data da Emissao</th>
							<th>Numero do Documento</th>
							<th>Assunto</th>

						</tr>
					</thead>
					<tbody>
						<g:each in ='${protocolo?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										<ul style="display: inline">

											<g:if test="${perm2}">
												<li class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/Protocolo/editar/${it.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
												<li onclick="deletar(${it.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></li>
											</g:if>
											<li title="Ver detalhes do protocolo"
												class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/protocolo/verInfoProtocolo/${it.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></li>
										</ul>

									</div>
								</td>

								<td>
									${it.numero}
								</td>

								<td><g:formatDate format="dd/MM/yyyy"
										date="${it.dataProtocolo}" /></td>

								<td><g:formatDate format="dd/MM/yyyy"
										date="${it.dataEmissao}" /></td>

								<td>
									${it.numeroDocumento}
								</td>

								<td>
									${it.assunto}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			
			
			<div class='container'>
        <p>
            Select File: <input type='file' id='file' name="arquivo"> 
            <input type='button' value='Upload!'>
        </p>
        <div class='progress_outer'>
            <div id='_progress' class='progress'></div>
        </div>
    </div>

			<!-- Button trigger modal -->
			<g:if test="${perm2}">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal">
					<i class="fa fa-plus"></i> Novo Protocolo
				</button>
			</g:if>

			<button class="btn btn-danger btn-flat"
				onClick="printDiv('listarprotocolo')">
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
								<g:form controller="Protocolo" action="salvar" class="form" enctype="multipart/form-data">
									<fieldset>
										<div class="form-heading">
											<label>Numero</label>
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
											<label>Numero do Documento</label>
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
											<label>Funcionario Setor</label>
											<div class="controls ">
												<select class="form-control selectpicker"
													data-live-search="true" name="funcionarioSetor"
													id="idFuncionarioSetor" onchange="">
													<g:each in="${funcionariosSetor}">
														<option value="${it.id}">
															${it.funcionario.cidadao.pessoaFisica.pessoa.nome}
														</option>
													</g:each>
												</select>
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
															${it.funcionario.cidadao.pessoaFisica.pessoa.nome}
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
										
										<p>
							            Select File: <input type='file' id='file' name="arquivo" > 
							            <input type='button' value='Upload!'>
							        </p>
										 <button type="button" class="btn btn-primary btn-flat" onclick = "upload()">upload
										 <i class="fa fa-chevron-circle-right"></i></button>
									
									
									 </fieldset>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary btn-flat">
											<i class="fa fa-save"></i> Cadastrar
										</button>
										<input type="reset" class="btn btn btn-flat" value="Limpar">
									</div>
								</g:form>
							</g:if>
					 </section>
				  </body>
				</html>