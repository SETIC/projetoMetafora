	function moeda(z){
		v = z.value;
		v=v.replace(/\D/g,"")  //permite digitar apenas números
		v=v.replace(/[0-9]{9}/,"")   //limita pra máximo 999.999.999,99
		v=v.replace(/(\d{1})(\d{1,2})$/,"$1.$2")        //coloca virgula antes dos últimos 2 digitos
		z.value = v;
	}

	function CampoNumerico(campo, e){
		if (((e.which >= 48) && (e.which <= 57)) || ((e.which >= 96) && (e.which <= 105)) ||
				(e.which == 0 || e.which == 8 || e.which == 127 || e.which == 9)) {
			return true;
		} else {
			return false;
		}
	}

	function toUpper(campo, e){
		if(e.which != 37 && e.which != 39){
			campo.value = campo.value.toUpperCase();
		}
	}

	function CampoDouble(campo, e){
		if (CampoNumerico(campo, e) || (e.which == 46)) {
			return true;
		} else if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		}
		return false;		
	}

	function MascaraCREF(campo, e) {
		tam = campo.value.length;
		if(e.which == 8) {
			return true;
		} else if(tam < 6) {
			if(e.which >= 48 && e.which <= 57) return true;
		} else if (tam == 6) {
			if((e.which >= 97 && e.which <= 122) || (e.which >= 64 && e.which <= 90)) {
				campo.value += "-";
				return true;
			}
		} else if (tam == 8) {
			if((e.which >= 97 && e.which <= 122) || (e.which >= 64 && e.which <= 90)) {
				campo.value += "/";
				return true;
			}
		} else if (tam == 10) {
			if((e.which >= 97 && e.which <= 122) || (e.which >= 64 && e.which <= 90)){
				return true;
			}
		}
		return false;
	}

	function MascaraData(campo, e) {
		if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		} else if ((campo.value.length == 2 || campo.value.length == 5) && e.which != 47) {
			campo.value += '/';
		} else if (e.which == 47) {
			return false;
		} else if (campo.value.length == 10) {
			return false;
		}
		return true;
	}

	function MascaraCPF(campo, e) {
		if ((e.which >= 48) && (e.which <= 57)) {
			if (campo.value.length == 3 || campo.value.length == 7) {
				campo.value += '.';
			} else if (campo.value.length == 11) {
				campo.value += '-';
			}
			return true;
		} else if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		} else {
			return false;
		}
	}

	function MascaraCEP(campo, e) {
		if ((e.which >= 48) && (e.which <= 57)) {
			if (campo.value.length == 5) {
				campo.value += '-';
			} else if (campo.value.length == 9)
				return true;
		} else if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		} else {
			return false;
		}
	}

	function MascaraTel(campo, e) {
		if ((e.which >= 48) && (e.which <= 57)) {
			if (campo.value.length == 0) {
				campo.value += '(';
				return true;
			} else if (campo.value.length == 3) {
				campo.value += ')';
				return true;
			} else if (campo.value.length == 8) {
				campo.value += '-';
				return true;
			} else if (campo.value.length == 13) {
				return true;
			}
		} else if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		} else {
			return false;
		}
	}

	function MascaraCNPJ(campo, e){
		if ((e.which >= 48) && (e.which <= 57)) {
			if (campo.value.length == 2) {
				campo.value += '.';
			} else if (campo.value.length == 6) {
				campo.value += '.';
			} else if (campo.value.length == 10) {
				campo.value += '/';
			} else if (campo.value.length == 15) {
				campo.value += '-';
			} else if (campo.value.length == 18) {
				return true;
			}
		} else if (e.which == 0 || e.which == 8 || e.which == 127){
			return true;
		} else {
			return false;
		}
	}
	
