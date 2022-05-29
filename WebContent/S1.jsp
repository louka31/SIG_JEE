<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.gcollecte.model.Puits"%>
<%@page import="com.gcollecte.service.PuitsService"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.service.ProjetService"%>
<%@page import="com.gcollecte.service.PermisService"%>
<%@page import="com.gcollecte.service.StatusService"%>

<!DOCTYPE html>
<html lang="en" class="loading">
  <head>
  <link rel="stylesheet" type="text/css" href="https://www.chartjs.org/samples/latest/style.css">
	<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
	<script src="https://www.chartjs.org/samples/latest/charts/area/analyser.js"></script>
	
	
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
		</style>
    <title>Petrolum</title>
    <link rel="apple-touch-icon" sizes="60x60" href="app-assets/img/ico/apple-icon-60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="app-assets/img/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="app-assets/img/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="app-assets/img/ico/apple-icon-152.png">
     <link rel="shortcut icon" type="image/x-icon" href="app-assets/img/ico/favicon.ico">
    <link rel="shortcut icon" type="image/png" href="app-assets/img/ico/favicon-32.png">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900|Montserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="http://openlayers.org/api/OpenLayers.js"></script>
     <link rel="stylesheet" href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css" type="text/css">
     <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
     	<script src="./js/Chart.min.js"></script>
	<script src="./js/utils.js"></script>
	<style>
		canvas {
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
		}
		centrer {
  text-align: center;
}
	</style>
		
   <link rel="stylesheet" type="text/css" href="app-assets/fonts/feather/style.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/simple-line-icons/style.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/prism.min.css">
      <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/sweetalert2.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.css">
  </head>
  <body data-col="2-columns" class=" 2-columns ">
    <div class="wrapper">


      
          <div data-active-color="white" data-background-color="man-of-steel" data-image="app-assets/img/petrole.jpg" class="app-sidebar">

        <!-- Sidebar Header starts-->
  <div class="sidebar-header">
				<div class="logo clearfix">
					<a href="index.html" class="logo-text float-left"> <span
						class="text align-middle">Petrolum</span></a><a id="sidebarToggle"
						href="javascript:;"
						class="nav-toggle d-none d-sm-none d-md-none d-lg-block"><i
						data-toggle="expanded" class="toggle-icon ft-toggle-right"></i></a><a
						id="sidebarClose" href="javascript:;"
						class="nav-close d-block d-md-block d-lg-none d-xl-none"><i
						class="ft-x"></i></a>
				</div>
			</div>
    <%    User user = (User) session.getAttribute("user");
		 if (session.getAttribute("user")==null)
		 
		 {
			 response.sendRedirect("login.jsp");	
		 }
		 
		 
			 %>		
        <div class="sidebar-content">
          <div class="nav-container">
             <ul id="main-menu-navigation" data-menu="menu-navigation" data-scroll-to-active="true" class="navigation navigation-main">
              <li ><a href="home.jsp"><i class="fa fa-home"></i><span data-i18n="" class="menu-title">Tableau de bord</span></a>
              
              </li>
           
              <li class=" nav-item"><a href="inventaire.jsp"><i class="fa fa-file-text"></i><span data-i18n="" class="menu-title">Fichier inventaire</span></a>
              </li>
              <li class=" nav-item"><a href="S1.jsp"><i class="icon-graph"></i><span data-i18n="" class="menu-title">Statistiques</span></a>
              </li>
             
               <li class=" nav-item"><a href="outils.jsp"><i class="icon-pencil"></i><span data-i18n="" class="menu-title">Outils</span></a>
              </li>
             <% if(user.getRole().equals("Administrateur") || user.getRole().equals("Indexateur"))
															{
															%>
               <li class=" nav-item"><a href="Gestionpuits.jsp"><i class="ft-map-pin"></i><span data-i18n="" class="menu-title">Puits</span></a>
              </li>
              
              <li class=" nav-item"><a href="compagne.jsp"><i class="icon-users"></i><span data-i18n="" class="menu-title">Compagnies</span></a>
              </li>
                  <li class=" nav-item"><a href="cordonnees.jsp"><i class="ft-crosshair"></i><span data-i18n="" class="menu-title">Cordonnees</span></a>
              </li>
               
             
              <li class=" nav-item"><a href="projet.jsp"><i class="fa fa-file-text"></i><span data-i18n="" class="menu-title">Projets</span></a>
              </li>
              <% } %>
              <% if(user.getRole().equals("Administrateur"))
															{
															%>
                <li class=" nav-item"><a href="users1.jsp"><i class="icon-user"></i><span data-i18n="" class="menu-title">Utilisateurs</span></a>
              </li>
               <% } %>
               
                  <% if(user.getRole().equals("Administrateur") || user.getRole().equals("Indexateur"))
															{
															%>
                 <li class=" nav-item"><a href="new.jsp"><i class="
icon-settings"></i><span data-i18n="" class="menu-title">Configuration</span></a>
              </li>
             <%} %>
              
            </ul>
          </div>
        </div>
     
        <div class="sidebar-background"></div>   
      </div>
    <nav
			class="navbar navbar-expand-lg navbar-light bg-faded header-navbar">
			<div class="container-fluid">
				<div class="navbar-header">
					
					
				</div>
				<div class="navbar-container">
					<div id="navbarSupportedContent" class="collapse navbar-collapse">
						<ul class="navbar-nav">
							<li class="nav-item mr-2 d-none d-lg-block"><a
								id="navbar-fullscreen" href="javascript:;"
								class="nav-link apptogglefullscreen"><i
									class="ft-maximize font-medium-3 blue-grey darken-4"></i>
									<p class="d-none">fullscreen</p></a></li>
              
                
                <li class="dropdown nav-item"><a id="dropdownBasic3" href="#" data-toggle="dropdown" class="nav-link position-relative dropdown-toggle"><i class="fa fa-user font-medium-3 blue-grey darken-4"></i>	 
				Bienvenue 
				  <%= user.getFirst_name() + " " + user.getLast_name() %> 
    
                
                   </a>
                  <div  aria-labelledby="dropdownBasic3" class="dropdown-menu text-left dropdown-menu-right">
                   <a href="editprofile.jsp" class="dropdown-item py-1"><i class="fa fa-edit mr-2"></i><span>Edit Profile</span></a>
                  <a href="calender.jsp" class="dropdown-item py-1"><i class="icon-calendar"></i><span>      Calendrier</span></a>
                 
                    <div class="dropdown-divider"></div><a href="Logout" class="dropdown-item"><i class="icon-logout"></i><span>Déconnexion</span></a>
                  </div>
                </li>
              
              </ul>
             
            </div>
          </div>
        </div>
      </nav>
