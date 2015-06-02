<!DOCTYPE html>
<%@page import="java.lang.System"%>
<html lang="pt-br">
<head>
<title>Frequência. Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>


	<section class="content-header">
		<h1>
			Aulas <small>
				${turmaDisciplina.turma.turma + " - " + turmaDisciplina.disciplinaLecionadaPorProfessor.disciplina.disciplina}
			</small>
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
							<th style="width: 350px;">Título da Aula</th>
							<th style="width: 350px;">Data</th>
							<th style="width: 350px;">Tipo de Aula</th>
						</tr>
					</thead>
					<tbody>
						
						<g:each in="${aula}">
						
							<g:hiddenField name="aulaId" value="${it.id}" />

							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">


										<ul style="display: inline">
											<li title="Visualizar aula" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/aluno/verInfoAluno/${it.id}"><span
														class="glyphicon glyphicon-eye-open"></span></a></li>
														
											<li title="Frequencia" class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/aula/cadastrarFaltas/${it.id}"><span
													class="glyphicon glyphicon-check"></span></a></li>


										</ul>
									</div>
								</td>


								<td>
									${it.titulo}
								</td>
								<td>
									<g:formatDate format="dd-MM-yyyy" date="${it.dataAula}"/>
								</td>
								<td>
									${it.tipoAula.tipoDeAula}
								</td>
							</tr>

						</g:each>

					</tbody>
				</table>
		
					<button class="btn btn-primary btn-flat" data-toggle="modal"
						data-target="#myModal">
						<i class="fa fa-plus"></i> Nova Aula
					</button>
			</div>
		</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Aula</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Aula" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Título da Aula</label>
										<div class="controls">
											<g:textField class="form-control" required="true" name="titulo"
												value="" />
										</div>
									</div>
									<br>
									
									<div class="form-heading">
										<label>Conteúdo da Aula</label>
										<div class="controls">
											<g:textArea class="form-control" name="conteudo" value="" required="true"/>
										</div>
									</div>
									<br>
										<div class="form-heading">
										<label>Data da Aula</label>
										<div class="controls">
											<g:formatDate format="yyyy-MM-dd" date="${date}" />
											<g:datePicker noSelection="['':'']" precision="day"
												class="form-control" required="true" name="dataAula"
												value="" />

										</div>
									</div><br/>
									<div class="form-heading">
										<label>Quantidade de Horários</label>
										<div class="controls">
											<input type="number" class="form-control" name="quantHorarios"
												min="1" max="6"  value="2" required />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Tipo de Aula</label>
										<div class="controls">
											<select class="form-control" name="tipoAula">
												<g:each in="${tipoAula}" var="ta">
													
												<option value="${ta.id}">${ta.tipoDeAula}</option>
												</g:each>
											
											</select>
										</div>
									</div>
									<br>
									<input type="hidden" value="${turmaDisciplina.id}" name="turmaDisciplina" />
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">

								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>

	</section>
</body>
</html>