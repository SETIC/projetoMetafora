/*!
 * Script buscar dados de acordo com o CEP
 * Copyright 2015 Manaia Jr, Dev.
 * Licensed Free
 */

window.onload = function() {
	document.getElementById("iMensagemCEP").style.display = 'none';
};

function requestAjax(elementoCep) {
	var elementoCep = document.getElementById("iCep");
	if (!elementoCep.value == "") {
		var elementoLogradouro = document.getElementById("iLogradouro");
		var elementoBairro = document.getElementById("iBairro");
		var elementoMunicipio = document.getElementById("iMunicipio");
		var elementoUf = document.getElementById("iUf");
		var cep = elementoCep.value.replace("-", "");
		;
		inputsBuscando(elementoLogradouro, elementoBairro, elementoMunicipio,
				elementoUf);
		try {
	
					$.ajax({
						type : "GET",
						url : "http://192.168.1.247:8080/projetoMetafora/aluno/buscarCEP?cep="
								+ cep + "",
						dataType : "json",
						success : function(result) {
							if (result.length == 0) {
								mensagemDeErroCep('block',
										'col-sm-10 has-error');
								habilitarTodosInputsReferenteAEndereco(
										elementoLogradouro, elementoBairro,
										elementoMunicipio, elementoUf);
							} else {
								mensagemDeErroCep('none', 'col-sm-10');
								inserirValoresNosInputs(result,
										elementoLogradouro, elementoBairro,
										elementoMunicipio, elementoUf);
								habilitarInputs(result, elementoLogradouro,
										elementoBairro, elementoMunicipio,
										elementoUf);
							}
						}
					});
		} catch (err) {
			alert('erro:\n' + err.message);
		}
	}
}

function mensagemDeErroCep(modoDisplay, classeDaDiv) {
	document.getElementById("iMensagemCEP").style.display = modoDisplay;
	document.getElementById("iDivInputCep").className = classeDaDiv;
}

function inputsBuscando(logradouro, bairro, municipio, uf) {
	logradouro.value = "Buscando...";
	//logradouro.disabled = true;
	bairro.value = "Buscando...";
	//bairro.disabled = true;
	municipio.value = "Buscando...";
	//municipio.disabled = true;
	uf.value = "Buscando...";
	//uf.disabled = true;			
}

function inputsHabilitado() {
	var elementoLogradouro = document.getElementById("iLogradouro");
	var elementoBairro = document.getElementById("iBairro");
	var elementoMunicipio = document.getElementById("iMunicipio");
	var elementoUf = document.getElementById("iUf");
	var elementoNomePaiInput = document.getElementById("iNomePaiInput");
	var elementoNomeMaeInput = document.getElementById("iNomeMaeInput");
	
	elementoLogradouro.disabled = false;
	elementoBairro.disabled = false;
	elementoMunicipio.disabled = false;
	elementoUf.disabled = false;
	
	if(elementoNomePaiInput != ""){
		elementoNomePaiInput.disabled = false;
	}else{
		elementoNomePaiInput.disabled = true;
	}
	
	if(elementoNomeMaeInput != ""){
		elementoNomeMaeInput.disabled = false;
	}else{
		elementoNomeMaeInput.disabled = true;
	}
	
	
}

function inserirValoresNosInputs(result, logradouro, bairro, municipio, uf) {
	logradouro.value = result.logradouro;
	bairro.value = result.bairro;
	municipio.value = result.localidade;
	uf.value = result.uf;
}

function habilitarInputs(result, inputLogradouro, inputBairro, inputMunicipio,
		inputUf) {
	if (result.logradouro.trim() == "") {
		inputLogradouro.disabled = false;
	}
	if (result.bairro.trim() == "") {
		inputBairro.disabled = false;
	}
	if (result.localidade.trim() == "") {
		inputMunicipio.disabled = false;
	}
	if (result.uf.trim() == "") {
		inputUf.disabled = false;
	}
}

function habilitarTodosInputsReferenteAEndereco(inputLogradouro, inputBairro,
		inputMunicipio, inputUf) {
	inputLogradouro.disabled = false;
	inputLogradouro.value = "";
	inputBairro.disabled = false;
	inputBairro.value = "";
	inputMunicipio.disabled = false;
	inputMunicipio.value = "";
	inputUf.disabled = false;
	inputUf.value = "";
}