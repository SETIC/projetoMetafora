<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Atividade . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir este Atividade?");

        if (resposta == true){
        location.href="/projetoMetafora/atividade/deletar/"+id }

       }
 </script>
	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");
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
			Atividade <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Aluno" action="listar">Atividade</g:link></li>
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
			<table id="" class="table table-striped table-hover example">
				<g:if test="${!alunos?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 80px;">Funcões</th>
						<th style="width: 300px;">Nome da atividade</th>
						<th style="width: 40px;">Nota Máxima</th>
						<th style="width: 80px;">Turma - Disciplina</th>
						<th style="width: 110px;">Data de Início</th>
						<th style="width: 80px;">Data de Término</th>
						<th style="width: 100px; text-align: center;">Bimestre</th>
					</tr>
				</thead>
				<tbody>
					<g:each in='${atividade?}'>
					
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -35px" class="opcoes">
										
										
										<ul style="display: inline">
											
									
										
										<li title="Editar Atividade" class="btn btn-primary btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/atividade/editarAtividade/${it.id}"><span
													class="glyphicon glyphicon-pencil"></span></a></li>
											
											
											<li title="Remover Atividade" onclick="deletar(${it.id})"
												class="btn btn-danger btn-xs btn-flat"><span
												class="glyphicon glyphicon-remove"></span></li>

												
											<li title="Ver detalhes da Atividade" class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/atividade/verInfoAtividade/${it.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></li>
												
										</ul>
									</div>
								</td>
								<td>
									${it.nomeAtividade}
								</td>
								<td>
									${it.notaMaxima}
								</td>
								<td>
									${it.turmaDisciplina.turma.turma} - ${it.turmaDisciplina.disciplinaLecionadaPorProfessor.disciplina.disciplina}
								</td>
								<td>
									<g:formatDate format="dd-MM-yyyy HH:mm" date="${it.dataInicio}"/>
								</td>
								<td>
									<g:formatDate format="dd-MM-yyyy HH:mm" date="${it.dataFim}"/>
								</td>
								<td>
									${it.bimestre}
								</td>
							</tr>
						
					</g:each>

				</tbody>
			</table>
			
			<!-- Button trigger modal -->
			
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Atividade
			</button>
			
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
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
										<label for="diciplina">Disciplinas | Turma</label> <select
											style="height: 130px;" name="turmaDisciplina"
											class="form-control selectpicker"
											style="border-radius: 0 !important;" data-live-search="true"
											required="required">
											<g:each in="${turmaDisciplina}">
												<option value="${it.id}">
													${it.disciplinaLecionadaPorProfessor.disciplina.disciplina}
												|
													${it.turma.serie.serie} - ${it.turma.turma}
													
												</option>
											</g:each>
										</select>
									</div>
									<br />
									<div class="form-heading">
										<label>Tipo</label>
										<div class="controls">
											<select class="form-control" name="tipoAtividade">										
												<option value="avaliacao">AVALIAÇÃO</option>
												<option value="apresentacao">APRESENTAÇÃO</option>
												<option value="trabalho">TRABALHO</option>
											</select>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Descrição</label>
										<div class="controls">
											<textarea class="form-control" name="descricaoAtividade" rows="3" placeholder="Descreva a atividade"></textarea>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-xs-6">
											<label>Data de Início</label>
											<g:datePicker name="dataInicio"  class="form-control"/>
					                   
					                    </div>
					                    <div class="col-xs-6">
											<label>Data de Término</label>
					                   	<g:datePicker name="dataFim"  class="form-control"/>
					                     </div>				                    
					                </div>
					                <br>
									<div class="row">
										<div class="col-xs-4">
											<label>Nota Máxima</label>
					                      	<input type="number" name="notaMaxima" class="form-control" placeholder="">
					                    </div>
					                    <div class="col-xs-4">
											<label>Peso</label>
					                      	<input type="text" name="pesoAtividade" class="form-control" placeholder="">
					                    </div>
					                    <div class="col-xs-4">
											<label>Bimestre</label>
					                      	<select class="form-control" name="bimestre">
												<option value="1">1º Bimestre</option>
												<option value="2">2º Bimestre</option>
												<option value="3">3º Bimestre</option>
												<option value="4">4º Bimestre</option>
											</select>
					                    </div>
					                </div>
					                <br>
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
		</div>
	</section>
</body>
</html>
