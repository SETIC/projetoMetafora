package br.gov.rn.saogoncalo.mobile
import grails.converters.JSON
import grails.rest.*
import br.gov.rn.saogoncalo.academico.Matricula

class AuthController {

	def auth(){

		def documento = params.rgOuCpf
		def data = params.dataNascimento
		def aluno

		def	consulta = "select m from Aluno as a, Pessoa as p, Cidadao as c, Matricula m where "+
					" ( "+
					" m.aluno.id = a.id and "+
					" a.id = p.id and "+
					" p.cpfCnpj = '"+ documento +"' and "+
					" p.id = c.id and "+
					
					
					" m.status = 'Ativo' and "+
					" p.dataDeNascimento = '"+ data +"') "+

					" or " +

					" ( "+
					" a.id = c.id and "+
					" m.aluno.id = a.id and "+
					" a.id = p.id and "+
					" m.status = 'Ativo' and "+
					" c.rgNumero = '"+ documento +"' and "+
					" p.dataDeNascimento = '"+ data +"')"


			aluno = Matricula.executeQuery(consulta)
	
		println aluno

		render aluno as JSON
	}
	
}
