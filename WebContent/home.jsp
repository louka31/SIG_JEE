<%@page import="com.gcollecte.service.ProjetService"%>
<%@page import="com.gcollecte.service.EchelleService"%>

<%@page import="com.gcollecte.service.ImageService"%>
<%@page import="com.gcollecte.service.PermisService"%>


<%@page import="com.gcollecte.service.LoginService"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.model.Locateur"%>
<%@page import="com.gcollecte.model.Puits"%>
<%@page import="com.gcollecte.model.Compagne"%>
<%@page import="com.gcollecte.model.Image"%>
<%@page import="com.gcollecte.model.Permis"%>

<%@page import="com.gcollecte.service.PuitsService"%>
<%@page import="com.gcollecte.model.Puits"%>

<%@page import="com.gcollecte.service.StatusService"%>
<%@page import="com.gcollecte.model.Status"%>


<%@page import="com.gcollecte.service.CordonneesService"%>
<%@page import="com.gcollecte.model.Cordonnees"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.model.Echelle"%>
<%@page import="java.io.*"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
     <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
  
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
             
              <% } %>
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
                 
                    <div class="dropdown-divider"></div><a href="Logout" class="dropdown-item"><i class="icon-logout"></i><span>Deconnexion</span></a>
                  </div>
                </li>
              
              </ul>
             
            </div>
          </div>
        </div>
      </nav>
  <div class="main-panel">
        <div class="main-content">
          <div class="content-wrapper"><div class="row">
 
  
   <div class="col-xl-3 col-lg-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="px-3 py-3">
            <div class="media">
              <div class="media-body text-left">
               <%LoginService l =new LoginService() ;
              %>
                <h3 class="mb-1 danger"><%=l.getListOfUser() %></h3>
                <span>Utilisateurs</span>
              </div>
              <div class="media-right align-self-center">
                <i class="icon-user danger font-large-2 float-right"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  
  
  
  
  
  
  
 



  <div class="col-xl-3 col-lg-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="px-3 py-3">
            <div class="media">
              <div class="media-body text-left">
                <h3 class="mb-1 success"><%=l.getListOfPuits() %></h3>
                <span>Puits</span>
              </div>
              <div class="media-right align-self-center">
                <i class="ft-map-pin success font-large-2 float-right"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>




  
  
    <div class="col-xl-3 col-lg-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="px-3 py-3">
            <div class="media">
              <div class="media-body text-left">
                <h3 class="mb-1 warning"><%=l.getListOfPermiss() %></h3>
                <span>Permis</span>
              </div>
              <div class="media-right align-self-center">
                <i class="icon-pie-chart warning font-large-2 float-right"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


 <div class="col-xl-3 col-lg-6 col-12">
      <div class="card">
        <div class="card-content">
          <div class="px-3 py-3">
            <div class="media">
              <div class="media-body text-left">
                <h3 class="mb-1 primary"><%=l.getListOfCompagnes() %></h3>
                <span>Compagnies</span>
              </div>
              <div class="media-right align-self-center">
                <i class="
icon-users primary font-large-2 float-right"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


<div class="row match-height">
  <div class="col-xl-4 col-lg-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title mb-0">Historique Utilisateurs</h4>
      </div>
      <div class="card-content">
        <div class="card-body">
        <% LoginService y=new LoginService();
        
        List<User> uu=y.getListOfUsers();
        for(User u:uu){
        %>
          <div class="media mb-3">
            <img alt="96x96" class="media-object d-flex mr-3 align-self-center bg-primary height-50 rounded-circle" src="app-assets/img/portrait/small/avatar-s-12.png">
            <div class="media-body">
              <h4 class="font-medium-1 mt-2 mb-0"><%=u.getFirst_name()%> <%=u.getLast_name()%></h4>
            </div>
            <a class="d-flex ml-3 btn btn-raised btn-round gradient-blackberry py-2 width-150 justify-content-center white" href="users1.jsp">+ Details</a>
          </div>
         <% } %> 
        </div>
      </div>
    </div>
  </div>
  <div class="col-xl-8 col-lg-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title mb-0">Puits</h4>
      </div>
      <div class="card-content">
        <div class="card-body">
          <div class="chart-info mb-3">
            <span class="text-uppercase mr-3"><i class="fa fa-circle primary font-small-2 mr-1"></i> Puits Productives</span>
            <span class="text-uppercase"><i class="fa fa-circle danger font-small-2 mr-1"></i> Puits Non-Productives</span>
          </div>
										<div id="map" class="height-350 lineChart1 lineChart1Shadow">
