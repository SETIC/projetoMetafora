<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta name="layout" content="public" />
 
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Painel <small>Controle painel</small>
		</h1>
		<ol class="breadcrumb">
			<li><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li class="active">Painel</li>
		</ol>
	</section>
	<!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
      	<g:link class="link-black" controller="Aluno" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-aqua"><i class="fa fa-graduation-cap"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Alunos</span>
	              <span class="info-box-number">${quantAlunos}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
        </g:link>
        <g:if test="${sessao==0||sessao==29}">
        <g:link class="link-black" controller="Escola" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-red"><i class="fa fa-university"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Escolas</span>
	              <span class="info-box-number">${quantEscolas}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
		</g:link>
		</g:if>
		<g:link class="link-black" controller="Professores" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-green"><i class="ion ion-person-add"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Professores</span>
	              <span class="info-box-number">${quantProfessores}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
        </g:link>
        
        <g:link class="link-black" controller="Funcionario" action="listar">
	        <div class="col-md-3 col-sm-6 col-xs-12">
	          <div class="info-box">
	            <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
	            <div class="info-box-content">
	              <span class="info-box-text">Funcionários</span>
	              <span class="info-box-number">${quantFuncionarios}</span>
	            </div><!-- /.info-box-content -->
	          </div><!-- /.info-box -->
	        </div><!-- /.col -->
	    </g:link>
			<br>
	    <!-- Main content -->
	    
	<g:if test="${sessao==0||sessao==29}">
    
            <div class="col-md-4">
          
              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title"><b>Alunos Matriculados por Escola<b></h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="col-md-4">
               
                  </div>
                </div>
                <div class="box-body">
                    <canvas id="pieChart" style="margin-left: ; height: 186px; width: 530px;" width="355" height="265"></canvas>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              
				</div>
            </div><!-- /.col (LEFT) -->
            
         
          <br>
			
        
        <!-- PROFESSORES -->
       
        
            <div class="col-md-4">
          
              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title"><b>Professores por Escola<b></h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="col-md-4">
               
                  </div>
                </div>
                <div class="box-body">
                    <canvas id="pieChart2" style="margin-left: ;height: 278px; width: 530px;" width="355" height="265"></canvas>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              
				</div>
            </div><!-- /.col (LEFT) -->
            
         
          <br>
			
        
           <!-- FUNCIONÁRIOS -->

        
            <div class="col-md-4">
          
              <!-- DONUT CHART -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title"><b>Funcionários por Escola<b></h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="col-md-4">
               
                  </div>
                </div>
                <div class="box-body">
                    <canvas id="pieChart3" style="margin-left: ;height: 278px; width: 530px;" width="355" height="265"></canvas>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              
			</div>
            </div><!-- /.col (LEFT) -->
            
     
          <br>
			
       
	   
	   </g:if>     
	  </div><!-- /.row -->
	 
    </section><!-- /.content -->	
     
    <script src="/projetoMetafora/js/jQuery/jQuery-2.1.3.min.js" type="text/javascript"></script>

    
    <script>
      $(function () {

    	  var endereco = "localhost";
   			
          $.ajax({
              type: "GET",
              url: "http://"+endereco+":8080/projetoMetafora/layout/dadosDoGrafico",
              dataType: "json",
              success: function(result){
                  
            	    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
                    var pieChart = new Chart(pieChartCanvas);
             
            var PieData = result[0]

            var pieOptions = {
                    //Boolean - Whether we should show a stroke on each segment
                    segmentShowStroke: false,
                    //String - The colour of each segment stroke
                    segmentStrokeColor: "#fff",
                    //Number - The width of each segment stroke
                    segmentStrokeWidth: 2,
                    //Number - The percentage of the chart that we cut out of the middle
                    percentageInnerCutout: 50, // This is 0 for Pie charts
                    //Number - Amount of animation steps
                    animationSteps: 100,
                    //String - Animation easing effect
                    animationEasing: "easeOutBounce",
                    //Boolean - Whether we animate the rotation of the Doughnut
                    animateRotate: true,
                    //Boolean - Whether we animate scaling the Doughnut from the centre
                    animateScale: false,
                    //Boolean - whether to make the chart responsive to window resizing
                    responsive: true,
                    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    maintainAspectRatio: true,
                    //String - A legend template
                    legendTemplate: ""
                  };
                  //Create pie or douhnut chart
                  // You can switch between pie and douhnut using the method below.
                  pieChart.Doughnut(PieData, pieOptions);
            
              }});
     
      });
      $(function () {

    	  var endereco = "localhost";
   			
          $.ajax({
              type: "GET",
              url: "http://"+endereco+":8080/projetoMetafora/layout/dadosDoGrafico",
              dataType: "json",
              success: function(result){
                  
            	    var pieChartCanvas2 = $("#pieChart2").get(0).getContext("2d");
                    var pieChart2 = new Chart(pieChartCanvas2);
             
            var PieData2 = result[1]

            var pieOptions2 = {
                    //Boolean - Whether we should show a stroke on each segment
                    segmentShowStroke: false,
                    //String - The colour of each segment stroke
                    segmentStrokeColor: "#fff",
                    //Number - The width of each segment stroke
                    segmentStrokeWidth: 2,
                    //Number - The percentage of the chart that we cut out of the middle
                    percentageInnerCutout: 50, // This is 0 for Pie charts
                    //Number - Amount of animation steps
                    animationSteps: 100,
                    //String - Animation easing effect
                    animationEasing: "easeOutBounce",
                    //Boolean - Whether we animate the rotation of the Doughnut
                    animateRotate: true,
                    //Boolean - Whether we animate scaling the Doughnut from the centre
                    animateScale: false,
                    //Boolean - whether to make the chart responsive to window resizing
                    responsive: true,
                    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    maintainAspectRatio: true,
                    //String - A legend template
                    legendTemplate: ""
                  };
                  //Create pie or douhnut chart
                  // You can switch between pie and douhnut using the method below.
                  pieChart2.Doughnut(PieData2, pieOptions2);
            
              }});
     
      });
      $(function () {

    	  var endereco = "localhost";
   			
          $.ajax({
              type: "GET",
              url: "http://"+endereco+":8080/projetoMetafora/layout/dadosDoGrafico",
              dataType: "json",
              success: function(result){
                  
            	    var pieChartCanvas3 = $("#pieChart3").get(0).getContext("2d");
                    var pieChart3 = new Chart(pieChartCanvas3);
             
            var PieData3 = result[2]

            var pieOptions3 = {
                    //Boolean - Whether we should show a stroke on each segment
                    segmentShowStroke: false,
                    //String - The colour of each segment stroke
                    segmentStrokeColor: "#fff",
                    //Number - The width of each segment stroke
                    segmentStrokeWidth: 2,
                    //Number - The percentage of the chart that we cut out of the middle
                    percentageInnerCutout: 50, // This is 0 for Pie charts
                    //Number - Amount of animation steps
                    animationSteps: 100,
                    //String - Animation easing effect
                    animationEasing: "easeOutBounce",
                    //Boolean - Whether we animate the rotation of the Doughnut
                    animateRotate: true,
                    //Boolean - Whether we animate scaling the Doughnut from the centre
                    animateScale: false,
                    //Boolean - whether to make the chart responsive to window resizing
                    responsive: true,
                    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                    maintainAspectRatio: true,
                    //String - A legend template
                    legendTemplate: ""
                  };
                  //Create pie or douhnut chart
                  // You can switch between pie and douhnut using the method below.
                  pieChart3.Doughnut(PieData3, pieOptions3);
            
              }});
     
      });
    </script>
</body>
</html>