<body>
 <div class="main-panel">
        <!-- BEGIN : Main Content-->
        <div class="main-content">
          <div class="content-wrapper"><!-- Line Chart Starts -->
<div class="row">
    <div class="col-sm-8">
        <div class="content-header">Statistiques</div>
    </div>
</div>
<div class="row">

    <div class="col-sm-12" >
    
        <div class="card" >
	<div id="canvas-holder" style="width:80%">
		<canvas id="chart-area"></canvas>
	</div>
	</div>
	<script>
	<%
	PuitsService ps = new PuitsService(); %>
		

		var chartColors = window.chartColors;
		var color = Chart.helpers.color;
		var config = {
			data: {
				datasets: [{
					data: [
						<%=ps.getListOfPuit1("2")%>,
						<%=ps.getListOfPuit2("4")%>,
					],
					backgroundColor: [
						color(chartColors.red).alpha(0.5).rgbString(),
						color(chartColors.orange).alpha(0.5).rgbString(),
						
					],
					label: 'My dataset' // for legend
				}],
				labels: [
					'productive',
					'Non-productive',
					
				]
			},
			options: {
				responsive: true,
				legend: {
					position: 'right',
				},
				title: {
					display: true,
					text: 'Statistiques de productivite des puits'
				},
				scale: {
					ticks: {
						beginAtZero: true
					},
					reverse: false
				},
				animation: {
					animateRotate: false,
					animateScale: true
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area');
			window.myPolarArea = Chart.PolarArea(ctx, config);
		};

		
		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addData').addEventListener('click', function() {
			if (config.data.datasets.length > 0) {
				config.data.labels.push('data #' + config.data.labels.length);
				config.data.datasets.forEach(function(dataset) {
					var colorName = colorNames[config.data.labels.length % colorNames.length];
					dataset.backgroundColor.push(window.chartColors[colorName]);
					dataset.data.push(randomScalingFactor());
				});
				window.myPolarArea.update();
			}
		});
		
	</script>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">NOMBRE DEs Permis et des projets PAR ANNEES</h4>  
                			<button onclick="toggleSmooth(this)" style="margin-left: 80%;">Smooth</button>
                              
            </div>
            <div class="card-content">
               <div class="wrapper">
			<canvas id="chart-0" height="60"></canvas>
		</div>
            </div>
        </div>
    </div>
