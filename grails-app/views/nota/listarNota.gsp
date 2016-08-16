<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Notas . Módulo Acadêmico</title>
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
			
			newWin.document.write("<h3 style='text-align:center;margin-top:10px;'>GERAÇÃO DE BOLETIM</h3><br/><br/>");
			newWin.document.write("<hr><br/><br/> ");
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

         	 newWin.document.write("<p style='font-size:12px;margin-top:10%; margin-left:70%;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+" pelo SISEduc</p>");
			newWin.print();
			newWin.close();
		}
	</script>
	<section class="content-header">
		<h1>
			Notas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Professor" action="listar">Notas</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content">
		<div>
			<div class="row">
				<div class="col-sm-2">
					<div class="form-heading">
						<label>Turma</label>
						<div class="controls">
							${dadosAtividade.turma.turma}
						</div>
					</div>
					<br>
				</div>

				<div class="col-sm-2">
					<div class="form-heading">
						<label>Série</label>
						<div class="controls">
							${dadosAtividade.disciplinaLecionadaPorProfessor.turmaDisciplina.turma.serie.serie}
						</div>
					</div>
					<br>
				</div>


				<div class="col-sm-2">
					<div class="form-heading">
						<label>Disciplina</label>
						<div class="controls">
							${dadosAtividade.disciplinaLecionadaPorProfessor.disciplina.disciplina}
						</div>
					</div>
					<br>
				</div>
				
				<div class="col-sm-2">
					<div class="form-heading">
						<label>Relatório</label>
						<div class="controls">
							${dadosAtividade.turma.serie.relatorio}
						</div>
					</div>
					<br>
				</div>				
				
				
			</div>
			<br />
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
			
				<table id="table" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th>Alunos</th>
							<th>1º Bimestre</th>
							<th>2º Bimestre</th>
							<th>3º Bimestre</th>
							<th>4º Bimestre</th>
							<th>Recuperação</th>
							<th>Prova Final</th>
							<th>Média Parcial</th>
							<th>Média Final</th>
							<th>Situação</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${notas}" var="nota">
	
				<%
					def nota1 = 0
					def nota2 = 0
					def nota3 = 0
					def nota4 = 0
					def notaRecuperacao = 0
					def notaProvaFinal = 0
					
					def situacao = "Em Andamento"
					def label = "label-primary"
					def verf = true
					
					if (nota.nota1 != null) {nota1 = nota.nota1} else {verf = false}
					if (nota.nota2 != null) {nota2 = nota.nota2} else {verf = false}
					if (nota.nota3 != null) {nota3 = nota.nota3} else {verf = false}
					if (nota.nota4 != null) {nota4 = nota.nota4} else {verf = false}
					
					if (nota.notaRecuperacao != null) {notaRecuperacao = nota.notaRecuperacao} else {}
					if (nota.provaFinal != null) {notaProvaFinal = nota.provaFinal} else {}
					
					
					def notaFinal = ((nota1+nota2+nota3+nota4))
					
					def mediaParcial = ((nota1+nota2+nota3+nota4)/4)
					
					def mediaRecuperacao = ((nota1+nota2+nota3+nota4+notaRecuperacao)/5)
					
					def mediaProvaFinal = ((notaRecuperacao + notaProvaFinal)/2)
					
					def soma2 = nota1+nota2+nota3+nota4+notaRecuperacao
					
					def resultado3 = notaRecuperacao + notaProvaFinal
					
					def mediaFinal = ((soma2 + resultado3)/6)
					
					if (verf){
						if (mediaParcial >= 6){
							situacao = "Aprovado"
							label = "label-success"
						}else{
							if(notaRecuperacao == 0){
								situacao = "Recuperação"
								label = "label-primary"
							}else{
								if(mediaRecuperacao >= 6){
									situacao = "Aprovado"
									label = "label-success"
								}
								else{
									if(notaProvaFinal == 0){
										situacao = "Prova Final"
										label = "label-warning"
									}else{
										mediaFinal = mediaProvaFinal
										if(mediaProvaFinal >= 5){
											situacao = "Aprovado"
											label = "label-success"
										}else{
											situacao = "Reprovado"
											label = "label-danger"
										}
									}
								}	
							}	
						}		
					}
					
					if (nota.nota1 == null) {nota1 = nota.nota1} 
					if (nota.nota2 == null) {nota2 = nota.nota2} 
					if (nota.nota3 == null) {nota3 = nota.nota3}
					if (nota.nota4 == null) {nota4 = nota.nota4} 
					 %>
	
							<tr class='linha_registro'>
								<td>
									${nota.nome}
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${nota1}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${nota2}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${nota3}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${nota4}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								<td>
									<g:formatNumber
										number="${nota.notaRecuperacao}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
									<g:formatNumber
										number="${nota.provaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${mediaParcial}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								<td>
								<g:if test="${dadosAtividade.turma.serie.relatorio} == 'SIM'">
									<g:formatNumber
										number="${notaProvaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:if>
								<g:else>
									<g:formatNumber
										number="${mediaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</g:else>
								</td>
								
								<td><span class="label ${label}">${situacao}</span></td>
							</tr>
						</g:each>
	
	
					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			
			<button class="btn btn-danger btn-flat" onClick="printDiv('table')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			
			</div>
	</section>
</body>
</html>
