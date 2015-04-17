<!DOCTYPE html>

<html lang="pt-br">
<head>
<title>Editar Grupo . Módulo Administrativo</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<script type="text/javascript">
	$().ready(function() {
		$('#cpf').mask('999.999.999-99');

	});
</script>
</head>
<body>
	<section class="content-header">
		<h1>
			Grupo <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Usuario" action="listarUsuario">Grupos</g:link></li>
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
				<g:form controller="Grupo" action="atualizar" class="form-horizontal">
				<input type="hidden" name="gruposid" value="${grupos.id}">
				<fieldset>
					<div class="form-group">
						<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
						<div class="col-sm-10">
							<input class="form-control" required name="nome" type="text"
								style="width: 300px" value="${grupos.nome }">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputNome3" class="col-sm-2 control-label">Descrição</label>
						<div class="col-sm-10">
							<input class="form-control" required name="descricao" type="text"
								style="width: 300px" value="${grupos.descricao }">
						</div>
					</div>
					<br>
					<div class="box box-solid" style="width: 80%;">
					    <div class="box-header with-border">
					      <h3 class="box-title">Permissões</h3>
					    </div>
					    <div class="box-body">
					      <div class="box-group" id="accordion">
					        <g:each in='${schemas?}' var="schema">
					            <div class="panel box box-primary">
						          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne${schema.schemaname}" aria-expanded="false" class="collapsed">	
						          	<div class="box-header with-border">
						                <h4 class="box-title">
						                    ${schema.schemaname.replaceAll("_"," ")}
						                </h4>
						            </div>
					              </a>
					              <div id="collapseOne${schema.schemaname}" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
					                <div class="box-body">
					                    <g:each in='${tabelas?}' var="table"> 
								          <g:if test="${table.schemaname == schema.schemaname}">
									          <li class="editar-li">
									            ${table.tabela}
									            <div style="margin-top: -3.5%; margin-left: 60%; padding: 2%;" class="radio">
									                <label class="radio-inline">
									                <g:if test="${table.permissao == '1' }">  
									                  <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-1#${table.permissao_id}" checked> L
									              </g:if>
									              <g:else>
									                <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-1#${table.permissao_id}"> L
									              </g:else>
									              </label>
									              <label class="radio-inline">
									              <g:if test="${table.permissao == '2' }">
									                  <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-2#${table.permissao_id}" checked> E
									              </g:if>
									              <g:else>
									                <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-2#${table.permissao_id}"> E
									              </g:else>
									              </label>
									              <label class="radio-inline">
									              <g:if test="${table.permissao == '0' }">
									                  <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-0#${table.permissao_id}" checked> N
									              </g:if>
									              <g:else>
									                <input type="radio" name="comp${table.schemaname}-${table.tabela}" value="${table.schemaname}-${table.tabela}-0#${table.permissao_id}"> N
									              </g:else>
									              </label>
									            </div>
									          </li>
								          </g:if>
								    	</g:each>  
					                </div>
					              </div>
					            </div>
					        </g:each>        
					      </div>
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
								href="/projetoMetafora/grupo/listar/">Cancelar</a></li>
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