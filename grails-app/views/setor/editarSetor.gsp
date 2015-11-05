<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Editar Setor . Módulo Acadêmico</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<section class="content-header">
		<h1>
			Setores <small>Editar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Setor" action="listar">Setor</g:link></li>
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
			<g:each in='${setor?}'>
			</g:each>
			<div style="margin-left: 120px">
				<g:form controller="Setor" action="atualizar" class="form-horizontal">
				
				
				
					<g:hiddenField type="number" name="id" value="${it.id}" />
					<fieldset>
						<div class="form-group">
							<label for="inputNome3" class="col-sm-2 control-label">Nome</label>
							<div class="col-sm-10">
								<input class="form-control" required name="nome" type="text"
									style="width: 300px" value="${it.nome}">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="inputnumeroDeInscricao3"
								class="col-sm-2 control-label">Sigla</label>
							<div class="col-sm-10">
								<g:textField class="form-control" name="sigla"
									style="width: 300px" value="${it.sigla}" />
							</div>
						</div>
						<br>
						
						
						<input type="hidden" name="funcionariosNaoResponsaveisHidden" id="funcionariosNaoResponsaveisHiddenId">
						<input type="hidden" name="funcionariosResponsaveisHidden" id="funcionariosResponsaveisHiddenId">
						<div class="form-heading">
											<label>Funcionários</label>
											<div class="controls">

												<g:select class="form-control selectpicker"
													data-live-search="true" name="funcionarios"
													multiple="multiple"
													from="${funcionarios?.cidadao?.pessoaFisica?.pessoa}" value="${funcionariosSetor?.funcionario.id}"
													optionKey="id" optionValue="nome" onchange="addSelectOptions()" />
											</div>
										</div>
										<br/>
									
										<div class="form-heading">
											<div class="row">
												<div class="col-md-5">
												<label> Funcionários </label>
													<select multiple id="select1" name="funcionariosSelecionados" class="form-control">
								 						<g:each in="${funcionariosSetorNaoResponsaveis?}">
								 							<option value="${it?.funcionario.cidadao.pessoaFisica.pessoa.id}"> ${it?.funcionario.cidadao.pessoaFisica.pessoa.nome} </option>
								 						</g:each>
							 						</select>
							 						
							 													 						
												</div>
												<div class="col-md-2" style="margin-top: 4.2rem;">
													<a class="btn btn-primary btn-flat btn-sm" href="#" role="button" id="add"><i class="fa fa-plus"></i></a>
													<a class="btn btn-danger btn-flat btn-sm" href="#" role="button" id="remove"><i class="fa fa-minus"></i></a>
												</div>
												<div class="col-md-5">
												<label> Responsáveis </label>
													<select multiple id="select2" name="funcionariosResponsaveis" class="form-control" required="true">
													
													<g:each in="${funcionariosSetorResponsaveis?}">
								 							<option value="${it?.funcionario.cidadao.pessoaFisica.pessoa.id}"> ${it?.funcionario.cidadao.pessoaFisica.pessoa.nome} </option>
								 						</g:each>
													
													</select>
												</div>
											</div>
										</div>
										<br/>
									</fieldset>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary btn-flat" onclick="getResponsaveis()">
											<i class="fa fa-save"></i> Cadastrar
										</button>
										<input type="reset" class="btn btn btn-flat" value="Limpar">
									</div>
						
						
						
						
					</fieldset>
					<div style="margin: 0 15% auto">
						<button type="submit" class="btn btn-primary btn-flat" onclick="getResponsaveis()"><i
									class="fa fa-refresh"></i> Atualizar</button>				
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-default btn-flat"><a href="/projetoMetafora/setor/listar/">Cancelar</a></li>
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
		
		
		<script type="text/javascript">  
		  $().ready(function() {  
		   $('#add').click(function() {
			   
		    return !$('#select1 option:selected').remove().appendTo('#select2');
		      
		   });  
		   $('#remove').click(function() {  
			   
			   return !$('#select2 option:selected').remove().appendTo('#select1');
		   });
		    
		  });  
		 </script>


		<script>
			function myFunction() {

			    var table = document.getElementById("table-responsavel");
 
			    //for(var i = table.rows.length - 1; i > 0; i--){
			    //    table.deleteRow(i);
			    //    console.log(i);
			    // }
			    
			   //document.getElementById("table-responsavel").innerHTML="";

				while(table.rows.length > 1) {
				  table.deleteRow(1);
				}	
			    
			    var row = table.insertRow(1);
			    
			    var id = row.insertCell(0);
			    var nome = row.insertCell(1);
			    var opcoes = row.insertCell(2);

			    
			    var funcionarios = document.getElementsByClassName("filter-option pull-left");
			 

			    var str = funcionarios[0].innerText;
			    

			    var res = str.split(",");
			    var vetFunc

			    console.log(str);
			    
			    
			    for (i = 0; i < res.length; i++){

			    	var row = table.insertRow(i+1);
				    
				    var id = row.insertCell(0);
				    var nome = row.insertCell(1);
				    var opcoes = row.insertCell(2);

					vetFunc
				    
			    	id.innerHTML = "<input type=\"checkbox\" value=\""+res[i]+"\">";
			    	nome.innerHTML = res[i];
			    	opcoes.innerHTML = "<button type=\"button\" class=\"btn btn-danger btn-xs\"><i class=\"fa fa-minus\"></i></button>";
			    	
			    }

			}
			
			function addSelectOptions(){

				
				var x = document.getElementById("select1");
				var y = document.getElementById("select2");

				var listOptions;

				listOptions = document.getElementById("select2").options;
				
				x.options.length = 0;
					
				var funcionarios = document.getElementsByClassName("filter-option pull-left");

				var values = $('#funcionarios').val();
				console.log("Teste - " + values);

				
				console.log(funcionarios[0].innerText);
				 
			    var str = funcionarios[0].innerText;
			    var res = str.split(",");
				var contOption;

				contOption = 0;
			    
				for (i = 0; i < res.length; i++){

			        var option = document.createElement("option");
			        option.value = values[i];
			        option.text = res[i];

			        //x.add(option);

			        //alterado aqui
					for (j = 0; j < listOptions.length; j++){
						console.log("Teste ++ " + values[i] + " == " + listOptions[j].value);

						if(values[i] == listOptions[j].value ){
							contOption = contOption + 1;
							
							}
					}
					

					if(contOption == 0){
						x.add(option);
						}
					contOption = 0;
					//----------------

				}

				//continuar aqui
				var contOption2;
				contOption2 = 0;
				var contLinha = 0;
				
				for (j = 0; j < listOptions.length; j++){
					for (i = 0; i < res.length; i++){

						console.log("Teste --- " + values[i] + " == " + listOptions[j].value);
						if(values[i] == listOptions[j].value ){
							contOption2 = contOption2 + 1;
							contLinha = i
							}

						
						}

					if(contOption2 == 0){
						console.log("Remover >>> " + contLinha);
						listOptions.remove(j);
						}
					contLinha = 0;
					contOption2 = 0;
										
				}

/*
				if(contOption2 == 0){
					console.log("Remover >>> " + contLinha);
					listOptions.remove(contLinha);
					}
				else{
					console.log("else >>> " contlinha);
					}
				contLinha = 0;
				contOption2 = 0;
				*/





				

		    }
		    
			function ClearOptionsFast(id){
				var selectObj = document.getElementById(id);
				var selectParentNode = selectObj.parentNode;
				var newSelectObj = selectObj.cloneNode(false); // Make a shallow copy
				selectParentNode.replaceChild(newSelectObj, selectObj);
				return newSelectObj;
			}

			function getResponsaveis() {
				
			    var txt = "";
			    var hiddenResponsaveis, hiddenNaoResponsaveis
			    var texto, texto1
			    var x = document.getElementById("select1");
			    if (x.value != null){
				    for(i = 0; i < x.options.length; i++){
				        txt = txt + " " + x.options[i].value;
					}
				    console.log(txt);
				    hiddenNaoResponsaveis = document.getElementById("funcionariosNaoResponsaveisHiddenId");
				    texto = txt.trim();
				    //hiddenNaoResponsaveis.value = texto.replace(' ',',');

				    i = 0;
				    while ((i = texto.indexOf(" ", i)) != -1) {
				        texto = texto.replace(" ", ",");
				    }
				    hiddenNaoResponsaveis.value = texto;
				    
			    }


			    var txt1 = "";
			    var y = document.getElementById("select2");
			    if (y.value != null){
				    for(i = 0; i < y.options.length; i++){
				        txt1 = txt1 + " " + y.options[i].value;
					}
				    console.log(txt1);
				    hiddenResponsaveis =  document.getElementById("funcionariosResponsaveisHiddenId");
				    texto1 = txt1.trim();
				    //hiddenResponsaveis.value = texto.replaceAll(' ',',');
				    
				    i = 0;
				    while ((i = texto1.indexOf(" ", i)) != -1) {
				        texto1 = texto1.replace(" ", ",");
				    }
				    hiddenResponsaveis.value = texto1;
				    
			    }

			    
			}
			
		</script>
		
		
	</section>
</body>
</html>