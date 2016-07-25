<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Atividade . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	
	<section class="content-header">
		<h1>
			Atividade <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Atividade" action="listar">Atividade</g:link></li>
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

			<br>
	
			<div class="box box-white" >
			<div id="print">
				<table id="tableGrid" class="table table-striped table-hover example">
					<g:if test="${!alunos?.isEmpty()})"></g:if>
					<thead>
						<tr>
							<th style="width: 80px;">Funcões</th>
							<th style="width: 150px;">Nome da atividade</th>
							<th style="width: 80px;">Nota Máxima</th>
							<th style="width: 150px;">Turma</th>
							<th style="width: 110px;">Data de Início</th>
							<th style="width: 80px;">Data de Término</th>
							<th style="width: 100px; text-align: center;">Bimestre</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${listarAtividadeSerie?}' var="listAtividadeSerie">
						 <g:hiddenField name="atividadeDisciplinaId" value="${listAtividadeSerie?.id}" />
						
								<tr class='linha_registro'>
									<td>
										<div style="margin-left: -35px" class="opcoes">
											<ul style="display: inline">
											<li title="Editar Atividade" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/atividade/editarAtividade/${listAtividadeSerie.id}"><span
														class="glyphicon glyphicon-pencil"></span></a></li>
												
												<li title="Remover Atividade" onclick="deletar(${listAtividadeSerie.id})"
													class="btn btn-danger btn-xs btn-flat"><span
													class="glyphicon glyphicon-remove"></span></li>
	
												<li title="Ver detalhes da Atividade" class="btn btn-success btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/atividade/verInfoAtividade/${listAtividadeSerie.id}"><span
														class="glyphicon glyphicon-eye-open"></span></a></li>
													
													<li title="Lançar Notas" class="btn btn-warning btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/atividade/lancarNota/${listAtividadeSerie.id}"><span
														class="glyphicon glyphicon-th-list"></span></a></li>
											</ul>
										</div>
									</td>
									<td>
										${listAtividadeSerie.nomeAtividade}
									</td>
									<td>
										${listAtividadeSerie.notaMaxima}
									</td>
									<td>
										${listAtividadeSerie.turmaDisciplina.turma.turma} - 
										${listAtividadeSerie.turmaDisciplina.disciplinaLecionadaPorProfessor.disciplina.disciplina}
									</td>
									<td>
									<g:formatDate format="dd-MM-yyyy" date="${listAtividadeSerie.dataInicio}"/>
										
									</td>
									<td>
									<g:formatDate format="dd-MM-yyyy" date="${listAtividadeSerie.dataFim}"/>
										
									</td>
									<td>
										${listAtividadeSerie.bimestre}
									</td>
								</tr>
						</g:each>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		
					
			<!-- Button trigger modal -->
			
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Atividade
			</button>
			
			<button class="btn btn-default btn-flat" onClick="printDiv('print')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Atividade</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Atividade" action="salvar" class="form">
								<fieldset>
									<div class="form-heading">
										<label>Nome</label>
										<div class="controls">
											<g:textField class="form-control" required="true" name="nomeAtividade"
												value="" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label for="diciplina">Disciplinas | Turma</label> 
										<select
											style="height: 130px;" name="turmaDisciplina"
											class="form-control selectpicker"
											style="border-radius: 0 !important;" data-live-search="true"
											required="required">
											<g:each in="${turmaDisciplina?}" var="turmaDisc">
												<option value="${turmaDisc?.id}">
													${turmaDisc?.disciplina}
												|
													${turmaDisc?.serie} - ${turmaDisc?.turma}
													
												</option>
											</g:each>
										</select>
									</div>
									<br />
									<div class="form-heading">
										<label>Tipo</label>
										<div class="controls">

											<select class="form-control" name="tipoAtividade">
												<option value="AVALIAÇÃO">AVALIAÇÃO</option>
												<option value="APRESENTAÇÃO">APRESENTAÇÃO</option>
												<option value="TRABALHO">TRABALHO</option>
												<option value="TESTE">TESTE</option>

											</select>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Descrição</label>
										<div class="controls">

											<textarea required="required" class="form-control" name="descricaoAtividade" 

											rows="3" placeholder="Descreva a atividade"></textarea>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Data de Início</label><br/>
										<g:formatDate format="yyyy-MM-dd" date="${date}" />
										<g:datePicker name="dataInicio" noSelection="['':'']" 
										precision="day"  class="form-control"/>
										
				
					                </div>
					                <br>
					                <div class="form-heading">
										<label>Data de Término</label><br/>
										<g:formatDate format="yyyy-MM-dd" date="${date}" />
					                	<g:datePicker name="dataFim" noSelection="['':'']" precision="day"
					                	  class="form-control"/>					                	
					                </div>				                    
					                <br>
									<div class="row">
										<div class="col-xs-4">
											<label>Nota Máxima (0.1 a 10)</label>
					                      	<input type="number" name="notaMaxima" min="0.1" max="10" step="0.1" class="form-control" placeholder="">
					                    </div>
					                    <div class="col-xs-4">
											<label>Peso</label>
					                      	<input type="text" name="pesoAtividade" class="form-control" placeholder="">
					                    </div>
					                    <div class="col-xs-4">
											<label>Bimestre</label>
					                      	<select class="form-control" name="bimestre">
												<option value="1º BIMESTRE">1º BIMESTRE</option>
												<option value="2º BIMESTRE">2º BIMESTRE</option>
												<option value="3º BIMESTRE">3º BIMESTRE</option>
												<option value="4º BIMESTRE">4º BIMESTRE</option>
												<option value="RECUPERACAO">RECUPERAÇÃO</option>
												<option value="PROVA FINAL">PROVA FINAL</option>
											</select>
					                    </div>
					                </div>
					                <br>
					                
								</fieldset>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
									<button type="button" class="btn btn-danger btn-flat" data-dismiss="modal">
										<i class="fa fa-close"></i> Cancelar
									</button>
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>
	</section>
</body>
</html>
