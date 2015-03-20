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
  newWin.document.write("PREFEITURA DE SÃO GONÇALO DO AMARANTE <br>");
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
  
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
			<table id="" class="table table-striped table-hover example">
				<g:if test="${!matricula?.isEmpty()})"></g:if>
				<thead>
					<tr>
						<th style="width: 50px;"></th>
						<th style="width: 280px;">Nome do Aluno</th>
						<th style="width: 60px;">Data da Matrícula</th>
						<th style="width: 320px;">Nome da Escola</th>
						<th style="width: 40px;">Série</th>
						<th style="width: 60px;">Turma</th>

					</tr>
				</thead>
				<tbody>
					<g:each in='${matricula?}'>

						<tr class='linha_registro'>
							<td>
								<div style="margin-left: -35px" class="opcoes">
									<ul style="display: inline">
										
										
										<g:if test="${perm2}">
										<li class="btn btn-primary btn-xs btn-flat"><a
											style="color: #fff"
											href="/projetoMetafora/matricula/editarMatricula/${it.id}"><span
												class="glyphicon glyphicon-pencil"></span></a></li>
										<li onclick="deletar(${it.id})"
											class="btn btn-danger btn-xs btn-flat"><span
											class="glyphicon glyphicon-remove"></span></li>
											
											</g:if>
											
									</ul>

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

						</tr>
					</g:each>

				</tbody>
			</table>
			<script type="text/javascript">
				function mudarEscola(){
		    	  
					var endereco = "localhost";
			        var comboTurma = document.getElementById("comboTurma");
			        comboTurma.options[comboTurma.options.length] = new Option("Buscando Turmas", 0);
			        
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

			  function mudarSerie(){
				  var endereco = "localhost";
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
				        	comboProfessorDisciplina.options.length = 0;
				         	comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option("Selecione uma turma", 0);
   
				        }else{
							for (i=0;i<result.id.length;i++){
								comboTurma.options[comboTurma.options.length] = new Option(result.turma[i], result.id[i]);
			           		}
							 mudarTurma();   
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
			</g:if>
			<button class="btn btn-danger btn-flat" onClick="printDiv('example')">
				<i class="glyphicon glyphicon-print"></i> Imprimir
			</button>
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

											<select id="aluno" name="aluno" class="form-control selectpicker" data-live-search="true">
												<g:each in='${alunos}'>

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
										
										<select class="form-control selectpicker" data-live-search="true" name="escolas"
												id="comboEscola"  onchange="mudarEscola();">
													<g:each in="${escolas}" >
														<option value="0" disabled="disabled" selected="selected">
														Selecione uma escola
													</option>
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
											
											<select id="comboSerie" name="series" class="form-control " onchange="mudarSerie()">
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
										<g:textField class="form-control" 
											name="matricula" value="" />
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
</body>
</html>