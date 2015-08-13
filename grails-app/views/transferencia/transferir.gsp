<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Transferência . Módulo Acadêmico</title>
<meta name="layout" content="public" />
</head>
<body>
	<script type="text/javascript">
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  var comboEscola=document.getElementById("comboEscola")
  var itemSelecionado = comboEscola.options[comboEscola.selectedIndex].text;;
  var nomeAluno =document.getElementById("nomeAluno").innerHTML;
  
  newWin= window.open("");
  newWin.document.write("<img src='http://localhost:8080/projetoMetafora/static/images/brasao.jpg' style='width:80px;float:left;margin-top:-9px;'>");
  newWin.document.write("<h4 style='text-align:center;margin-top:50px;'>${session["escname"]}</h4><br/><br/>");
  newWin.document.write("<h4 style='margin-top:-50px;text-align:center'>SÃO GONÇALO DO AMARANTE</h4></br>");
  newWin.document.write("<hr><br/><br/> ");
  newWin.document.write("<h3 style='text-align:center;margin-top:10px;'>TERMO DE RESPONSABILIDADE PARA TRANSFERÊNCIA</h3><br/><br/> ");
  newWin.document.write("<p align='Justify' style='center;margin-top:20px;line-height:200%;  font-family: sans-serif;margin-left: 25px;margin-right: 25px;'> ");
  newWin.document.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Declaramos para os fins que se fizerem necessários, e por nos haver sido solicitado, que  o aluno "); 
  newWin.document.write("<b>"+nomeAluno+"</b>");
  newWin.document.write(", está sendo transferido para a(o) ");	
  newWin.document.write("<b>"+itemSelecionado+"<b>");
  newWin.document.write(". ");
  newWin.document.write(" ");
  newWin.document.write("<p style='text-align:center;margin-top:15%;'>________________________________________");
  newWin.document.write("<h4 style='text-align:center'>ASSINATURA DO RESPOSÁVEL</h4><br/><br/>");
  
  newWin.document.write(" ");
  newWin.document.write("</p> ");
  
  Hoje = new Date();
  Data = Hoje.getDate();
  Dia = Hoje.getDay();
  Mes = Hoje.getMonth();
  Ano = Hoje.getFullYear();
  
  if(Data < 10) {
      Data = "0" + Data;
  }
  NomeDia = new Array(7)
  NomeDia[0] = "domingo"
  NomeDia[1] = "segunda-feira"
  NomeDia[2] = "terça-feira"
  NomeDia[3] = "quarta-feira"
  NomeDia[4] = "quinta-feira"
  NomeDia[5] = "sexta-feira"
  NomeDia[6] = "sábado"

  NomeMes = new Array(12)
  NomeMes[0] = "Janeiro"
  NomeMes[1] = "Fevereiro"
  NomeMes[2] = "Março"
  NomeMes[3] = "Abril"
  NomeMes[4] = "Maio"
  NomeMes[5] = "Junho"
  NomeMes[6] = "Julho"
  NomeMes[7] = "Agosto"
  NomeMes[8] = "Setembro"
  NomeMes[9] = "Outubro"
  NomeMes[10] = "Novembro"
  NomeMes[11] = "Dezembro"

	  //divToPrint +=document.write("São Paulo, "+ Data + " de " + NomeMes[Mes] + " de " + Ano);
	  
  //newWin.innerHTML  += "<p style='font-size:12px;margin-top:1px; margin-left:55%;'><br/>Gerado dia " +Data + " de " +NomeMes[Mes]  + " de " + Ano + " às " + now.getHours()+":"+now.getMinutes()+" pelo SISEduc</p>";

  newWin.document.write("<p style='font-size:12px;margin-top:100px; margin-left:55%;'>"+"Gerado dia, " +Data + " de " +NomeMes[Mes]  + " de " + Ano + " às " + Hoje.getHours()+":"+Hoje.getMinutes()+" pelo SISEduc"+"</p>");
  newWin.print();
  newWin.close();
}

</script>
	<section class="content-header">
		<h1>
			Transferir <small>Visualização e Gerenciamento</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Transferencia" action="listar">Transferir</g:link></li>
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

			<g:form controller="Transferencia" action="concluirTransferencia"
				class="form-horizontal" style="height: 500px;">
				<input type="hidden" name="idAluno" value="${aluno.id}" />
				<fieldset id="print">
					<div class="form-group">
						<label for="inputNome3" class="col-sm-2 control-label">Nome
							do Aluno</label>
						<div id="nomeAluno" class="col-sm-10">
							${aluno.cidadao.pessoaFisica.pessoa.nome }
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputNome3" class="col-sm-2 control-label">Matrícula
							Ativa</label>
						<div class="col-sm-10">
							<g:each in="${matricula}">
								${it.turma.serie.serie }  - Turma ${it.turma.turma}
								<br />
								<span style="color: red; font-size: 10pt;">*Esta
									matrícula será desativada se a transferência for efetivada.</span>
								<br />
							</g:each>

						</div>

					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Escola de Destino</label>
						<div class="controls col-sm-3">
							<select class="form-control selectpicker" data-live-search="true"
								name="idEscola" id="comboEscola">
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
				</fieldset>
				<div style="margin: 0 17% auto; margin-right: -20px;">

					<button type="button" class="btn btn-danger btn-flat"
						onclick="printDiv(print)">
						<i class="glyphicon glyphicon-print"></i> Gerar Relatório
					</button>

					<button type="submit" class="btn btn-primary btn-flat">
						<i class="glyphicon glyphicon-arrow-right"></i> Concluir
					</button>
					<ul style="display: inline-block; margin-left: -30px">
						<li class="btn btn-danger btn-flat"><a
							href="/projetoMetafora/transferencia/listar/"
							style="color: #fff;">Cancelar</a></li>
					</ul>
				</div>
				<br>
			</g:form>
		</div>
	</section>
</body>
</html>
