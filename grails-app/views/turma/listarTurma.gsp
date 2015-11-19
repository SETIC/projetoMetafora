<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Turma . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
       function deletar(id) {
        var resposta = confirm("Deseja exluir esta Turma?");

        if (resposta == true){
        location.href="/projetoMetafora/turma/deletar/"+id }

       }
 </script>
	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('projetoMetafora/'))}projetoMetafora/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table><br>");
  
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>

	<section class="content-header">
		<h1>
			Turmas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
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
				<table id="listarTurma" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th>Escola</th>
							<th>Série</th>
							<th>Turma</th>
							<th>Turno</th>
							<th>Vagas</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${turmas?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: -45px" class="opcoes">
										<ul style="display: inline">
											
											<g:if test="${perm2}">
											
											<li class="btn btn-primary btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/turma/editarTurma/${it.id}"><span
													class="glyphicon glyphicon-pencil"></span></a></li>
											<li onclick="deletar(${it.id})"
												class="btn btn-danger btn-xs btn-flat"><span
												class="glyphicon glyphicon-remove"></span></li>
											
											
											</g:if>
											
											
											<li class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/turma/verInfoTurma/${it.id}"><span
													class="glyphicon glyphicon-eye-open"></span></a></li>
										</ul>
									</div>
								</td>
								<td>
									${it.escola.pessoaJuridica.pessoa.nome}
								</td>
								<td>
									${it.serie.serie}
								</td>
								<td>
									${it.turma}
								</td>
								<td>
									${it.turno}	
								</td>
								<td>
									${it.vagas}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			<!-- Button trigger modal -->
			<g:if test="${perm2}">
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Turma
			</button>
			</g:if>
			<button class="btn btn-danger btn-flat" onClick="printDiv('listarTurma')">
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
							<h4 class="modal-title" id="myModalLabel">Cadastro de Turma</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Turma" action="salvar" class="form">
								<fieldset>
									<div class="row">
										<input type="hidden" value="2015" name="anoLetivo" />

									</div>
									<div class="form-heading">
										<label>Escola</label>
										<div class="controls ">

											<select class="form-control selectpicker"
												data-live-search="true" name="escola" id="comboEscola"
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
									<div class="row">
										<div class="col-xs-7">
											<label for="exampleInputTurma1">Nome da Turma</label>
											<g:textField class="form-control" required="required"
												name="turma" value="" />
										</div>
									</div>
									<br/>
									<div class="form-heading">
										<label>Turno</label>
										<div class="controls">
											<select class="form-control" name="turno">
												<option value="MATUTINO" selected >MATUTINO</option>
												<option value="VESPERTINO">VESPERTINO</option>
												<option value="NOTURNO">NOTURNO</option>
											</select>
										</div>
									</div>
									<br>	
									<div class="row">
										<div class="col-xs-3">
											<label for="exampleInputVagas1">Nº de Vagas</label>
											<div class="controls">
												<g:textField class="form-control" required="required"
													name="vagas" value="" />
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-xs-7">
											<label for="exampleInputSerieId1">Série</label>
											<g:select name="serie" class="form-control"
												from="${br.gov.rn.saogoncalo.academico.Serie.list()}"
												value="${id}" optionKey="id" optionValue="serie" />
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-xs-12">
											<label for="diciplina">Disciplinas</label> <select
												style="height: 130px;" name="disciplinas"
												class="form-control selectpicker" multiple
												style="border-radius: 0 !important;" data-live-search="true"
												required="required">
												<g:each in="${disciplinas}">
													<option value="${it.id}">
														${it.professor.funcionario.cidadao.pessoaFisica.pessoa.nome}
														-
														${it.disciplina.disciplina}
													</option>
												</g:each>
											</select>
										</div>
									</div>
									<br />
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