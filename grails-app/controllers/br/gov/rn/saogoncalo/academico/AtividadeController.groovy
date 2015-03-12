package br.gov.rn.saogoncalo.academico


class AtividadeController {

    def listar(){
		
		def atividades = Atividade.findAll()
		render(view:"/atividade/listarAtividade.gsp", model:[atividades:atividades])
		
	}
}
