//acao ao clicar no checkbox 
$(document).ready(function() {

     
    var selected = [];
	$(".input").click(function() {
        
        if( !$(this).is(":checked") ) {
            selected.splice( selected.indexOf( $(this).val() ), 1 );
        } else {
            selected.push( $(this).val() );
        }


        var checkboxs = $(".input");
        var isChecked = false;
        $.each( checkboxs, function(i, checkbox) {
            if ( $(checkbox).is(":checked") ) {
                isChecked = true;
                return false;
            }
        });

        if ( isChecked ) {
            $("#accordion-element-73222").collapse('show');
        } else {
             $('.collapse.in').css('overflow','hidden');
             $("#accordion-element-73222").collapse('hide');
        }

        console.log( selected );

	});
    $(".remove").click(function(){
        var checkboxs = $(".input");
        
        
        $.each( checkboxs, function(i, checkbox) {
            if ( $(checkbox).is(":checked") ) {
                $(checkbox).parents("tr").remove();
            }
        });


    });


});



//sobrepom a div efetivar inscricao
function vai(){
	$("#vai").click(function(){
		$('.collapse.in').css('overflow','inherit');
	});
}
