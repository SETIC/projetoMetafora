package br.gov.rn.saogoncalo.protocolo

import java.text.SimpleDateFormat


class EnviaEmailController {

    def index() { }
	 SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm" )
     	
	 def enviaEmail(long id){
		 def protocolo = Protocolo.get(id)
		
		
        sendMail {
			
			/*def dataConclusao 
			if(protocolo.dataConclusao == null){
				dataConclusao = '-' 
			}else{
				dataConclusao = format.format(os.dataConclusao)
			    
			}*/
		
            to "${protocolo.email}"
            subject "Abertura de Chamado"
			cc "setic.suporte@saogoncalo.rn.gov.br"
			html "<html><head><title></title></head>"+
			"<body><align=\"left\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"border-style:hidden;background-color:#e6e6fa;\">"+
			"<tbody><tr><td colspan=\"2\" style=\"text-align: center;\"><h3 style=\"color:red;\">"+
			"<span style=\"color:#000000;\">PREFEITURA MUNICIPAL DE S&Atilde;O GON&Ccedil;ALO DO AMARANTE&nbsp;</span></h3>"+
			"<p><strong><span style=\"color:#000000;\">SECRETARIA MUNICIPAL DE MEIO AMBIENTE E URBANISMO</span></strong></p>"+
			"<p><strong><span style=\"color:#000000;\">SISDOC - SISTEMA DE PROTOCOLO DIGITAL</span></strong></p></td></tr>"+
			"<tr><td colspan=\"2\" style=\"text-align: center;\">&nbsp;</td></tr><tr><td colspan=\"2\" style=\"text-align: center;\">"+
			"<strong>Dados do Protocolo</strong></td></tr><tr><td style=\"text-align: left;\"><strong>Interessado</strong></td>"+
			"<td style=\"text-align: left;\"><p>${protocolo.interessado}</p></td></tr><tr><td><span style=\"font-weight: bold; text-align: center;\">Protocolo</span></td>"+
			"<td>${protocolo.id}</td></tr><tr><td><span style=\"font-weight: bold; text-align: center;\">Email</span></td><td>${protocolo.email}</td>"+
			"</tr><tr><td><span style=\"font-weight: bold; text-align: center;\">Telefone</span></td><td>${protocolo.telefone}</td></tr>"+
			"<tr><td><strong>Data de Emissão</strong></td><td>${format.format(protocolo.dataEmissao)}</td></tr>"+
			"<tr><td colspan=\"1\" rowspan=\"1\"><p><strong>Situa&ccedil;&atilde;o</strong></p></td><td>${protocolo.descricaoSituacao}</td></tr>"+
			"<tr><td colspan=\"1\" rowspan=\"1\"><strong> - </strong></td><td> - </td></tr></tbody></table><p>&nbsp;</p></body></html>"
							  
            }

    }    
}


