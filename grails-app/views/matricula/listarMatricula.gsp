<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Matrícula . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>

	<script>
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
  newWin.document.write("</table>");	
  
  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>INFORMAÇÕES DO ALUNO</h4>");
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

	<script>
	
	function changeIdMatriculaParaRelatorio(idMatricula){
		document.getElementById("idMatriculaParaRelatorio").value = idMatricula;
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

	
		//var endereco = "192.168.1.247";
		var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";

		var idMatricula = document.getElementById("idMatriculaParaRelatorio").value;


        var divToPrint  = document.getElementById("reportPrint");
        divToPrint.style.visibility = "visible";
        divToPrint.innerHtml = "";
        
        $.ajax({
            type: "GET",
            url: "http://"+endereco+":8080/projetoMetafora/matricula/getMatriculaByIdParaRelatorio/"+idMatricula,
            dataType: "json",
            success: function(result){
            	var dataFormatada = result.dataAluno.toString().substring(8,10) + " / " + result.dataAluno.toString().substring(5,7) + " / " + result.dataAluno.toString().substring(0,4);
        	    
			    divToPrint.innerHTML  += "<style=''>";   
		        divToPrint.innerHTML  += "<img src='http://localhost:8080/projetoMetafora/static/images/brasao.jpg';style='width:90px;float:left;margin-top:-9px;'>";
		        divToPrint.innerHTML  += "<p style='text-align:center;margin-top:50px;'>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE</p>";
		        divToPrint.innerHTML  += "<p style='text-align:center;margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>";
		        divToPrint.innerHTML  += "<h4 style='text-align:center;margin-top:-8px;'>${session["escname"]}</h4>";
		        divToPrint.innerHTML  += "<p style='margin-top:-18px;text-align:center'>Rua São Bento, S/N - Conj. Amarante -S.G.Amarante.</p>"; 	
		        divToPrint.innerHTML  += "<p style='margin-top:-8px;text-align:center'>CNPJ N° 01.926.842/0001-31</p>"; 
			    divToPrint.innerHTML  += "<table border='0'>";
			    divToPrint.innerHTML  += "<tr>";
        		divToPrint.innerHTML  += " <td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>";
        		divToPrint.innerHTML  += "<td>";
        		divToPrint.innerHTML  += "<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>";
        		divToPrint.innerHTML  += "<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>";
        		divToPrint.innerHTML  += "</td>";
        		divToPrint.innerHTML  += "</tr>";
        		divToPrint.innerHTML  += "</table>";
				divToPrint.innerHTML  += "<h4 style='text-align:center;margin-top:-8px;'>${session["escname"]}</h4>";
		        divToPrint.innerHTML  += "<hr>";
		        divToPrint.innerHTML  += "<h1 style='text-align:center;margin-top:5%;'>DECLARAÇÃO</h1>";
		        divToPrint.innerHTML  += "<p align='Justify' style='center;margin-top:30%;line-height:200%;'>";
		        divToPrint.innerHTML  += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Declaramos para os fins que se fizerem necessários, e por nos haver sido solicitado, que ";
		        divToPrint.innerHTML  +=   result.nomeAluno+", nascido no dia "+dataFormatada+" , natural de __________" ;
		        divToPrint.innerHTML  +=" ___________________________ ";
		        divToPrint.innerHTML  +=" sendo filho de _________________________________________ e de _____________________________________ ";
		        divToPrint.innerHTML  +=" é aluno(a) regularmente matriculado no ";
		        divToPrint.innerHTML  += result.serie+" e na";
		        divToPrint.innerHTML  += " Turma " ;
		        divToPrint.innerHTML  += result.turma+", do ano letivo de "+result.anoLetivo+", desta escola.";     
		        divToPrint.innerHTML  += "</p>";
		        divToPrint.innerHTML  += "<p style='text-align:center;margin-top:15%;'>________________________________________";
		        divToPrint.innerHTML  += "<h4 style='text-align:center'>ASSINATURA DA COORDENAÇÃO</h4><br/><br/>";
		        divToPrint.innerHTML  += "</p>";
		        divToPrint.innerHTML  += "<style type='text/css' >";
		        //divToPrint.innerHTML  += "body{font-family:Arial;}";
		        //divToPrint.innerHTML  += "img{margin-lefth: 10px;}";
		       // divToPrint.innerHTML  += "label{text-transform: uppercase; font-weight:bold; }";
		        divToPrint.innerHTML  += "</style>";
		        divToPrint.innerHTML  += " ";

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

	
</script>

	<script type="text/javascript">
       function deletar(id) {
        var resposta = confirm("Deseja exluir esta Matrícula?");

        if (resposta == true){
        location.href="/projetoMetafora/matricula/deletar/"+id }
       }

       

 </script>

	<section class="content-header">
		<h1>
			Matrículas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Escola" action="listar">Escolas</g:link></li>
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

				<g:form controller="Matricula" action="pesquisarMatriculas"
					class="form">
					<div class="form-group">
						<label for="inputPesquisa" class="col-sm-2 control-label">NOME/CPF:</label>
						<div class="col-sm-10">
							<g:textField class="form-control" id="" name="pesquisa"
								style="width: 300px" value="" />
							<button style="margin-left: 36%; margin-top: -56px;"
								type="submit" class="btn btn-primary btn-flat">
								<i class="fa fa-save"></i> Buscar
							</button>

						</div>
					</div>
				</g:form>


				<table id="listarMatricula"
					class="table table-striped table-hover example">
					<g:if test="${!matricula?.isEmpty()})"></g:if>
					<thead>
						<tr>

							<th style="width: 50px;text-align: left;"></th>
							<th style="width: 280px;text-align: left;">Nome do Aluno</th>
							<th style="width: 60px;text-align: left;">Data da Matrícula</th>
							<th style="width: 320px;text-align: left;">Nome da Escola</th>
							<th style="width: 40px;text-align: left;">Série</th>
							<th style="width: 60px;text-align: left;">Turma</th>

						</tr>
					</thead>
					<tbody>
						<g:each in='${matricula?}'>

							<tr class='linha_registro'>
								<td>
									<div class="opcoes" style="width: 80px;">
										<div style="display: inline;">


											<g:if test="${perm2}">

												<div class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/matricula/editarMatricula/${it.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></div>
												<div onclick="deletar(${it.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></div>

											</g:if>
											<div data-toggle="modal" data-target="#relatorioModal"
												onclick="changeIdMatriculaParaRelatorio(${it.id});"
												class="btn btn-warning btn-xs btn-flat"><span

												class="glyphicon glyphicon-file"></span></div>


										</div>

									</div>
								</td>
								<td>
									${it.aluno.cidadao.pessoaFisica.pessoa.nome}
								</td>
								<td><g:formatDate format="dd/MM/yyyy"
										date="${it.dataDaMatricula}" /></td>
								<td>
									${it.turma.escola.pessoaJuridica.pessoa.nome}
								</td>
								<td>
									${it.turma.serie.serie}
								</td>
								<td>
									${it.turma.turma}
								</td>
								<td style="text-align: center;"><g:if
										test="${it.dataDaMatricula.toString().contains(ano.toString())}">
										<span class="label label-success">Ativo</span>
									</g:if> <g:else>
										<span class="label label-danger">Inativo</span>
									</g:else></td>

							</tr>
						</g:each>

					</tbody>
				</table>
			</div>


			<script type="text/javascript">
			
				function mudarEscola(){
		    	  

					//var endereco = "192.168.1.247";
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

				   

			  function mudarSerie(){

				  //var endereco = "192.168.1.247";
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
			  function mudarSerie1(){
				  var endereco = "localhost";
				   var comboTurma = document.getElementById("comboTurma1");
			        comboTurma.options[comboTurma.options.length] = new Option("Buscando Turmas", 0);

			        var idEscola = document.getElementById("comboEscola1").value;
					var idSerie = document.getElementById("comboSerie1").value;

			        
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
		       


		</script>
			<!-- Button trigger modal -->
			<g:if test="${perm2}">
				<button class="btn btn-primary btn-flat" data-toggle="modal"
					data-target="#myModal">
					<i class="fa fa-plus"></i> Realizar Matrícula
				</button>

				<button class="btn btn-danger btn-flat" onClick="printDiv('listarMatricula')">
					<i class="glyphicon glyphicon-print"></i> Imprimir
				</button>


			</g:if>
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
									<input type="hidden" id="idMatriculaParaRelatorio" /> <label>Tipo
										de Relatório</label>
									<div class="controls">
										<select class="form-control selectpicker" name="tipoRelatorio"
											id="tipoRelatorio">
											<option value="1">Declaração de Vínculo</option>
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
			<!-- Modal renovação de matrícula-->
			<g:if test="${perm2}">
				<div class="modal fade" id="renovarMatricula" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Renovar Matrícula</h4>
							</div>
							<div class="modal-body">

								<g:form controller="Matricula" action="renovarMatricula"
									class="form" name="formHorario">
									<fieldset>
										<div class="form-heading">
											<label>Aluno</label>
											<div class="controls">
												<g:textField class="form-control" name="nomeAluno" value="" />
												<g:hiddenField name="matriculaAluno" value="" />
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Escola</label>
											<div class="controls ">

												<select class="form-control selectpicker"
													data-live-search="true" name="escolas1" id="comboEscola1"
													onchange="mudarEscola1();">
													<option value="0" disabled="disabled" selected="selected">
														Selecione uma escola</option>
													<g:each in="${escolas?}">

														<option value="${it.id}">
															${it.pessoaJuridica.razaoSocial}
														</option>
													</g:each>
												</select>

											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Série</label>
											<div class="controls">

												<select id="comboSerie1" name="series1" class="form-control "
													onchange="mudarSerie1()">
													<g:each in='${series?}'>
														<option value="${it.id}">
															${it.serie}
														</option>
													</g:each>
												</select>

											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Turma</label>
											<div class="controls">
												<div id="teste"></div>

												<select class="form-control" name="turma1" id="comboTurma1">
												</select>
											</div>
										</div>
										<br>
										<div class="controls">
											<label>Nº Matrícula</label>
											<g:textField class="form-control" name="matricula1" value="" />
										</div>
										<br>

										<div class="form-heading">
											<label>Data da matrícula</label>
											<div class="controls">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" required="true" name="dataDaMatricula1"
													value="" />
											</div>
										</div>
										<br>

									</fieldset>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary btn-flat">
											<i class="fa fa-save"></i> Matricular
										</button>
										<input type="reset" class="btn btn btn-flat" value="Limpar">
									</div>

								</g:form>
							</div>
						</div>
					</div>
				</div>
			</g:if>



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
								<h4 class="modal-title" id="myModalLabel">Matrícula</h4>
							</div>
							<div class="modal-body">

								<g:form controller="Matricula" action="salvar" class="form"
									name="formHorario">
									<fieldset>
										<div class="form-heading">
											<label>Aluno</label>
											<div class="controls">

												<select id="aluno" name="aluno"
													class="form-control selectpicker" data-live-search="true">
													<g:each in='${alunos1}'>

														<option value="${it.id}">
															${it.cidadao.pessoaFisica.pessoa.nome}
														</option>

													</g:each>
												</select>

											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Escola</label>
											<div class="controls ">

												<select class="form-control selectpicker"
													data-live-search="true" name="escolas" id="comboEscola"
													onchange="mudarEscola();">
													<option value="0" disabled="disabled" selected="selected">
														Selecione uma escola</option>
													<g:each in="${escolas}">
														<option value="${it.id}">
															${it.pessoaJuridica.razaoSocial}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Série</label>
											<div class="controls">

												<select id="comboSerie" name="series" class="form-control "
													onchange="mudarSerie()">
													<g:each in='${series?}'>
														<option value="${it.id}">
															${it.serie}
														</option>
													</g:each>
												</select>
											</div>
										</div>
										<br>
										<div class="form-heading">
											<label>Turma</label>
											<div class="controls">
												<div id="teste"></div>
												<select class="form-control" name="turma" id="comboTurma">
												</select>
											</div>
										</div>
										<br>
										<div class="controls">
											<label>Nº Matrícula</label>
											<g:textField class="form-control" name="matricula" value="" />
										</div>
										<br>

										<div class="form-heading">
											<label>Data da matrícula</label>
											<div class="controls">
												<g:formatDate format="yyyy-MM-dd" date="${date}" />
												<g:datePicker noSelection="['':'']" precision="day"
													class="form-control" required="true" name="dataDaMatricula"
													value="" />
											</div>
										</div>
										<br>

									</fieldset>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary btn-flat">
											<i class="fa fa-save"></i> Matricular
										</button>
										<input type="reset" class="btn btn btn-flat" value="Limpar">
									</div>

								</g:form>
							</div>
						</div>
					</div>
				</div>
			</g:if>
		</div>
	</section>


	<div id="reportPrint" style="visibility: hidden;"></div>
	<script>
		function matriculaENomeDoAluno(matricula, nome){
			console.log(matricula, nome);
			var inputNomeAluno = document.getElementsByName("nomeAluno");
			var inputHiddenMatriculaAluno = document.getElementsByName("matriculaAluno");
			inputNomeAluno[0].value = nome;
			inputHiddenMatriculaAluno[0].value = matricula;
		}
	</script>

</body>


</html>