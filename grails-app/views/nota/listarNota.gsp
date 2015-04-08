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
			newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
			newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
			newWin.document.write(" ");
			newWin.document.write(divToPrint.outerHTML);
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
							${turmaDisciplina[0].turma.turma}
						</div>
					</div>
					<br>
				</div>

				<div class="col-sm-2">
					<div class="form-heading">
						<label>Série</label>
						<div class="controls">
							${turmaDisciplina[0].turma.serie.serie}
						</div>
					</div>
					<br>
				</div>


				<div class="col-sm-2">
					<div class="form-heading">
						<label>Disciplina</label>
						<div class="controls">
							${turmaDisciplina[0].disciplinaLecionadaPorProfessor.disciplina.disciplina}
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
				<table id="" class="table table-striped table-hover example">
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
									<g:formatNumber
										number="${nota1}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
									<g:formatNumber
										number="${nota2}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
									<g:formatNumber
										number="${nota3}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
									<g:formatNumber
										number="${nota4}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
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
									<g:formatNumber
										number="${mediaParcial}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								<td>
									<g:formatNumber
										number="${mediaFinal}" maxFractionDigits="1"
										minIntegerDigits="1" minFractionDigits="1" format="0.0" />
								</td>
								
								<td><span class="label ${label}">${situacao}</span></td>
							</tr>
						</g:each>
	
	
					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
			
			</div>
	
	</section>
</body>
</html>
