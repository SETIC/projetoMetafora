<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Georeferenciamento . Alunos</title>
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    <g:javascript src="jquery.js" />
	<g:javascript src="jquery.min.js" />
	
	
	
	<script type="text/javascript"
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBAKTpmTBmUWigyd63ttcRzkdPQe_kbyp4&sensor=TRUE">
	</script>
	
    <script>
var endereco = [];
var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-5.783933, -35.265384);
  var mapOptions = {
    zoom: 12,
    center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
	try{
		$.ajax({
	        type: "GET",
	        url: "http://192.168.1.247:8080/projetoMetafora/localizacao/getEndereco",
	        dataType: "json",
	        success: function(result){
	           
			for (i=0;i<result.estado.length;i++){	
			
				endereco[i] = result.estado[i][0] + " " + result.municipio[i][0] + " " + result.tipo[i][0] + " " + result.logradouro[i][0] + " " + result.numero[i][0]; 	
		       	}
			felipe(endereco);  
			
		    }
			
	    });			
    }catch(err){
    	alert('erro:\n'+err.message);   
     }
    function felipe(endereco){
		try{
		    for (i = 0; i < endereco.length; i++){
		   		geocoder = new google.maps.Geocoder();		
				geocoder.geocode({'address':endereco[i]}, function(results, status){ 
					 //alert(endereco[i]);
					if( status == google.maps.GeocoderStatus.OK){
						//alert(status);
						latlng = results[0].geometry.location;
						markerInicio = new google.maps.Marker({position: latlng,map: map});		
						map.setCenter(latlng)
						
					}else{
						
					}			
				});
			}
		}catch(err){
	    	alert('erro:\n'+err.message);   
	     }
	}
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas">
    	<script>codeAddress();</script>
    </div>
  </body>
</html>