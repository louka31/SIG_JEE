<%@page import="com.gcollecte.service.ProjetService"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.model.Projet"%>
<%@page import="com.gcollecte.model.Compagne"%>
<%@page import="com.gcollecte.service.CompagneService"%>
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
      <div class="main-panel">
        <!-- BEGIN : Main Content-->
        <div class="main-content">
          <div class="content-wrapper"><!-- Basic form layout section start -->
<section id="basic-form-layouts">
  <div class="row">
    <div class="col-sm-12">
      <div class="content-header">Modifier Projet</div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <% ProjetService ps=new ProjetService();
			  // User user=(User)request.getSession().getAttribute("user");
               List<Projet> projet=ps.getProjets(String.valueOf(request.getParameter("id")));
              int i=1;
               for(Projet p:projet){%>
        <div class="card-body">
          <div class="px-3">
            <form class="form form-horizontal form-bordered" action="ModProjetServlet" method="post">
              <div class="form-body">
                <h4 class="form-section"><i class="ft-info"></i> Information Projet</h4>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-md-3 label-control" for="userinput1">Nom de Projet</label>
                      <div class="col-md-9">
                        <input type="text" name="nom" id="userinput1" value="<%=p.getNom() %>" class="form-control border-primary" placeholder="Nom de Projet" required  pattern="[A-Za-z]{4,30}"  title="Le champs doit contenir au moins 4 lettres alphabétiques"
                          name="firstname">
                      </div>
                    </div>
                    <div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Compagnie</label>
																<div class="col-md-9">
																	<%
																	CompagneService cs = new CompagneService();

																		List<Compagne> ccs = cs.getListOfCompagne();
%>
																	<select name="IdCompagne">
<% 
																		for (Compagne W : ccs) {
																	%>


																		<option value="<%=W.getId()%>">
																			<%=W.getNom()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>
                  </div>
                 
                </div>
               

                <h4 class="form-section"><i class="ft-mail"></i> Etendu de Projet</h4>

               <div class="row">
                  <div class="col-md-6">
                  <div id="map" style="width:450px;height:500px;">
				  
				  
				  
				  </div>
</div>
<div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-md-3 label-control" for="userinput1">X MIN</label>
                      <div class="col-md-9">
                        <input type="number" step="0.01" id="xmin" name="x_min" value="<%=p.getXmin() %>"readonly class="form-control border-primary" placeholder="X MIN"
                          name="firstname">
                          <input type="hidden" name="id" value="<%=p.getId() %>">
                      </div>
                    </div>
					 <div class="form-group row">
                      <label class="col-md-3 label-control" for="userinput1">X MAX</label>
                      <div class="col-md-9">
                        <input type="number" step="0.01" id="xmax" name="x_max" value="<%=p.getXmax() %>" readonly class="form-control border-primary" placeholder="X MAX"
                          name="firstname">
                      </div>
                    </div>
					 <div class="form-group row">
                      <label class="col-md-3 label-control" for="userinput1">Y MIN</label>
                      <div class="col-md-9">
                        <input type="number" step="0.01" id="ymin" name="y_min" value="<%=p.getYmin() %>" readonly class="form-control border-primary" placeholder="Y MIN"
                          name="firstname">
                      </div>
                    </div>
					 <div class="form-group row">
                      <label class="col-md-3 label-control" for="userinput1">Y MAX</label>
                      <div class="col-md-9">
                        <input type="number" step="0.01" readonly name="y_max"id="ymax" value="<%=p.getYmax() %>" class="form-control border-primary" placeholder="Y MAX"
                          name="firstname">
                      </div>
                    </div>
                  </div>


				 
              </div>
<% } %>
              <div class="form-actions right">
               	<button type="button"
															class="btn btn-raised btn-warning mr-1">
															<a href="projet.jsp">
															<i class="ft-x"></i> Annuler</a>
														</button>
                <button type="submit" class="btn btn-raised btn-primary">
                  <i class="fa fa-check-square-o"></i> Sauvgarder
                </button>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- // Basic form layout section end -->

          </div>
        </div>
        <!-- END : End Main Content-->

        <!-- BEGIN : Footer-->
        <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>
        <!-- End : Footer-->

      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

     <script>

      // This example creates a 2-pixel-wide red polyline showing the path of
      // the first trans-Pacific flight between Oakland, CA, and Brisbane,
      // Australia which was made by Charles Kingsford Smith.

var flightPlanCoordinates = [];
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: {lat: 46.1314281, lng: -2.4346222},
          mapTypeId: 'satellite'
        });
		var i=0;
google.maps.event.addListener(map, 'click', function(event) {
//alert(event.latLng);
   placeMarker(event.latLng);
   flightPlanCoordinates.push(event.latLng);
   i++;
   if(i==1){
      document.getElementById('xmin').value=event.latLng.lat();
}
if(i==3){
      document.getElementById('xmax').value=event.latLng.lat();
}
if(i==2){
      document.getElementById('ymin').value=event.latLng.lat();
}
if(i==4){
      document.getElementById('ymax').value=event.latLng.lat();
}
   //line(flightPlanCoordinates)
   polygon(flightPlanCoordinates);
});
function placeMarker(location) {
    var marker = new google.maps.Marker({
        position: location, 
        map: map
    });
}

        
		function line(flightPlanCoordinates){
        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });

        flightPath.setMap(map);
      }
	  function polygon(flightPlanCoordinates){
        var flightPath = new google.maps.Polygon({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 2
        });

        flightPath.setMap(map);

		}



 
}

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
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN APEX JS-->
    <script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/notification-sidebar.js" type="text/javascript"></script>
    <script src="app-assets/js/customizer.js" type="text/javascript"></script>
    <!-- END APEX JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <!-- END PAGE LEVEL JS-->
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfqddk6NK_yUfmF6m6ovYMPGdTWhzAGVc&callback=initMap">
    </script>
  </body>
  <!-- END : Body-->
</html>