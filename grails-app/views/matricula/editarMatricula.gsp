<!DOCTYPE html>
<%@ page import="br.gov.rn.saogoncalo.pessoa.Pessoa"%>
<%@ page import="br.gov.rn.saogoncalo.pessoa.Cidadao"%>
<%@ page import="br.gov.rn.saogoncalo.pessoa.PessoaJuridica"%>
<html lang="pt-br">
<head>
<title>Editar Matricula . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />

<script type="text/javascript">
	$().ready(function() {
		$('#cpf').mask('999.999.999-99');

	});
</script>
</head>
<body>
	<section class="content-header">
		<h1>
			Matriculas <small>Editar Dados</small>
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
			<g:each in='${matricula?}'>
			</g:each>

			<script type="text/javascript">
			
				function mudarEscola() {
					var endereco = "localhost";

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
													result.turma[i],
													result.id[i]);
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


			<div style="margin-left: 120px">
				<g:form controller="Matricula" action="atualizar"
					class="form-horizontal">
					<fieldset>
						<div class="form-heading">
							<label>Aluno</label>
							<div class="controls">
						 <g:hiddenField name="aluno" value="${aluno.cidadao.pessoaFisica.pessoa.id}" />
						  <g:hiddenField name="idMatricula" value="${matriculas.id}" />
							 	
								<g:textField name="alunoDesc" class="form-control" disabled="true" 
									style="width: 300px"
									value="${aluno.cidadao.pessoaFisica.pessoa.nome}"/>
							</div>
						</div>
						<br>
						<div class="form-heading">
							<label>Escola</label> <select name="escolas" id="comboEscola"  onchange="mudarEscola();" class="form-control" disabled="disabled">
								<g:each in="${escolas?}">
									<g:if test="${matriculas.turma.escola.id == it.id}">
										<option value="${it.id}" selected>
											${it.pessoaJuridica.pessoa.nome}
										</option>
									</g:if>
									<g:else>
										<option value="${it.id}">
											${it.pessoaJuridica.pessoa.nome}
										</option>
									</g:else>
								</g:each>
							</select>


						</div>
						<br><label>Série</label> <select name="series" id="comboSerie" onchange="mudarSerie();" class="form-control">
							<g:each in="${series}">
								<g:if test="${matriculas.turma.serie.id == it.id}">
									<option value="${it.id}" selected>
										${it.serie}
									</option>
								</g:if>
								<g:else>
									<option value="${it.id}">
										${it.serie}
									</option>
								</g:else>
							</g:each>
						</select> 
						<br>
						<div class="form-heading">
							<label>Turma</label>
							<div class="controls">
								<div id="teste"></div>

								<select class="form-control" name="turma" id="comboTurma" class="form-control">
								<g:each in="${turmas}">
								<g:if test="${matriculas.turma.id == it.id}">
									<option value="${it.id}" selected>
										${it.turma}
									</option>
								</g:if>
								<g:else>
									<option value="${it.id}">
										${it.turma}
									</option>
								</g:else>
							</g:each>
								</select>
								
								
								
							</div>
						</div>
						<br>

						<div class="controls">
							<label>Nº Matrícula</label>
							<g:textField class="form-control" 
								name="matricula" value="${matriculas.matricula}" />
						</div>
						<br>

					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat">
							<i class="fa fa-refresh"></i> Atualizar
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a
								href="/projetoMetafora/matricula/listar/">Cancelar</a></li>
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