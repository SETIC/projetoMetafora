<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Gerar Relatorio do Funcionario</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<script>
			function changeIdFuncionarioParaRelatorio(idfuncionario){
				alert(idfuncionario);
				document.getElementById("idFuncionarioParaRelatorio").value = idfuncionario;
			
			}
			function geraRelatorio(){

			var cod = document.getElementById("tipoRelatorio").value;
				
			switch (cod){
			case '1':
				printRelatorioDeclaracaoVinculo()
				break;
			default:
				break;
				
			}
		
				}
			
			function printRelatorioDeclaracaoVinculo()
			{

				var endereco = "localhost";
		        var idFuncionario = document.getElementById("idFuncionarioParaRelatorio").value;
		        var divToPrint  = document.getElementById("reportPrint");
		        divToPrint.style.visibility = "visible";
		        
		        
		        
		        divToPrint.innerHtml = "";
		        
		        $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/projetoMetafora/funcionario/getFuncionarioByIdParaRelatorio/"+idFuncionario,
		            dataType: "json",
		            success: function(result){
		            	//var dataFormatada = result.dataAluno.toString().substring(8,10) + " / " + result.dataAluno.toString().substring(5,7) + " / " + result.dataAluno.toString().substring(0,4);
		        	    
						divToPrint.innerHTML  += "<h3 style='text-align:center'>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE</h3> ";
						divToPrint.innerHTML  += "<h3 style='text-align:center'>RELATÓRIO DE CUMPRIMENTO DE CARGA HORÁRIA</h3> ";
				        divToPrint.innerHTML  += "<h3 style='margin-top:8%;'>Funcionário(a): </h3>"+result.nomeFuncionario;
						divToPrint.innerHTML  += "<h3>Local de Trabaho: </h3>"+result.escola;
				        divToPrint.innerHTML  += "<h3>Cargo: </h3>"+result.cargo;
				        divToPrint.innerHTML  += "<h3>Função: </h3>"+result.funcao;
				        divToPrint.innerHTML  += "<h3>Carga horária semanal a cumprir:</h3>"+result.cargaHoraria+" Horas";
				        divToPrint.innerHTML  += "<h3>Carga horária mensal a cumprir: </h3>"+result.cargaHoraria*4+" Horas";
				        divToPrint.innerHTML  +="<br/>";
				        divToPrint.innerHTML  += result.horario[0].nome;
				        divToPrint.innerHTML  +="<br/>";
				        divToPrint.innerHTML  += result.horario[0].horario;
				        var disciplina = null;
				        var qtd = null;
				        var horarioL = null;
				        for (var i = 0; i <result.horario.length; i++) {
				        disciplina = disciplina+ result.horario[i].disciplina
				        qtd = qtd+ result.horario[i].qtd
				        horarioL = horarioL+ result.horario[i].horario
				        }
				      
				      		divToPrint.innerHTML += disciplina[i]
					   
				        if(result.cargo=="PROFESSOR"){
					        
				        divToPrint.innerHTML  += "<table align=\"center\" border=1 cellspacing=0 cellpadding=2 bordercolor=\"666633\" class=\"table\">"+
				        "<thead>"+
				        "  <tr>"+
				            "<th style=\"width: 200px;\">Matérias Lecionadas</th>"+
				            "<th style=\"width: 200px;\">hora exercida</th>"+
				            "<th style=\"width: 100px;\">Total</th>"+
				          "</tr>"+
				        "</thead>"+
				        "<tbody>"+
				          "<tr>"+
				            "<td>kkkkkkkkk</td>"+
				          "</tr>"+
				        "</tbody>"+
				      "</table>";
				        }else{

					        }
		
		          	  var now = new Date();
		
		          	  meses = new Array(12);
		
		          	  meses[0] = "Janeiro";
		          	  meses[1] = "Fevereiro";
		          	  meses[2] = "Março";
		          	  meses[3] = "Abril";
		          	  meses[4] = "Maio";
		          	  meses[5] = "Junho";
		          	  meses[6] = "Julho";
		          	  meses[7] = "Agosto";
		          	  meses[8] = "Setembro";
		          	  meses[9] = "Outubro";
		          	  meses[10] = "Novembro";
		          	  meses[11] = "Dezembro";
		
		          	  
		          	divToPrint.innerHTML  += "<p style='font-size:12px;margin-top:10%; margin-left:55%;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+" pelo SISEduc</p>";
		           
		          	var newWin = window.open();
		          	newWin.document.write(divToPrint.outerHTML);
		          	divToPrint.innerHTML = "";
		          	divToPrint.style.visibility = "hidden";
		          	
		          	newWin.print();
		          	
		          	factory.printing.header = "";
		          	factory.printing.footer = "";
		          	
		          	newWin.close();
		            
		            }
		        });
		
			}
			
			function printDiv(id)
			{
			  var divToPrint=document.getElementById(id);
			  newWin= window.open("");
			  newWin.document.write("<style=''>");

			  newWin.document.write("<table border='0'>");
			  newWin.document.write("<tr>");
			  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
			  newWin.document.write("<td>");
			  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
			  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
			  newWin.document.write("</td>");
			  newWin.document.write("</tr>");
			  newWin.document.write("</table><br>");
			  
			  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
			  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>RELAÇÃO DE SERVIDORES</h4>");
			  newWin.document.write("<hr>");
			  newWin.document.write("<style type='text/css' >");
			  newWin.document.write("#"+id+'{border:none; font-size: 12pt; }');
			  newWin.document.write("body{font-family:Arial;}");
			  newWin.document.write("img{margin-lefth: 10px;}");
			  newWin.document.write("label{text-transform: uppercase; font-weight:bold; }");
			  newWin.document.write("</style>");
			  newWin.document.write(" ");
			  newWin.document.write(divToPrint.outerHTML);
			  var now = new Date();
			
			  meses = new Array(12);
			
			  meses[0] = "Janeiro";
			  meses[1] = "Fevereiro";
			  meses[2] = "Março";
			  meses[3] = "Abril";
			  meses[4] = "Maio";
			  meses[5] = "Junho";
			  meses[6] = "Julho";
			  meses[7] = "Agosto";
			  meses[8] = "Setembro";
			  meses[9] = "Outubro";
			  meses[10] = "Novembro";
			  meses[11] = "Dezembro";
			  
			  newWin.document.write ("<center style='font-size:11px;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+"</center>");
			
			  newWin.print();
			  newWin.close();
			}
             </script>



	<section class="content-header">
		<h1>
			<center>Relação de Servidores</center>
		</h1>
		<br>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Funcionario" action="gerarRelatorio">Funcionários</g:link></li>
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




			<g:form controller="Funcionario"
				action="pesquisarFuncionariosByEscola" class="form">
				<div class="form-heading">
					<label style="margin-left: 15px;">Escola</label> <select
						class="col-sm-6 selectpicker" data-live-search="true"
						name="escola" id="comboEscola">
						<option value="0" disabled="disabled" selected="selected">
							Selecione uma escola</option>
						<g:each in="${escolas}">
							<option value="${it.id}">
								${it.pessoaJuridica.razaoSocial}
							</option>
						</g:each>
					</select>

					<button style="margin-left: 55%; margin-top: -56px;" type="submit"
						class="btn btn-primary btn-flat">
						<i class="glyphicon glyphicon-search"></i> Buscar
					</button>
				</div>
			</g:form>
			<g:if test="${funcionarios== null}">
				<br>

				<input hidden="true" style="margin-left: 25%;" disabled="disabled"
					class="col-sm-6" value="Nenhuma escola selecionada! " type="text"
					name="nomeDaEscola" />
				<br>
				<br>
			</g:if>
			<g:else>
				<br>

				<input style="margin-left: 25%;" disabled="disabled"
					class="col-sm-6" value="${funcionarios.escola[0]} " type="text"
					name="nomeDaEscola" />
				<br>
				<br>
			</g:else>


		</div>



		<table id="listarFuncionarios"
			class="table table-striped table-hover example">

			<g:if test="${!funcionarios?.isEmpty()})"></g:if>
			<thead>
				<tr class="table table-bordered">
					<th style="width: 20px;">Relatórios</th>
					<th style="width: 20px;">Nº</th>
					<th style="width: 20px;">Nome</th>
					<th style="width: 20px;">Matricula</th>
					<th style="width: 20px;">Cargo</th>
					<th style="width: 20px;">Turno</th>
					<th style="width: 20px;">Funcão</th>
					<th style="width: 20px;">Vinculo</th>

				</tr>
			</thead>
			<tbody>
				<g:set var="i" value="${1}" />

				<g:each in='${funcionarios?}'>
					<g:set var="t" value="it.id == 8" />
					<tr class="success">
						<td>
							<button data-toggle="modal" data-target="#relatorioModal"
								style="margin-left: 30%;"
								onclick="changeIdFuncionarioParaRelatorio(${it.id});"
								class="btn btn-primary btn-flat">
								<i class="glyphicon glyphicon-print"></i>
							</button>

						</td>
						<td>
							${i++}
						</td>
						<td>
							${it.nome}
						</td>
						<td>
							${it.matricula}
						</td>
						<td>
							${it.cargo}
						</td>
						<td>
							${it.turno}
						</td>
						<td>
							${it.funcao}
						</td>
						<td>
							${it.vinculo}
						</td>

					</tr>

				</g:each>

			</tbody>
		</table>


		<button class="btn btn-danger btn-flat"
			onClick="printDiv('listarFuncionarios')">
			<i class="glyphicon glyphicon-print"></i> Relatório Geral
		</button>

		<div class="modal fade" id="relatorioModal" tabindex="-1"
			role="dialog" aria-labelledby="relatorioModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="relatorioModalLabel">Relatórios</h4>
					</div>
					<div class="modal-body">
						<form action="" method="POST">


							<div class="form-heading">
								<input type="hidden" id="idFuncionarioParaRelatorio" /> <label>Tipo
									de Relatório</label>
								<div class="controls">
									<select class="form-control selectpicker" name="tipoRelatorio"
										id="tipoRelatorio">
										<option value="1">Cumprimento de carga horária</option>
									</select> <br /> <br /> <br />
									<button class="btn btn-danger btn-flat"
										onclick="geraRelatorio(); return false;">
										<i class="glyphicon glyphicon-print"></i> Gerar Relatório
									</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>

	</section>
		<div id="reportPrint" style="visibility: hidden;">
		</div>
</body>
</html>