<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Turmas . Módulo Acadêmico</title>
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
			Turmas <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turmas" action="listar">Turmas</g:link></li>
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
						</tr>
					</thead>
					<tbody>
						<g:each in="${turmaDisciplina}" var="td">
						   <g:hiddenField name="turmaDisciplinaId" value="${td.id}" />
						   
								<tr class='linha_registro'>
									<td>
										<div style="margin-left: -35px" class="opcoes">
											
											
											<ul style="display: inline">
													
												<li title="Nova Atividade" class="btn btn-success btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/atividade/listar/${td.id}"><span
														class="glyphicon glyphicon-plus"></span></a></li>
													
													<li title="Boletins" class="btn btn-warning btn-xs btn-flat"><a
													style="color: #fff"
													href="/projetoMetafora/nota/boletim?turma=${td.turma.id}&turmadisciplina=${td.id}"><span
														class="glyphicon glyphicon-th-list"></span></a></li>
		
											</ul>
										</div>
									</td>
									
	
									<td>
										${td.turma.turma} 
									</td>
									<td>
										${td.turma.serie.serie} 
									</td>
									<td>
										${td.disciplinaLecionadaPorProfessor.disciplina.disciplina}
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
