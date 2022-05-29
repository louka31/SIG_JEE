<%@page import="com.gcollecte.service.PuitsService"%>
<%@page import="com.gcollecte.model.Puits"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.model.User"%>


<html lang="en" class="loading">
  <head>
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
     <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script><link rel="stylesheet" type="text/css" href="app-assets/fonts/feather/style.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/simple-line-icons/style.css">
    <link rel="stylesheet" type="text/css" href="app-assets/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/prism.min.css">
      <link rel="stylesheet" type="text/css" href="app-assets/vendors/css/sweetalert2.min.css">
    <link rel="stylesheet" type="text/css" href="app-assets/css/app.css">
    <style>
      .map {
        width: 950px;
        height:400px;
      }
    </style>
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
		 
		 { session.invalidate();
			
		 response.sendRedirect("accueil.jsp");	
		 return;
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
               <li class=" nav-item"><a href="outils.jsp"><i class="icon-map"></i><span data-i18n="" class="menu-title">Outils</span></a>
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
                 
                    <div class="dropdown-divider"></div><a href="Logout" class="dropdown-item"><i class="icon-logout"></i><span>Déconnexion</span></a>
                  </div>
                </li>
              
              </ul>
             
            </div>
          </div>
        </div>
      </nav>

     <div class="main-panel" >
			<!-- BEGIN : Main Content-->
			<div class="main-content">
				<div class="content-wrapper">
					<!--Extended Table starts-->
					<div class="row">
						<div class="col-12">
							<div class="content-header">  Outils</div>
							
						</div>
					</div>
					<section id="extended">
						<div class="row">
							<div class="col-sm-20">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											
      <label  >Choisie le type de géométrie</label>
      <select id="type" >
        <option value="Point">Point</option>
        <option value="LineString">Ligne</option>
        <option value="Polygon">Polygone</option>
        <option value="Circle">Cercle</option>
        <option value="None">Rien</option>
      </select>
      <button onclick="getfeatures()" style="margin-left: 80%;" class="btn btn-raised btn-success btn-min-width mr-1 mb-1">save</button>	
   <a href="" id="a" style="display:none;" >click here to download your file</a>
										</h4>
									</div>
									<div class="card-content">
										<div class="card-body table-responsive">
											 <div id="map" class="map"></div>
    
		<textarea rows="20" cols="10" id="demo" hidden ></textarea>	
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

				</div>
			</div>
			
			<footer class="footer footer-static footer-light">
				<p class="clearfix text-muted text-sm-center px-2">
					<span>Copyright &copy; 2020 <a href="http://yebni.comt"
						id="pixinventLink" target="_blank"
						class="text-bold-800 primary darken-2">YEBNI </a>, All rights
						reserved.
					</span>
				</p>
			</footer>
			<!-- End : Footer-->

		</div>
    </div>



    <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>

     <script>
    
     var geojsonObject = {

    		    'type': 'FeatureCollection',
    		    'crs': {
    		        'type': 'name'
    		        },
    		        'features':[]
    		                };
    		    var features = (new ol.format.GeoJSON()).readFeatures(geojsonObject);
    		    var vectorSource = new ol.source.Vector({
    		        features: features,
    		        format: new ol.format.GeoJSON()
    		    });
     var raster = new ol.layer.Tile({
       source: new ol.source.OSM()
     });

     var source =new ol.source.Vector({wrapX: false});

     var vector = new ol.layer.Vector({
       source:  source
     });

     var map = new ol.Map({
       layers: [raster, vector],
       target: 'map',
       view: new ol.View({
         center: [81174901.0464046 , 4000102.5642198436],
         zoom: 6
       })
     });
     var mousePosition = new ol.control.MousePosition({
         target: 'mouse_p'
             });

     var scaleLine = new ol.control.ScaleLine({
     target: 'map'});
     map.addControl(mousePosition);

     var typeSelect = document.getElementById('type');
     var select = new ol.interaction.Select();
     var modify = new ol.interaction.Modify({
     features: select.getFeatures()
     });
     var draw; // global so we can remove it later
     function addInteraction() {
       var value = typeSelect.value;
       if (value !== 'None') {
         draw = new ol.interaction.Draw({
           source: source,
           type: typeSelect.value
          
         });
         map.addInteraction(draw);
       }else{
           map.addInteraction(select);
           map.addInteraction(modify);
           }
     }


     /**
      * Handle change event.
      */
     typeSelect.onchange = function() {
       map.removeInteraction(draw);
       addInteraction();
     };
   
     addInteraction();
    

     function getfeatures(){
    	 var writer = new ol.format.GeoJSON();
         var geojsonStr = writer.writeFeatures(source.getFeatures());
     document.getElementById("demo").innerHTML = geojsonStr;
     var file = new Blob([geojsonStr], {type: 'geojson'});
  	  a.href = URL.createObjectURL(file);
  	  a.download = 'export.geojson';
  	  a.click();
     }   
     
    </script>
        <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=fetch,requestAnimationFrame,Element.prototype.classList,URL"></script>
	    <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
    <!-- Theme customizer Ends-->
    <!-- BEGIN VENDOR JS-->
    <script src="app-assets/vendors/js/core/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/core/popper.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/core/bootstrap.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/prism.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/jquery.matchHeight-min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/screenfull.min.js" type="text/javascript"></script>
    <script src="app-assets/vendors/js/pace/pace.min.js" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN APEX JS-->
    <script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/notification-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/customizer.js" type="text/javascript"></script>
    <!-- END APEX JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <!-- END PAGE LEVEL JS-->
	
  </body>
  <!-- END : Body-->
</html>