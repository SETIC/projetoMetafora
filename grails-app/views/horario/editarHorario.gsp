<!DOCTYPE html>
<%@page import="java.lang.System"%>
<html lang="pt-br">
<head>
<title>Editar Horário . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<script type="text/javascript">
	//var endereco ="192.168.1.252";
	var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
		function deletar(id) {
			var resposta = confirm("Deseja exluir este Horário?");

			if (resposta == true) {
				location.href = "/projetoMetafora/horario/deletar/" + id
			}

		}

		function mudarEscola() {
			var comboSalas = document.getElementById("comboSalas");
			comboSalas.options[comboSalas.options.length] = new Option("Buscando Salas", 0);

			var idEscola = document.getElementById("comboEscola").value;
			var idSerie = document.getElementById("comboSerie").value;
			$.ajax({
						type : "GET",
						url : "http://"+endereco+":8080/projetoMetafora/sala/getSalaByEscola/"
								+ idEscola,
						dataType : "json",
						success : function(result) {
							comboSalas.options.length = 0;
							if (result.id.length == 0) {
								comboSalas.options[comboSalas.options.length] = new Option(
										"Não há sala cadastrada", 0);
							} else {
								for (i = 0; i < result.id.length; i++) {
									comboSalas.options[comboSalas.options.length] = new Option(
											result.sala[i], result.id[i]);
								}
							}
						}
					});

			var comboTurma = document.getElementById("comboTurma");
			comboTurma.options[comboTurma.options.length] = new Option("Buscando Turmas", 0);

			$.ajax({
						type : "GET",
						url : "http://"+endereco+":8080/projetoMetafora/turma/getTurmaByEscolaAndSerie?idEscola="
								+ idEscola + "&idSerie=" + idSerie,
						dataType : "json",
						success : function(result) {
							comboTurma.options.length = 0;
							if (result.id.length == 0) {
								comboTurma.options[comboTurma.options.length] = new Option(
										"Não há turma cadastrada", 0);
							} else {
								for (i = 0; i < result.id.length; i++) {
									comboTurma.options[comboTurma.options.length] = new Option(
											result.turma[i], result.id[i]);
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

		function mudarTurma() {
			var comboProfessorDisciplina = document
					.getElementById("comboProfessorDisciplina");
			comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option(
					"Buscando Professores e Disciplinas", 0);

			var idTurma = document.getElementById("comboTurma").value;
			$.ajax({
						type : "GET",
						url : "http://"+endereco+":8080/projetoMetafora/DisciplinaLecionadaPorProfessor/getProfessorDisciplinaByTurma?idTurma="
								+ idTurma,
						dataType : "json",
						success : function(result) {
							comboProfessorDisciplina.options.length = 0;
							if (result.id.length == 0) {
								comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option(
										"Não há professores e disciplinas nessa turma",
										0);
							} else {
								for (i = 0; i < result.id.length; i++) {
									comboProfessorDisciplina.options[comboProfessorDisciplina.options.length] = new Option(
											result.disciplina[i] + " - "
													+ result.professor[i],
											result.id[i]);
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

			for (var i = 0; i < 6; i++) {
				if (aChk[i].checked == true) {
					horario += aChk[i].value;
					count = false;
				}
			}

			if (count) {
				document.getElementById("cbHorario1").checked = true;
				horario = "1";
			}

			var resumo = dia + turno + horario;

			document.formHorario.descHorario.value = resumo;
		}
	</script>
	<section class="content-header">
		<h1>
			Horários <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li class="active"><g:link controller="Disciplina"
					action="listar">Horários</g:link></li>
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
			<g:each in='${Horários?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Horario" action="atualizar" class="form"
					name="formHorario">
					<g:hiddenField type="number" name="id" value="${horarioL.id}" />
					<fieldset>
						<div class="form-heading">
							<label>Escola</label>
							<div class="controls ">
								<select id="comboEscolas" name="escolas" class="form-control selectpicker">
									<g:each in="${escola}">
										<g:if test="${it.id == horarioL.sala.escola.id}">
											<option value="${it.id}" selected>${it.pessoaJuridica.pessoa.nome}</option>
										</g:if>
										<g:else>
											<option value="${it.id}">${it.pessoaJuridica.pessoa.nome}</option>
										</g:else>
									</g:each>
								</select>	
							</div>
						</div>
						<br>
						<div class="form-heading">
							<label>Sala</label>
							<div class="controls">
								<select id="comboSalas" name="sala" class="form-control">
									<g:each in="${horarioL.sala.escola.sala}">
										<g:if test="${it.id == horarioL.sala.id}">
											<option value="${it.id}" selected>${it.sala}</option>
										</g:if>
										<g:else>
											<option value="${it.id}">${it.sala}</option>
										</g:else>
									</g:each>
								</select>
							</div>
						</div>

						<br>
						<div class="form-heading">
							<label>Série</label>
							<div class="controls">
								<select class="form-control" name="slSerie" id="comboSerie"
									onChange="mudarSerie()">
									<g:each in="${series}">
										<g:if test="${it.id == horarioL.turmaDisciplina.turma.serie.id}">
											<option value="${it.id}" selected>${it.serie}</option>
										</g:if>
										<g:else>
											<option value="${it.id}">${it.serie}</option>
										</g:else>
									</g:each>
								</select>
							</div>
						</div>
						<br>
						<div class="form-heading">
							<label>Turma</label>
							<div class="controls">
								<select class="form-control" name="slTurma" id="comboTurma"
									onchange="mudarTurma();">
									<g:each in="${turma}">
										<g:if test="${it.id == horarioL.turmaDisciplina.turma.id}">
											<option value="${it.id}" selected>${it.turma}</option>
										</g:if>
										<g:else>
											<option value="${it.id}">${it.turma}</option>
										</g:else>
									</g:each>
								</select>
							</div>
						</div>
						<br>
						<div class="form-heading">
							<label>Disciplina - Professor</label>
							<div class="controls">
								<select name="comboProfessorDisciplina"
										id="comboProfessorDisciplina" class="form-control">
									<g:each in="${turmaDisciplina}">
										<g:if test="${it.id == horarioL.turmaDisciplina.id}">							
											<option value="${it.id}" selected>${it.disciplinaLecionadaPorProfessor.disciplina.disciplina} - ${it.disciplinaLecionadaPorProfessor.professor.funcionario.cidadao.pessoaFisica.pessoa.nome}</option>
										</g:if>
										<g:else>
											<option value="${it.id}">${it.disciplinaLecionadaPorProfessor.disciplina.disciplina} - ${it.disciplinaLecionadaPorProfessor.professor.funcionario.cidadao.pessoaFisica.pessoa.nome}</option>
										</g:else>
									</g:each>
								</select>
							</div>
						</div>
						<br>
						<div>
							<label>Dia</label>
							<div class="radio">
							
										<label>
										<g:if test="${dia == '1'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Dom
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Dom
										</g:else>
												
										</label> <label>								
										<g:if test="${dia == '2'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Seg
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Seg
										</g:else>
										
										</label> <label>
										<g:if test="${dia == '3'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Ter
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Ter
										</g:else>
										
										</label> <label>
										<g:if test="${dia == '4'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Qua
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Qua
										</g:else>
										
										</label> <label>
										<g:if test="${dia == '5'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Qui
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Qui
										</g:else>
										
										</label> <label>
										<g:if test="${dia == '6'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Sex
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Sex
										</g:else>
										
										</label> <label>
										<g:if test="${dia == '7'}">
     										<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" checked="checked"/> Sab
										</g:if>
										 <g:else>
											<g:radio class="franklin" name="radioDia" id="radioDia2" value="2" onchange="afixar()" /> Sab
										</g:else>										
										</label>
										
										
										

							</div>
						</div>
						<br>
						<div>
							<label>Turno</label>
							<div class="radio">

										<label>
										<g:if test="${turno == 'M'}">
     										<g:radio name="radioTurno" value="M" onclick="afixar()" checked="true" /> Manhã
										</g:if>
										 <g:else>
											<g:radio name="radioTurno" value="M" onclick="afixar()"/> Manhã
										</g:else>
										</label> 
										
										<label>
										<g:if test="${turno == 'T'}">
     										<g:radio name="radioTurno" value="T" onclick="afixar()" checked="true"/> Tarde
										</g:if>
										 <g:else>
											<g:radio name="radioTurno" value="T" onclick="afixar()"/> Tarde
										</g:else>
										</label>
										
										<label>
										<g:if test="${turno == 'N'}">
     										<g:radio name="radioTurno" value="N" onclick="afixar()" checked="true"/> Noite
										</g:if>
										 <g:else>
											<g:radio name="radioTurno" value="N" onclick="afixar()"/> Noite
										</g:else>
										</label>  
							
							</div>
						</div>
						<br>
						<div>
							<label>Horário</label>
							<div class="controls">
								<label>
								<g:if test="${horario.contains('1')}">
									<input type="checkbox" name="cbHorario" id="cbHorario1" onclick="afixar()" value="1" checked/> 1 
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario1" onclick="afixar()" value="1"/> 1 
								</g:else>
								</label>
								
								<label>
								<g:if test="${horario.contains('2')}">
									<input type="checkbox" name="cbHorario" id="cbHorario2" onclick="afixar()" value="2" checked/> 2 
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario2" onclick="afixar()" value="2"/> 2 
								</g:else>
								</label>
								
								<label>
								<g:if test="${horario.contains('3')}">
									<input type="checkbox" name="cbHorario" id="cbHorario3" onclick="afixar()" value="3" checked/> 3 
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario3" onclick="afixar()" value="3"/> 3 
								</g:else>
								</label>
								
								<label>
								<g:if test="${horario.contains('4')}">
									<input type="checkbox" name="cbHorario" id="cbHorario4" onclick="afixar()" value="4" checked/> 4 
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario4" onclick="afixar()" value="4"/> 4 
								</g:else>
								</label>
								
								<label>
								<g:if test="${horario.contains('5')}">
									<input type="checkbox" name="cbHorario" id="cbHorario5" onclick="afixar()" value="5" checked/> 5
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario5" onclick="afixar()" value="5"/> 5
								</g:else>
								</label>
								
								<label>
								<g:if test="${horario.contains('6')}">
									<input type="checkbox" name="cbHorario" id="cbHorario6" onclick="afixar()" value="6" checked/> 6
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario6" onclick="afixar()" value="6"/> 6
								</g:else>	
								</label>
								
								<label>
								<g:if test="${horario.contains('7')}">
									<input type="checkbox" name="cbHorario" id="cbHorario7" onclick="afixar()" value="7" checked/> 7
								</g:if>
								<g:else>
									<input type="checkbox" name="cbHorario" id="cbHorario7" onclick="afixar()" value="7"/> 7
								</g:else>	
								</label>
							</div>
						</div>
						<br>
						<div class="form-heading">
							<label>Descrição do horario</label>
							<div class="controls">
								<g:textField readonly="readonly" name="descHorario" value="${horarioL.horario}"/>
							</div>
						</div>
						<br>
					</fieldset>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-save"></i> Atualizar
						</button>
						<input type="reset" class="btn btn btn-flat" value="Limpar">
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