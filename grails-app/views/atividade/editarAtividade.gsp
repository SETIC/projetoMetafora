<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Atividade . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Atividade <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Atividade" action="listar">Atividades</g:link></li>
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

			<div style="margin-left: 120px">
				<g:form controller="Atividade" action="atualizar"
					class="form-horizontal">
					<g:hiddenField type="number" name="id" value="${atividade?.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nomeAtividade" type="text"
									style="width: 300px" value="${atividade.nomeAtividade}">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputbimestre" class="col-sm-2 control-label">Tipo
								da atividade</label>
							<div class="col-sm-10">
								<g:if test="${atividade.tipoAtividade == 'avaliacao' }">
									<select class="form-control" name="tipoAtividade"
										style="width: 300px">
										<option value="${atividade.tipoAtividade}" selected>AVALIAÇÃO</option>
										<option value="apresentacao">APRESENTAÇÃO</option>
										<option value="trabalho">TRABALHO</option>

									</select>
								</g:if>
								<g:elseif test="${atividade.tipoAtividade== '' }">
									<select class="form-control" name="tipoAtividade"
										style="width: 300px">
										<option value="${atividade.tipoAtividade}" selected>
											${atividade.tipoAtividade}
										</option>
										<option value="avaliacao" selected>AVALIAÇÃO</option>
										<option value="apresentacao">APRESENTAÇÃO</option>
										<option value="trabalho">TRABALHO</option>
									</select>

								</g:elseif>
								<g:elseif test="${atividade.tipoAtividade == 'apresentacao' }">
									<select class="form-control" name="tipoAtividade"
										style="width: 300px">
										<option value="avaliacao" selected>AVALIAÇÃO</option>
										<option value="${atividade.tipoAtividade}" selected>APRESENTAÇÃO</option>
										<option value="trabalho">TRABALHO</option>
									</select>

								</g:elseif>
								<g:else>
									<select class="form-control" name="tipoAtividade"
										style="width: 300px">

										<option value="avaliacao" selected>AVALIAÇÃO</option>
										<option value="apresentacao">APRESENTAÇÃO</option>
										<option value="${atividade.tipoAtividade}" selected>TRABALHO</option>
									</select>

								</g:else>

							</div>
						</div>
						<br>
						<div class="form-group">
						
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Inicio</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataInicio"
									value="${atividade.dataInicio}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputData3" class="col-sm-2 control-label">Data
								de Térrmino</label>
							<div class="col-sm-10">
								<g:formatDate format="yyyy-MM-dd" date="${date}" />
								<g:datePicker noSelection="['':'']" precision="day"
									class="form-control" required="true" name="dataFim"
									value="${atividade.dataFim}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="diciplina" class="col-sm-2 control-label">Disciplinas
								| Turma</label> <select style="height: 180px;" name="turmaDisciplina"
								class="col-sm-3 selectpicker"
								style="border-radius: 0 !important;" data-live-search="true"
								required="required">
								<g:each in="${turmaDisciplina}">
									<option value="${it.id}">
										${it.disciplinaLecionadaPorProfessor.disciplina.disciplina} |
										${it.turma.serie.serie} -
										${it.turma.turma}

									</option>
								</g:each>
							</select>
						</div>
						<br />
						<div class="form-group">
							<label for="inputbimestre" class="col-sm-2 control-label">Bimestre</label>
							<div class="col-sm-10">
D
								<g:if test="${atividade.bimestre == '1º BIMESTRE' }">

									<select class="form-control" name="bimestre"
										style="width: 300px">
										<option value="${atividade.bimestre}" selected>1°
											BIMESTRE</option>

										<option value="2º BIMESTRE">2° BIMESTRE</option>
										<option value="3º BIMESTRE">3° BIMESTRE</option>
										<option value="4º BIMESTRE">4° BIMESTRE</option>

									</select>
								</g:if>
								<g:elseif test="${atividade.bimestre== '' }">
									<select class="form-control" name="bimestre"
										style="width: 300px">
										<option value="${atividade.bimestre}" selected>
											${atividade.bimestre}
										</option>

										<option value="1º BIMESTRE" selected>1° BIMESTRE</option>
										<option value="2º BIMESTRE">2° BIMESTRE</option>
										<option value="3º BIMESTRE">3° BIMESTRE</option>
										<option value="4º BIMESTRE">4° BIMESTRE</option>
									</select>

								</g:elseif>
								<g:elseif test="${atividade.bimestre == '2º BIMESTRE' }">
									<select class="form-control" name="bimestre"
										style="width: 300px">
										<option value="1º BIMESTRE">1° BIMESTRE</option>
										<option value="${atividade.bimestre}" selected>2°
											BIMESTRE</option>
										<option value="3º BIMESTRE">3° BIMESTRE</option>
										<option value="4º BIMESTRE">4° BIMESTRE</option>

									</select>

								</g:elseif>

								<g:elseif test="${atividade.bimestre == '3º BIMESTRE' }">
									<select class="form-control" name="bimestre"
										style="width: 300px">

										<option value="1º BIMESTRE">1° BIMESTRE</option>
										<option value="2º BIMESTRE">2° BIMESTRE</option>
										<option value="${atividade.bimestre}" selected>3°
											BIMESTRE</option>
										<option value="4º BIMESTRE">4° BIMESTRE</option>

									</select>

								</g:elseif>

								<g:else>
									<select class="form-control" name="bimestre"
										style="width: 300px">


										<option value="1º BIMESTRE">1° BIMESTRE</option>
										<option value="2º BIMESTRE">2° BIMESTRE</option>
										<option value="3º BIMESTRE">3° BIMESTRE</option>

										<option value="${atividade.bimestre}" selected>4°
											BIMESTRE</option>
									</select>

								</g:else>

							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">Nota
								Máxima</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true"
									id="notaMaxima" name="notaMaxima" style="width: 300px"
									value="${atividade.notaMaxima}" />
							</div>
						</div>

						<br>
						<div class="form-group">
							<label for="inputCpfCnpj3" class="col-sm-2 control-label">Peso
								da atividade</label>
							<div class="col-sm-10">
								<g:textField class="form-control" required="true"
									id="notaMaxima" name="pesoAtividade" style="width: 300px"
									value="${atividade.pesoAtividade}" />
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-2 control-label">Descrição</label>
							<div  class="col-sm-5">
								<textarea class="form-control" name="descricaoAtividade"
									rows="4" placeholder="Descreva a atividade">${atividade.descricaoAtividade}</textarea>
							</div>
						</div>
						<br>
					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/atividade/listar/">Cancelar</a></li>
						</ul>
					</div>
				</g:form>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#example').DataTable();
					var tabela = $('#example').dataTable();
					// Ordena por nome e "desempata" com o id
					tabela.fnSort([ [ 1, 'asc' ] ]);
				});
			</script>
		</div>
	</section>
</body>
</html>