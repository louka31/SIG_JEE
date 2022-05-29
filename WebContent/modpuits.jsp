<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gcollecte.service.PuitsService"%>
<%@page import="com.gcollecte.model.Puits"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.service.PermisService"%>
<%@page import="com.gcollecte.service.ProjetService"%>
<%@page import="com.gcollecte.service.ImageService"%>
<%@page import="com.gcollecte.model.Image"%>
<%@page import="com.gcollecte.model.Permis"%>
<%@page import="com.gcollecte.model.Document"%>
<%@page import="com.gcollecte.model.Cordonnees"%>
<%@page import="com.gcollecte.model.Status"%>
<%@page import="com.gcollecte.model.Echelle"%>

<%@page import="com.gcollecte.service.DocumentService"%>
<%@page import="com.gcollecte.service.CordonneesService"%>
<%@page import="com.gcollecte.service.StatusService"%>
<%@page import="com.gcollecte.service.EchelleService"%>
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
				<div class="content-wrapper">
					<!-- Basic form layout section start -->
					<section id="basic-form-layouts">
						<div class="row">
							<div class="col-sm-12">
								<div class="content-header">Modifier Puits</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="card">

									<div class="card-body">
										<div class="px-3">
											<%
												PuitsService ls = new PuitsService();

												Puits u = ls.getPuits(request.getParameter("id"));
											%>
											<form class="form form-horizontal form-bordered"
												action="ModPuitsServlet" method="post">
												<div class="form-body">
													<h4 class="form-section">
														<i class="ft-info"></i> Informations Puits
													</h4>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Numéro
																</label>
																<div class="col-md-9">
																	<input type="number" value="<%=u.getNum()%>"
																		name="num" id="userinput1"
																		class="form-control border-primary" placeholder="Num ">
																																			<input name="id" type="hidden" value="<%=u.getId()%>">
																		
																</div>
															</div>
															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Nom
																</label>
																<div class="col-md-9">
																	<input type="text" value="<%=u.getNom()%>"
																		name="nom" id="userinput1"
																		class="form-control border-primary" placeholder="Nom " required  pattern="[A-Za-z]{4,30}"  title="Le champs doit contenir au moins 4 lettres alphabétiques">
																</div>
															</div>
															
																<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Sigle
																</label>
																<div class="col-md-9">
																	<input type="text" value="<%=u.getSigle()%>"
																		name="sigle" id="userinput1"
																		class="form-control border-primary" placeholder="Sigle " required  pattern="[A-Za-z]{4,30}"  title="Le champs doit contenir au moins 4 lettres alphabétiques">
																</div>
															</div>
																			
															
															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Document</label>
																<div class="col-md-9">
																	<%
																	DocumentService ps = new DocumentService();

																		List<Document> pp = ps.getListOfDocument();
																		%>
																		<select name="id_fichier">
<% 
																		for (Document p : pp) {
																	
%>
																	

																		<option value="<%=p.getId()%>"><%=p.getNom()%></option>
																		

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>



															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Image</label>
																<div class="col-md-9">
																	<%
																		ImageService is = new ImageService();

																		List<Image> iis = is.getListOfImage();
%>
																	<select name="id_image">
<% 
																		for (Image p : iis) {
																	%>


																		<option value="<%=p.getId()%>">
																			<%=p.getEnregistrement()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>



															





															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Cordonnees</label>
																<div class="col-md-9">
																	<%
																		CordonneesService cs = new CordonneesService();

																		List<Cordonnees> ccs = cs.allCordonneess();
%>
																	<select name="id_cordonnees">
<% 
																		for (Cordonnees p : ccs) {
																	%>


																		<option value="<%=p.getId()%>">
																			<%=p.getId()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>


															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Permis</label>
																<div class="col-md-9">
																	<%
																		PermisService pps = new PermisService();

																		List<Permis> ppps = pps.getListOfPermis();
																		%>
																		
																	<select name="id_permis">

<% 
																		for (Permis p : ppps) {
																	%>


																		<option value="<%=p.getId()%>">
																			<%=p.getNouveau_nom()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>


															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Status</label>
																<div class="col-md-9">
																	<%
																		StatusService ss = new StatusService();

																		List<Status> sss = ss.getListOfStatus();
%>
																	<select name="id_status">
<% 
																		for (Status p : sss) {
																	%>


																		<option value="<%=p.getId()%>">
																			<%=p.getProductive()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>



															<div class="form-group row">
																<label class="col-md-3 label-control" for="userinput1">Id
																	Echelle</label>
																<div class="col-md-9">
																	<%
																		EchelleService es = new EchelleService();

																		List<Echelle> ess = es.getListOfEchelle();
%>
																	<select name="id_echelle">

<% 
																		for (Echelle p : ess) {
																	%>


																		<option value="<%=p.getId()%>">
																			<%=p.getNom()%>
																		</option>

																		<%
																			}
																		%>

																	</select>
																</div>
															</div>
																
														</div>
</div>
													</div>


													


													</div>

													<div class="form-actions right">
														<button type="button"
															class="btn btn-raised btn-warning mr-1">
															<a href="Gestionpuits.jsp">
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
	<!-- ////////////////////////////////////////////////////////////////////////////-->

	<script>
		// This example creates a 2-pixel-wide red polyline showing the path of
		// the first trans-Pacific flight between Oakland, CA, and Brisbane,
		// Australia which was made by Charles Kingsford Smith.

		var flightPlanCoordinates = [];
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 6,
				center : {
					lat : 46.1314281,
					lng : -2.4346222
				},
				mapTypeId : 'satellite'
			});
			var i = 0;
			google.maps.event.addListener(map, 'click', function(event) {
				//alert(event.latLng);
				placeMarker(event.latLng);
				flightPlanCoordinates.push(event.latLng);
				i++;
				if (i == 1) {
					document.getElementById('xmin').value = event.latLng.lat();
				}
				if (i == 3) {
					document.getElementById('xmax').value = event.latLng.lat();
				}
				if (i == 2) {
					document.getElementById('ymin').value = event.latLng.lat();
				}
				if (i == 4) {
					document.getElementById('ymax').value = event.latLng.lat();
				}
				//line(flightPlanCoordinates)
				polygon(flightPlanCoordinates);
			});
			function placeMarker(location) {
				var marker = new google.maps.Marker({
					position : location,
					map : map
				});
			}

			function line(flightPlanCoordinates) {
				var flightPath = new google.maps.Polyline({
					path : flightPlanCoordinates,
					geodesic : true,
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 2
				});

				flightPath.setMap(map);
			}
			function polygon(flightPlanCoordinates) {
				var flightPath = new google.maps.Polygon({
					path : flightPlanCoordinates,
					geodesic : true,
					strokeColor : '#FF0000',
					strokeOpacity : 1.0,
					strokeWeight : 2
				});

				flightPath.setMap(map);

			}

		}
	</script>

	<!-- Theme customizer Ends-->
	<!-- BEGIN VENDOR JS-->
	<script src="app-assets/vendors/js/core/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/popper.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/core/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/perfect-scrollbar.jquery.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/prism.min.js" type="text/javascript"></script>
	<script src="app-assets/vendors/js/jquery.matchHeight-min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/screenfull.min.js"
		type="text/javascript"></script>
	<script src="app-assets/vendors/js/pace/pace.min.js"
		type="text/javascript"></script>
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
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