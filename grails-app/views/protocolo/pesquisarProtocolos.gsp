<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Protocolo . Módulo Protocolo</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
		function printDiv(id) {
			var divToPrint = document.getElementById(id);
			newWin = window.open("");
			
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
		
		function mudarSelecao(){
			
			var x = document.getElementById('tipoBusca');
			value = x.options[x.selectedIndex].value;

           switch(value){
           case 'numero':

			  newInput.innerHTML = "<label>Número do protocolo: </label/></br>"+
			  "<input type='text' required = 'true' name ='numeroProtocolo' id ='numeroProtocolo'/>" +
			  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='glyphicon glyphicon-search'></i> Buscar </button>"
              break;

           case 'data':
 			  newInput.innerHTML = "<label>Data Inicial: </label/><input type='date' name ='dataInicial' id='dataInicial' " +
 	 		  "<br>   <label>Data Final: </label/><input type='date' name ='dataFinal' id='dataFinal'/>" +
 	 		 "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='glyphicon glyphicon-search'></i> Buscar </button>"
               // newInput.innerHTML = "<input data-provide='datepicker' value='09-10-2015' language='pt-br'/>"
              break;
           
           case 'setor':
        	   newInput.innerHTML = "<label>Setor:</label/>" +
        	   "<div id='iDivSelectPicker' class='row'>"+
			   "<div class='col-sm-2'>"+
        	   "<select class='form-control selectpicker' " +
   			   "data-live-search='true' name='setor' id='setor'"+
   			   "<option value='0'>Setor</option>" +
   			   "<g:each in="${setor}">"+
   			   "<option value='${it.id}'>" +
   			   "${it.nome}</option></g:each></select></div>" +
   			   "<button type='submit' class='btn btn-primary btn-flat'>" +
			   "<i class='glyphicon glyphicon-search'></i> Buscar </button>" 
              break;

           case 'interessado':
 			  newInput.innerHTML = "<label>Nome do Interessado: </label/></br>"+
 			  "<input type='text' required = 'true' name ='interessado' id ='interessadoId'/>" +
 			  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
 			  "<i class='glyphicon glyphicon-search'></i> Buscar </button>"
               break;   

           case 'numeroDocumento':
 			  newInput.innerHTML = "<label>Número do documento: </label/></br>"+
 			  "<input type='text' required = 'true' name ='numeroDocumento' id ='numeroDocumento'/>" +
 			  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
 			  "<i class='glyphicon glyphicon-search'></i> Buscar </button>"
               break;
           
           case 'funcionarioSetor':
        	   newInput.innerHTML = "<label>Funcionario Setor:</label/>" +
        	   "<div id='iDivSelectPicker' class='row'>"+
			   "<div class='col-sm-2'>"+
        	   "<select class='form-control selectpicker' " +
   			   "data-live-search='true' name='funcionarioSetor' id='funcionarioSetor'"+
   			   "<option value='0'>FuncionarioSetor</option>" +
   			   "<g:each in="${funcionarioSetor}">"+
   			   "<option value='${it.id}'>" +
   			   "${it.funcionario.cidadao.pessoaFisica.pessoa.nome + " - " + it.setor.nome}</option></g:each></select></div>" +
   			   "<button type='submit' class='btn btn-primary btn-flat'>" +
			   "<i class='glyphicon glyphicon-search'></i> Buscar </button>" 
              break;
              
           }
			
		}
        
		</script>
	    <section class="content-header">
		<h1>
			Protocolo <small>Consulta de Documentos</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
		</ol>
		<br>
			<g:form controller="protocolo" action="pesquisarProtocolos" class="form">
			<div class="form-heading" style="width:150px;">
				<label>Tipo de Busca</label>
				<div class="controls">

					<select class="form-control selectpicker" id ="tipoBusca" name="tipoBusca" onchange = "mudarSelecao();">
						<option value="null">SELECIONE...</option>
						<option value="numero">NUMERO</option>
						<option value="data">DATA</option>
						<option value="setor">SETOR DE CRIAÇÃO</option>
						<option value="interessado">INTERESSADO</option>
						<option value="numeroDocumento">NUMERO DO DOCUMENTO</option>
						<option value="funcionarioSetor">FUNCIONARIO SETOR</option>
						
					</select>
				</div>
			</div>
			<br>
			<div id='newInput'>
			<!-- lugar onde aparecerao os campos -->
		   	</div>
			</g:form>
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
				<table id="pequisarprotocolo"
					class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width:60px;padding-left:60px">Funções</th>
							<th>Número</th>
							<th>Data do Protocolo</th>
							<th>Data da Emissão</th>
							<th>Número do Documento</th>
							<th>Assunto</th>
							<th>Situação</th>
							<th>Interessado</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${protocolos?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: 10px" class="opcoes">
										<ul style="display: inline">
											<li title="Ver detalhes do protocolo"
												class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/protocolo/verInfoProtocolo/${it.protocolo_id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></li> 
																			
																					
											<g:if test="${ ((it.funcionario_setor_destino_id == funcionarioSetorLogado[0].id) || (funcionarioSetorLogado[0].funcionario.cidadao.pessoaFisica.pessoa.nome=='FUNCIONARIO 1')) }">
												<li title="Editar protocolo" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/Protocolo/editar/${it.protocolo_id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
											</g:if>
										</ul>
									</div>
								</td>
								<td>
									${it.numero}
								</td>

								<td>
								    <g:formatDate type="datatime"  date="${it.data_protocolo}" />
								</td>

								<td> 
									<g:formatDate type="datatime"  date="${it.data_emissao}" />
								</td>
								
								<td>
									${it.numero_Documento}
								</td>

								<td>
									${it.assunto} 
								</td>
								
								<td>
									${it.situacao} 
								</td>
								
								<td>
									${it.interessado} 
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>