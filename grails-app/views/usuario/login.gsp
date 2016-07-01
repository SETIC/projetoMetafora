<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>SISEDUC . Entrar</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link rel="shortcut icon" href="${resource(dir:'images', file:'favicon.ico')}" type="image/x-icon" />
    <!-- Bootstrap 3.3.2 -->
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css', file: 'font-awesome.min.css')}" rel="stylesheet">
    <!-- Theme style -->
    <link href="../../dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="${resource(dir: 'css', file: 'AdminLTE.min.css')}" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
      div#wrap {
        height: 100%;
        min-height: 100%;
      }
    </style>
    <script type="text/javascript">
    	function verificarLogin() {
			if(document.login.usuario.value == ""){
				document.getElementById("alertVerificador").innerHTML = "Digite o seu nome de usuário.";
				document.getElementById("mensagemErro").innerHTML = "";
				return false;
			}else{
				if(document.login.senha.value == ""){
					document.getElementById("alertVerificador").innerHTML = "Digite a sua senha.";
					document.getElementById("mensagemErro").innerHTML = "";
					return false;	
				}
				else{
					return true;
				}
			}		
        }
    </script>
  </head>
  <body class="login-page">
    <div id="wrap">  
      <div class="login-box">
        <div class="login-logo">
          <a href="http://189.43.7.23:8080/projetoMetafora/usuario/login"><g:img style="width: 55%" dir="images" file="logo-SISEDUC-cinza.png"/></a>
        </div><!-- /.login-logo -->
        <div class="login-box-body">
          <p class="login-box-msg">Entre para iniciar a sua sessão</p>
          <g:form name="login" controller="Usuario" action="autenticar" onsubmit="return verificarLogin();">
            <div class="form-group has-feedback">
              <input type="text" name="usuario" class="form-control" placeholder="Usuário">
              <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
              <input type="password" name="senha" class="form-control" placeholder="Senha">
              <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <g:if test="${ctl != null && act != null }">
            	<input type="hidden" name="ctl" value="${ctl }">
            	<input type="hidden" name="act" value="${act }">
            </g:if>
            <g:else>
            	<input type="hidden" name="ctl" value="Layout">
            	<input type="hidden" name="act" value="index">
            </g:else>
            <p id="alertVerificador" class="text-red"></p>
            <g:if test="${ok}">
				<p id="mensagemOk" class="text-green">${ok}</p>
		  	</g:if>
		  	<g:if test="${erro}">
		  		<p id="mensagemErro" class="text-red">${erro}</p>
		  	</g:if>
            <div class="row">
              <div class="col-xs-12">
                <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
              </div>  
            </div>
          </g:form>
        </div><!-- /.login-box-body -->
      </div>
      <footer class="main-footer" style="margin-left: 0; position: absolute; bottom: 0; width: 100%;">
          <div class="pull-right hidden-xs">
            <b>Version</b> 2.0
          </div>
          <strong>Copyright © 2014-2015 <a style="font-weight: 400;" href="#"><b>SIS</b>EDUC</a>.</strong> Todos os direitos reservados.
      </footer>
    </div>
    <!-- jQuery 2.1.3 -->
    <script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <g:javascript src="jQuery/jQuery-2.1.3.min.js" />
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <g:javascript src="bootstrap.min.js" />
  </body>
</html>