</div>


<script>
		var presets = window.chartColors;
		var utils = Samples.utils;
		var inputs = {
			min: 20,
			max: 80,
			count: 8,
			decimals: 2,
			continuity: 1
		};

		

		function generateLabels() {
			return utils.months({count: inputs.count});
		}

		utils.srand(42);
		<%
		ProjetService W = new ProjetService();
		PermisService pss = new PermisService();
	%>
		var data = {
				labels: ['2015', '2016', '2017', '2018', '2019', '2020'],
			datasets: [{backgroundColor: utils.transparentize(presets.blue),
				borderColor: presets.blue,
	            data: [<%=W.nbOfProjetss("2015")%>,<%=W.nbOfProjetss("2016")%>,<%=W.nbOfProjetss("2017")%>,<%=W.nbOfProjetss("2018")%>,<%=W.nbOfProjetss("2019")%>,<%=W.nbOfProjetss("2020")%>],
				label: 'Nombre des projets',
				fill: '-1'
			},{
				backgroundColor: utils.transparentize(presets.red),
				borderColor: presets.red,
	            data: [<%=pss.nbOfPermis("2015")%>,<%=pss.nbOfPermis("2016")%>,<%=pss.nbOfPermis("2017")%>,<%=pss.nbOfPermis("2018")%>,<%=pss.nbOfPermis("2019")%>,<%=pss.nbOfPermis("2020")%>],
				label: 'Nombre des permis',
				fill: 8
			}]
		};

		var options = {
			maintainAspectRatio: false,
			spanGaps: false,
			elements: {
				line: {
					tension: 0.000001
				}
			},
			scales: {
				yAxes: [{
					stacked: true
				}]
			},
			plugins: {
				filler: {
					propagate: false
				},
				'samples-filler-analyser': {
					target: 'chart-analyser'
				}
			}
		};

		var chart = new Chart('chart-0', {
			type: 'line',
			data: data,
			options: options
		});

		

		// eslint-disable-next-line no-unused-vars
		function toggleSmooth(btn) {
			var value = btn.classList.toggle('btn-on');
			chart.options.elements.line.tension = value ? 0.4 : 0.000001;
			chart.update();
		}

		
	</script>
	<!-- Line Chart -->
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Nombre des puits par annees</h4>                
            </div>
            <div class="card-content">
                <div class="card-body chartjs">
                  <canvas id="myChart" height="130"></canvas>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['2015', '2016', '2017', '2018', '2019', '2020'],
        datasets: [{
            label: 'Nombre de puits',
    		<%
    		
			PuitsService psss = new PuitsService();

		%>
            data: [<%=psss.getListOfPuitssss("2015")%>, <%=psss.getListOfPuitssss("2016")%>, <%=psss.getListOfPuitssss("2017")%>, <%=psss.getListOfPuitssss("2018")%>,<%=psss.getListOfPuitssss("2019")%>, <%=psss.getListOfPuitssss("2020")%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
        </div>
    </div>
</div>


</div>
</div>
</div>
</div>


	
	
	
	

<!-- Line Chart -->



          </div>
        </div>
       
	
	 
         <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>

      </div>
    </div>
        <script src="app-assets/vendors/js/core/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/core/popper.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/core/bootstrap.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/prism.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/jquery.matchHeight-min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/screenfull.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/pace/pace.min.js" type="text/javascript"></script>
        <script src="app-assets/vendors/js/chart.min.js" type="text/javascript"></script>
        <script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
        <script src="app-assets/js/notification-sidebar.js" type="text/javascript"></script>
        <script src="app-assets/js/customizer.js" type="text/javascript"></script>
    
</body>
</html>
