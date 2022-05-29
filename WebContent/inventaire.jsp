<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.service.DocumentService"%>
<%@page import="com.gcollecte.model.Document"%>
<%@page import="com.gcollecte.service.PuitsService"%>
<%@page import="com.gcollecte.model.Puits"%>
<%@page import="com.gcollecte.service.CordonneesService"%>
<%@page import="com.gcollecte.model.Cordonnees"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="com.gcollecte.service.PermisService"%>
<%@page import="com.gcollecte.model.Permis"%>
<%@page import="com.gcollecte.service.ImageService"%>
<%@page import="com.gcollecte.model.Image"%>
<%@page import="com.gcollecte.service.StatusService"%>
<%@page import="com.gcollecte.model.Status"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.service.EchelleService"%>
<%@page import="com.gcollecte.model.Echelle"%>
>

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
					<!-- Zero configuration table -->

					<section id="horizontal-vertical">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											Fichier inventaire </h4>
												<div class="btn-group mr-1 mb-1" style="margin-left: 80%;">
												
                <button type="button" class="btn btn-flat btn-danger btn-min-width dropdown-toggle" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">Generer</button>
                <div class="dropdown-menu">
                  <a href="imprimer.jsp" class="dropdown-item">Imprimer</a>
                  <a class="dropdown-item" id="downloadLink" onclick="exportF(this)">Exporter</a>
                  
                  <% if(user.getRole().equals("Administrateur") || user.getRole().equals("Indexateur"))
															{
															%>
                                                      <a class="dropdown-item" data-toggle="modal" data-target="#danger">Importer</a>
                         <%} %>           
                  
                  
              </div>
										
									</div>
									<div class="card-content">
										<div class="card-body card-dashboard table-responsive">
											<table
												class="table display nowrap table-striped table-bordered scroll-horizontal-vertical" id ="M" name="M">
												<thead>
													<tr>
														<th colspan="3"><center>Puits</center></th>

														<th colspan="4"><center>Cordonnees</center></th>
														<th colspan="3"><center>Permis</center></th>
														<th colspan="3"><center>Image</center></th>
														<th ><center>Status</center></th>
														<th><center>Echelle</center></th>
														<th colspan="5"><center>Document</center></th>



													</tr>
												</thead>
												<tbody>
													<tr>
														<th>Numéro</th>
														<th>Sigle</th>
														<th>Nom</th>

														
														<th>X(M)</th>
														<th>Y(M)</th>
														<th>X degre</th>
														<th>Y degre</th>

														<th>Numero</th>
														<th>Nouveau nom</th>
														<th>Ancien nom</th>
														
														
														<th>Enregistrement</th>
														<th>Top</th>
														<th>Bottom</th>

														<th>Productivite</th>

														<th>Valeur</th>
														
														<th>Numéro document</th>
														<th>Sigle</th>
														<th>Nom</th>
														<th>TD_m</th>
														<th>TD_formation</th>


													</tr>
													<%
													PuitsService pp = new PuitsService();
														List<Puits> Puits = pp.getListOfPuits();
														for (Puits p : Puits) {
													%>
													<tr>


														<td><%=p.getNum()%></td>
									<td><%=p.getSigle()%></td>
														
														<td><%=p.getNom()%></td>




														<%
														CordonneesService css = new CordonneesService();

														Cordonnees c=css.getCordonneesById(String.valueOf(p.getIdCordonnees()));
														%>

														<td><%=c.getX_m()%></td>

														<td><%=c.getY_m()%></td>
														<td><%=c.getX_deg()%></td>
														<td><%=c.getY_deg()%></td>




														
														<%
															PermisService pppp = new PermisService();
														Permis pps=pppp.getPermisbyPermisId(String.valueOf(p.getIdPermis()));

															
														%>

														<td><%=pps.getId()%></td>

														<td><%=pps.getAncien_nom()%></td>
														<td><%=pps.getNouveau_nom()%></td>




														<%
															ImageService psp = new ImageService();
														Image img=psp.getImagebyImageId(String.valueOf(p.getIdImage()));
														%>



														<td><%=img.getEnregistrement()%></td>
														<td><%=img.getTop()%></td>

														<td><%=img.getBottom()%></td>



														<%
															StatusService pspp = new StatusService();
															Status sss=pspp.getStatusbyStatusId(String.valueOf(p.getIdStatus()));
														%>




														<td><%=sss.getProductive()%></td>


														<%
															EchelleService y = new EchelleService();
														Echelle ell=y.getEchellebyEchelleId(String.valueOf(p.getIdEchelle()));
														%>

														<td><%=ell.getNom()%></td>




														<%
															DocumentService z = new DocumentService();
														Document ff=z.getDocumentbyDocumentId(String.valueOf(p.getIdFichier()));
														%>

														<td><%=ff.getNum_doc()%></td>

														<td><%=ff.getSigle()%></td>
														<td><%=ff.getNom()%></td>
														<td><%=ff.getTd_m()%></td>

														<td><%=ff.getTd_formation()%></td>



													</tr>

													<%
														}
													%>

												</tbody>
											</table>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>


				</div>
			</div>
			<!-- END : End Main Content-->

			<!-- BEGIN : Footer-->
			 <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>

		</div>
	</div>
 <div class="modal fade text-left" id="danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header bg-danger white">
                          <h4 class="modal-title" id="myModalLabel10">Importer un fichier</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                       <label for="avatar">Choisir un fichier</label>

 <form method="post" action="UploadFile" enctype="multipart/form-data">
            Fichiers sélectionnés : 
            <input type="file" name="file"  /> <br/>
            
            <div id="list"></div>   
     
                        <div class="modal-footer">
                          <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Fermer</button>
                          <input type="submit" value="Confirmer"  class="btn btn-outline-danger">   </form>
                        </div>
                      </div>
                    </div>
                  </div>
	<!-- Theme customizer Ends-->
	<!-- BEGIN VENDOR JS-->
	
     <script>
     function exportF(elem) {
   	  var table = document.getElementById("M");
   	  var html = table.outerHTML;
   	  var url = 'data:application/vnd.ms-excel,' + escape(html); // Set your html table into url 
   	  elem.setAttribute("href", url);
   	  elem.setAttribute("download", "export.xls"); // Choose the file name
   	  return false;
   	}
     
     </script>
     <script>
function imprimer(divName) {
      var printContents = document.getElementById("M").innerHTML;    
   var originalContents = document.body.innerHTML;      
   document.body.innerHTML = printContents;     
   window.print();     
   document.body.innerHTML = originalContents;
   }
</script>

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
	<script src="app-assets/vendors/js/datatable/datatables.min.js"
		type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<!-- END APEX JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script src="app-assets/js/data-tables/datatable-basic.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
</body>
<!-- END : Body-->
</html>