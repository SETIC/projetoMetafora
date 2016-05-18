package br.gov.rn.saogoncalo.protocolo



class SendController {

	def index() {}


		//se envia el correo de alta de nuevo usuario
	def	send = {
		
		sendMail {
			to "jadsonsilver@hotmail.com"
			subject "Teste de envio 2"
			body 'Teste de email 2'
		}
				
		//render "email enviado"

		}


	
}
