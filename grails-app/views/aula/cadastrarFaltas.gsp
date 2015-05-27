<!DOCTYPE html>
<%@page import="br.gov.rn.saogoncalo.academico.Frequencia"%>
<%@page import="java.lang.System"%>
<html lang="pt-br">
<head>
<title>Frequência. Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>

	<section class="content-header">
		<h1>
			Cadastro de frequencias <small> ${aula.titulo}
			</small>
		</h1>
		<h5>
			<b>Conteúdo :</b>
			${aula.conteudo}
			<br /> <b>Quantidade de horarios :</b>
			${aula.quantHorarios}
		</h5>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turmas" action="listar">Frequencia</g:link></li>
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
				<g:form controller="Aula" action="salvarFrequencia" class="form">
					<g:hiddenField type="number" name="aulaId" value="${aula.id}" />
					<table id="" class="table table-striped table-hover">

						<thead>
							<tr>
								<th style="width: 300px;">Alunos</th>
								<th style="width: 100px;">Quantidade de Faltas</th>
							</tr>
						</thead>
						<tbody>
						
							
							<%
								
								def freqMatId = frequencia.matricula.id;
							 %>
													
							<g:each in="${nomeDosAlunos}" var="mat">
								<tr class='linha_registro'>
									<td>
										${mat.aluno.cidadao.pessoaFisica.pessoa.nome}
									</td>
									<td>
									
									<g:if test="${freqMatId.contains(mat.id) }">
									
										<g:each in="${frequencia}" var="freq">
									
										<g:if test="${freq.matricula.id ==  mat.id}">
											<input type="number" min="0" max="${aula.quantHorarios}"
													size="100" value="${freq.quantFaltas}"
													name="${mat.id}-faltas" />
										</g:if>
									
									</g:each>							
									</g:if>
										<g:else>
											<input type="number" min="0" max="${aula.quantHorarios}"
												size="100" value="0"
												name="${mat.id}-faltas" />
										</g:else>
		
									</td>
								</tr>
							</g:each>
						</tbody>
					</table>
					<button type="submit" class="btn btn-success btn-flat">
						<i class="fa fa-save"></i> Atualizar Frequencias
					</button>

				</g:form>
			</div>
		</div>
	</section>
</body>
</html>