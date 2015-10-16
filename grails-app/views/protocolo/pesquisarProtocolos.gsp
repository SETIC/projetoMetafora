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
			newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
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
			  "<input type='text' name ='numeroProtocolo' id ='numeroProtocolo'/>" +
			  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='glyphicon glyphicon-search'></i>Buscar</button>"
              break;

           case 'data':
 			  newInput.innerHTML = "<label>Data Inicial: </label/><input type='date' name ='dataInicial' id='dataInicial' " +
 	 		  "<br>   <label>Data Final: </label/><input type='date' name ='dataFinal' id='dataFinal'/>" +
 	 		 "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='glyphicon glyphicon-search'></i>Buscar</button>"
			  
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
			   "<i class='glyphicon glyphicon-search'></i>Buscar</button>" 
            	   
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
						<option value="setor">SETOR</option>
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
						
							<th style="width: 50px;"></th>
							<th>Numero</th>
							<th>Data do Protocolo</th>
							<th>Data da Emissao</th>
							<th>Numero do Documento</th>
							<th>Assunto</th>
						</tr>
					</thead>
					
					<tbody>
						<g:each in='${protocolo?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: 10px" class="opcoes">
										<ul style="display: inline">
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
		</div>
	</section>
</body>
</html>