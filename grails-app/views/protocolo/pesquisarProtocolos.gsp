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
			  newInput.innerHTML = "<label>Número do protcolo: </label/><input type='text'/>"
              break;

           case 'data':
        	         
              newInput.innerHTML = "<input data-provide='datepicker'/>"
              break;
           
           case 'setor':
        	   newInput.innerHTML = " <select class='form-heading selectpicker'><option value='rh'>RH</option>" +
               "<option value='finanças'>FINANÇAS</option>" +
               "<option value='merenda'>MERENDA</option></select>" 
              break;
           }
			
		}

	</script>
      
	<section class="content-header">
		<h1>
			Protocolo <small>Visualização e Gerenciamento</small>
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
					<select class="form-control" id ="tipoBusca" name="tipoBusca" onchange = "mudarSelecao();">
						<option value="null">SELECIONE...</option>
						<option value="numero">NUMERO</option>
						<option value="data">DATA</option>
						<option value="setor">SETOR</option>
					</select>
				</div>
			</div>
		<button style="margin-left:155px; margin-top: -57px;" type="submit"
				class="btn btn-primary btn-flat">
				<i class="glyphicon glyphicon-search"></i>Buscar
		</button>
			</g:form>
			
			<div id='newInput'>
			<!-- lugar onde aparecerao os campos -->
		   </div>
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
							<th style="width: 60px;"></th>
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
									<div style="margin-left: -35px" class="opcoes">
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