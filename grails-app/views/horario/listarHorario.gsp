<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Horário . Módulo Acadêmico</title>
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
		var endereco = "192.168.1.247";
	
		      function deletar(id) {
			        var resposta = confirm("Deseja exluir este Horário?");

			        if (resposta == true){
			        location.href="/projetoMetafora/horario/deletar/"+id }

			       }
     

		       function mudarEscola(){
		    	   var comboSalas = document.getElementById("comboSalas");
		    	   comboSalas.options[comboSalas.options.length] = new Option("Buscando Salas", 0);

					var idEscola = document.getElementById("comboEscola").value;
					var idSerie = document.getElementById("comboSerie").value;
			        $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/sala/getSalaByEscola/"+idEscola,
			            dataType: "json",
			            success: function(result){
			            comboSalas.options.length = 0;
				        if (result.id.length == 0){
				        	comboSalas.options[comboSalas.options.length] = new Option("Não há sala cadastrada", 0);
				        }else{
							for (i=0;i<result.id.length;i++){
							comboSalas.options[comboSalas.options.length] = new Option(result.sala[i], result.id[i]);
			           		}
				        }
			            }
			        });
		     

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


		       function mudarTurma(){
		    	   var comboProfessorDisciplina = document.getElementById("comboProfessorDisciplina");
		    	   comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option("Buscando Professores e Disciplinas", 0);

					var idTurma = document.getElementById("comboTurma").value;
			        $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/DisciplinaLecionadaPorProfessor/getProfessorDisciplinaByTurma?idTurma="+idTurma,
			            dataType: "json",
			            success: function(result){
			            	comboProfessorDisciplina.options.length = 0;
				        if (result.id.length == 0){
				        	comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option("Não há professores e disciplinas nessa turma", 0);
				        }else{
						for (i=0;i<result.id.length;i++){
							comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option(result.disciplina[i] + " - " +result.professor[i], result.id[i]);
			            }
				        }
			            }
			        });
					
			   }

	
		       function afixar() { 
					var dia = document.formHorario.radioDia.value;
					var turno = document.formHorario.radioTurno.value;
					var horario = "";

					var aChk = document.getElementsByName("cbHorario");  
					var count = true;
				
					for (var i=0;i<6;i++){  
				   		if (aChk[i].checked == true){
			        		horario += aChk[i].value; 
			        		count = false;
				   		}
					} 

					if (count){
						document.getElementById("cbHorario1").checked = true;
						horario = "1";
					}

					var resumo = dia+turno+horario;

					document.formHorario.descHorario.value = resumo;
				}

			       
	</script>
	<section class="content-header">
		<h1>
			Horários <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Horario" action="listar">Horários</g:link></li>
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
				<table id="listarHorario" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width: 60px;"></th>
							<th style="text-align: left;">Horário</th>
							<th style="text-align: left;">Sala</th>
							<th style="text-align: left;">Turma Disciplina</th>
							<th style="text-align: left;">Turma</th>
							<th style="text-align: left;">Disciplina</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${horarios?}'>
							<g:set var="sala" value="${it.sala}" />
							<g:set var="turmaDisciplina" value="${it.turmaDisciplina}" />
							<tr class='linha_registro'>
								<td>
									<div class="opcoes">
										<div style="display: inline" width="400">
											
											<g:if test="${perm2}">
											<div class="btn btn-primary btn-xs btn-flat"><a
												style="color: #fff"
												href="/projetoMetafora/horario/editarHorario/${it.id}"><span
													class="glyphicon glyphicon-pencil"></span></a></div>
											<div onclick="deletar(${it.id})"
												class="btn btn-danger btn-xs btn-flat"><span
												class="glyphicon glyphicon-remove"></span></div>
											</g:if>
												
										</div>
									</div>
								</td>
								<td>
									${it.horario}
								</td>
								<td>
									${sala.escola.pessoaJuridica.pessoa.nome} - ${sala.sala}
								</td>
								<td>
									${turmaDisciplina.identificacao}
								</td>
								<td>
									${turmaDisciplina.turma.turma}
								</td>
								<td>
									${turmaDisciplina.disciplinaLecionadaPorProfessor.disciplina.disciplina}
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
				<i class="fa fa-plus"></i> Novo Horário
			</button>
			</g:if>
			
			<button class="btn btn-danger btn-flat" onClick="printDiv('listarHorario')">
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
							<h4 class="modal-title" id="myModalLabel">Cadastro de
								Horário</h4>
						</div>
						<div class="modal-body">
							<g:form controller="Horario" action="salvar" class="form"
								name="formHorario">
								<fieldset>
								<div class="form-heading">
										<label>Escola</label>
										<div class="controls ">
										
										<select class="form-control selectpicker" data-live-search="true" name="escola"
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
										<label>Sala</label>
										<div class="controls">
											<div id="teste"></div>
											<select id="comboSalas" name="sala" class="form-control">
												<option value="0">Selecione uma Sala</option>
											</select>
										</div>
									</div>
									
									<br>
									<div class="form-heading">
										<label>Série</label>
										<div class="controls">
											<select class="form-control" name="slSerie" id="comboSerie" onChange="mudarSerie()">
												<g:each in="${series}">
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
											<select class="form-control" name="slTurma" id="comboTurma" onchange="mudarTurma();">
												<option value="">Turma</option>
											</select>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Disciplina - Professor</label>
										<div class="controls">
											<select name="comboProfessorDisciplina" id="comboProfessorDisciplina"
												class="form-control">
												
													<option value="0">
														Selecione uma Disciplina - Professor
													</option>
												
											</select>
										</div>
									</div>
									<br>
									<div>
										<label>Dia</label>
										<div class="radio">
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia1" value="1" onchange="afixar()" /> Dom
											</label> 
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="true" /> Seg
											</label> 
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia3" value="3" onchange="afixar()" /> Ter
											</label> 
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia4" value="4" onchange="afixar()" /> Qua
											</label>
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia5" value="5" onchange="afixar()" /> Qui
											</label>
											<label>
												<g:radio class="franklin" name="radioDia" id="radioDia6" value="6" onchange="afixar()"/> Sex
											</label> 
											<label> 
												<g:radio class="franklin" name="radioDia" id="radioDia7" value="7" onchange="afixar()" /> Sáb
											</label>
										</div>
									</div>
									<br>
									<div>
										<label>Turno</label>
										<div class="radio">
											<label class="radio-inline"> <g:radio
													name="radioTurno" value="M" onclick="afixar()"
													checked="true" /> Manhã
											</label> <label class="radio-inline"> <g:radio
													name="radioTurno" value="T" onclick="afixar()" /> Tarde
											</label> <label class="radio-inline"> <g:radio
													name="radioTurno" value="N" onclick="afixar()" /> Noite
											</label>
										</div>
									</div>
									<br>
									<div>
										<label>Horário</label>
										<div class="controls">
											<label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario1" onclick="afixar()"
												value="1" checked /> 1
											</label> <label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario2" onclick="afixar()"
												value="2" checked /> 2
											</label> <label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario3" onclick="afixar()"
												value="3" /> 3
											</label> <label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario4" onclick="afixar()"
												value="4" /> 4
											</label> <label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario5" onclick="afixar()"
												value="5" /> 5
											</label> <label class="radio-inline"> <input type="checkbox"
												name="cbHorario" id="cbHorario6" onclick="afixar()"
												value="6" /> 6
											</label>
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Descrição do horario</label>
										<div class="controls">
											<g:textField readonly="readonly" name="descHorario" value="2M12" />
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
			</g:if>
		</div>
	</section>
</body>
</html>