<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>Sistema Administrativo . Login</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link rel="shortcut icon" href="${resource(dir:'images', file:'favicon.ico')}" type="image/x-icon" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${resource(dir: 'css', file: 'AdminLTE.css')}" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header">Login</div>
            <g:form controller="Usuario" action="autenticar">
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="text" name="usuario" class="form-control" placeholder="Usuário"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="senha" class="form-control" placeholder="Senha"/>
                    </div>          
                    <g:if test="${ctl != null && act != null }">
                   		 <input type="hidden" name="ctl" value="${ctl }">
                   		  <input type="hidden" name="act" value="${act }">
                    </g:if>
                    <g:else>
                   		 <input type="hidden" name="ctl" value="Layout">
                   		  <input type="hidden" name="act" value="index">
                    </g:else>
                    
                    
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">Entrar</button>  
                    
                    <p style="text-align: justify;">Se esquecer a senha, favor entrar em contato com a administração do sistema.</p>
                    
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
        </div>

        <div>
			<p style="text-align: center;  bottom:-10px; width:100%; font-weight: bold; text-shadow: 2px 1px 4px #3C3C3C; margin-top: 1%; font-family: Roboto, sans-serif;">
			SETIC | Coordenação de Desenvolvimento de Softwares <br/> Copyright © 2014-2015 - SGA - Sistema Administrativo v1.01.1a</p>
		</div>

        
        <div id=#logo-rodape style="margin-left: 2%; margin-bottom:1.5%; position: absolute; bottom: 0; width: 100%;">
			<a href="http://www.saogoncalo.rn.gov.br/" target="_blank"><g:img style="width: 12%" dir="images" file="logo.png"/></a>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>


    </body>
</html>