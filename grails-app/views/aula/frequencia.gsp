<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Frequência. Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>


	<section class="content-header">
		<h1>
			Turmas <small>Selecione uma Turma</small>
		</h1>
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
				<table id="" class="table table-striped table-hover example">
					
					<thead>
						<tr>
							<th style="width: 10px;">Funcões</th>
							<th style="width: 350px;">Turma</th>
							<th style="width: 350px;">Série</th>
							<th style="width: 350px;">Disciplina</th>
							<th style="width: 350px;">Escola</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${turmaDisciplina}" var="td">
						   <g:hiddenField name="turmaDisciplinaId" value="${td.id}" />
						   
								<tr class='linha_registro'>
									<td>
										<div style="margin-left: -35px" class="opcoes">
											
											
											<ul style="display: inline">
													
												<li title="Escolher" class="btn btn-success btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/aula/listarAula/${td.id}"><span
														class="glyphicon glyphicon-ok"> Selecionar</span></a></li>
													
											</ul>
										</div>
									</td>
									
	
									<td>
										${td.turma} 
									</td>
									<td>
										${td.serie} 
									</td>
									<td>
										${td.disciplina}
									</td>
									<td>
										${td.escola}
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
