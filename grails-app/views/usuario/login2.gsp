<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Sistema Administrativo . Login</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- Bootstrap 3.3.2 -->
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Theme style -->
    <link href="${resource(dir: 'css', file: 'AdminLTE.min.css')}" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Login</b></a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Faça login para prosseguir para o sistema.</p>
        <g:form controller="Usuario" action="autenticar">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Usuário"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Senha"/>
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
          <div class="row">
            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
            </div><!-- /.col -->
          </div>
          <div class="row">
            <div class="col-xs-12">    
              <div class="checkbox icheck">
                <label>
                  Se esquecer a senha, favor entrar em contato com a administração do sistema.
                </label>
              </div>                        
            </div><!-- /.col -->
          </div>
        </g:form>
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
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
    <footer class="main-footer" style="margin: 0; text-align: center; background: none; border-top: 0px solid #000;">
        <div class="row">
	      <div class="col-xs-1">    
	        <div>
				<a href="http://www.saogoncalo.rn.gov.br/" target="_blank"><g:img style="width: 150px; height: 60px;" dir="images" file="logo.png"/></a>
	        </div>                    
	      </div><!-- /.col -->
	      <div class="col-xs-10">    
	        <strong>SETIC | Coordenação de Desenvolvimento de Softwares <br/> Copyright &copy; 2014-2015 - SGA - Sistema Administrativo v1.9.1a.</strong> Todos os direitos reservados.                    
	      </div><!-- /.col -->
	    </div>
    </footer>
	
    <g:javascript src="jQuery/jQuery-2.1.3.min.js" />
    <g:javascript src="bootstrap.min.js" />
  </body>
</html>
                

            