<div id="popup"></div>
										</div>
									</div>
      </div>
    </div>
  </div>
</div>


  </div>
</div>

          </div>
        </div>
  
     
 
    <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
     <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG7gNHAhDzgYmq4-EHvM4bqW1DNj2UCuk&libraries=places"></script>
        <script src="dist/js/app.js"></script>
 <script >
 var attribution = new ol.control.Attribution({
     collapsible: false
 });
 var raster = new ol.layer.Tile({
     source: new ol.source.OSM()
   });
 var map = new ol.Map({
     controls: ol.control.defaults({attribution: false}).extend([attribution]),
     layers: [
         new ol.layer.Tile({   source: new ol.source.TileImage({ url: 'http://mt1.google.com/vt/lyrs=s&hl=pl&&x={x}&y={y}&z={z}' })
         }),
    	 raster
     ],
     
     
     target: 'map',
     view: new ol.View({
         center: ol.proj.fromLonLat([10.1873571,34.0556391]),
         maxZoom: 18,
         zoom: 5.5
     })
 });
 map.addControl(new ol.control.FullScreen());

 <% CordonneesService pp=new CordonneesService();
	PuitsService psss = new PuitsService();
	StatusService S=new StatusService();
	List<Puits> x = psss.getListOfPuits();
	for (Puits ii : x) {
%>
 var layer = new ol.layer.Vector({
     source: new ol.source.Vector({
         features: [
             new ol.Feature({
                 geometry: new ol.geom.Point(ol.proj.fromLonLat([<%=pp.getCordonneesById(ii.getIdCordonnees()+"").getX_m()%>,<%=pp.getCordonneesById(ii.getIdCordonnees()+"").getY_m()%>]))
             })
         ]
     })
 });
 
 <% if (S.getStatus(ii.getIdStatus()+"").getProductive().equals("productive"))
	{%>
 var iconStyle = new ol.style.Style({
     image: new ol.style.Icon(({
       anchor: [0.5, 46],
       anchorXUnits: 'fraction',
       anchorYUnits: 'pixels',
       opacity: 0.75,
       src: 'app-assets/img/MM.png'
     })),
     
         text: new ol.style.Text({
             text: "<%=ii.getId() %>",
             offsetY: -43,
             fill: new ol.style.Fill({
                 color: '#04147A'
             })
         })
    
     
   });
layer.setStyle(iconStyle);
<% } else {%>
var iconStyle = new ol.style.Style({
    image: new ol.style.Icon( ({
      anchor: [0.5, 46],
      anchorXUnits: 'fraction',
      anchorYUnits: 'pixels',
      opacity: 0.6,
      src: 'app-assets/img/M2.png'
    })),
    
        text: new ol.style.Text({
            text: "<%=ii.getId() %>",
            offsetY: -47,
            fill: new ol.style.Fill({
                color: '#04147A'
            })
        })
   
    
  });
layer.setStyle(iconStyle);
<% } %>

 map.addLayer(layer);
 <% } %>
 

 
 var element = document.getElementById('popup');

 var popup = new ol.Overlay({
   element: element,
   positioning: 'bottom-center',
   stopEvent: false,
   offset: [0,-60]
 });
 map.addOverlay(popup);

 map.on('click', function(evt) {

   var feature = map.forEachFeatureAtPixel(evt.pixel,
     function(feature) {
       return feature;
     });
   if (feature) {var coordinates = feature.getGeometry().getCoordinates();
	   var bb="";
	   var lonlat = ol.proj.transform(coordinates, 'EPSG:3857', 'EPSG:4326');
	   $.ajax({
			url : 'AFFServlet',
			data : {

				nom : lonlat[0]+"",

			},
				success : function(responseText) {

					bb=responseText;
				     popup.setPosition(coordinates);
				     $(element).popover({
				       placement: 'top',
				       html: true,
				       content:bb
				     });
				     $(element).popover('show');
				   
				}
			});
	   

		 
 } else {
     $(element).popover('dispose');
   }
   
   
   
   
 map.on('pointermove', function(e) {
   if (e.dragging) {
     $(element).popover('dispose');
     return;
   }
   var pixel = map.getEventPixel(e.originalEvent);
   var hit = map.hasFeatureAtPixel(pixel);
 });
 
 
 });
 
 </script>
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
    <script src="app-assets/vendors/js/chartist.min.js" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN APEX JS-->
    <script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/notification-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/customizer.js" type="text/javascript"></script>
    <!-- END APEX JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="app-assets/js/dashboard2.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS-->
  </body>
  <!-- END : Body-->
</html>