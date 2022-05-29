<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.gcollecte.service.FormatService"%>

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
<%@page import="com.gcollecte.model.Projet"%>

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
          <div class="content-wrapper"><!-- Basic tabs start -->
<section id="basic-tabs-components">
 
<section id="tabs-with-icons">
 
  <div class="row match-height">
    <div class="col-xl-12 col-lg-12">
      <div class="card">
      
        <div class="card-content">
          <div class="card-body">
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" id="baseIcon-tab1" data-toggle="tab" aria-controls="tabIcon1" href="#tabIcon1"
                  aria-expanded="true"><i class="fa fa-gavel"></i> Puits</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="baseIcon-tab2" data-toggle="tab" aria-controls="tabIcon2" href="#tabIcon2"
                  aria-expanded="false"><i class="fa fa-gavel"></i>Permis</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="baseIcon-tab3" data-toggle="tab" aria-controls="tabIcon3" href="#tabIcon3"
                  aria-expanded="false"><i class="icon-picture"></i>Image</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" id="baseIcon-tab4" data-toggle="tab" aria-controls="tabIcon4" href="#tabIcon4"
                  aria-expanded="false"><i class="icon-note"></i>Document</a>
              </li>
            </ul>
            
            
            
            
            
            
            
            <div class="tab-content px-1 pt-1">
              <div role="tabpanel" class="tab-pane active" id="tabIcon1" aria-expanded="true" aria-labelledby="baseIcon-tab1">
               <div class="content-wrapper">
				
					<section id="extended">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											Liste Des Puits<a style="margin-left: 70%;"
												href="addpuits.jsp"><button type="button"
													class="btn btn-raised btn-success btn-min-width mr-1 mb-1">
													<i class="fa fa-check"></i> Nouvelle Puits
												</button></a>
										</h4>
									</div>
									<div class="card-content">
										<div class="card-body table-responsive">
											<table class="table text-center">
												<thead>
													<tr>
														<th>#</th>
														<th></th>
														<th>Numéro</th>
																												<th>Nom</th>
														
														<th>Sigle</th>
														<th>Nom Document</th>
														<th> Image</th>
																												<th>X_m</th>
																												<th>Y_m</th>
														
																												<th>X_deg</th>
																												<th>Y_deg</th>
														
														<th>Nom Permis</th>
														<th> Status</th>
														<th> Echelle</th>

														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<%
														PuitsService ps = new PuitsService();
														//  User user=(User)request.getSession().getAttribute("user");
														List<Puits> Puits = ps.getListOfPuits();
														int i = 1;
														for (Puits p : Puits) {
													%>
													<tr>
														<td><%=i%></td>
														<td>
															<div class="custom-control custom-checkbox m-0">
																<input type="checkbox" class="custom-control-input"
																	id="<%=p.getId()%>"> <label
																	class="custom-control-label" for="item1"></label>
															</div>
														</td>

														<td><%=p.getNum()%></td>
														<td><%=p.getNom()%></td>

														<td><%=p.getSigle()%></td>
														
														
														
														<% DocumentService fs= new DocumentService () ; %>
														<td><%= fs.getDocumentbyDocumentId(p.getIdFichier()+"").getNom() %></td>

<% ImageService is= new ImageService () ; %>
														<td><%= is.getImagebyImageId(p.getIdImage()+"").getEnregistrement() %></td>






<% CordonneesService cs= new CordonneesService () ; %>
														<td><%= cs.getCordonneesById(p.getIdCordonnees()+"").getX_m() %> </td>
																												<td><%= cs.getCordonneesById(p.getIdCordonnees()+"").getY_m() %> </td>
																												<td><%= cs.getCordonneesById(p.getIdCordonnees()+"").getX_deg()%> </td>
																												<td><%= cs.getCordonneesById(p.getIdCordonnees()+"").getY_deg() %> </td>
														
<% PermisService pss= new PermisService () ; %>
														<td><%= pss.getPermisbyPermisId(p.getIdPermis()+"").getNouveau_nom() %>  </td>		
														
														<% StatusService ss= new StatusService () ; %>
														<td><%= ss.getStatusbyStatusId(p.getIdStatus()+"").getProductive() %> </td>													
														
														
															<% EchelleService ee= new EchelleService () ; %>
														<td><%= ee.getEchellebyEchelleId(p.getIdEchelle()+"").getNom() %> </td>			
														
														
														<td><a href="carte.jsp?id=<%=p.getId()%>"
															class="info p-0" data-original-title="" title=""> <i
																class="ft-eye font-medium-3 mr-2"></i>
														</a> <a href="modpuits.jsp?id=<%=p.getId()%>"
															class="success p-0" data-original-title="" title="">
																<i class="ft-edit-2 font-medium-3 mr-2"></i>
														</a> <a data-toggle="modal"
															data-target="#danger<%=p.getId()%>" class="danger p-0"
															data-original-title="" title=""> <i
																class="ft-x font-medium-3 mr-2"></i>
														</a></td>

													</tr>

													<%
														i++;
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

					<!--Extended Table Ends-->
					<!--Shopping cart starts-->

				</div>
              </div>
              
              
              
              
              <div class="tab-pane" id="tabIcon2" aria-labelledby="baseIcon-tab2">
               <div class="content-wrapper">
					
					<section id="extended">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											Liste Des Permis <a style="margin-left: 70%;"
												href="addpermis.jsp"><button type="button"
													class="btn btn-raised btn-success btn-min-width mr-1 mb-1">
													<i class="fa fa-check"></i> Nouvelle Permis
												</button></a>
										</h4>
									</div>
									<div class="card-content">
										<div class="card-body table-responsive">
											<table class="table text-center">
												<thead>
													<tr>
														<th>#</th>
														<th></th>
														<th>Nouveau nom</th>
														<th>Ancien nom</th>

														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<%
													PermisService pss = new PermisService();
														List<Permis> c = pss.getListOfPermis();
														int y =1;
														for (Permis p :c) {
													%>
													<tr>
														<td><%=y %></td>
														<td>
															<div class="custom-control custom-checkbox m-0">
																<input type="checkbox" class="custom-control-input"
																	id="<%=p.getId()%>"> <label
																	class="custom-control-label" for="item1"></label>
															</div>
														</td>

														
														<td><%=p.getNouveau_nom()%></td>
														<td><%=p.getAncien_nom()%></td>
															
													
													

														<td><a href="modpermis.jsp?id=<%=p.getId()%>"
															class="success p-0" data-original-title="" title="">
																<i class="ft-edit-2 font-medium-3 mr-2"></i>
														</a> <a data-toggle="modal"
															data-target="#danger<%=p.getId()%>" class="danger p-0"
															data-original-title="" title=""> <i
																class="ft-x font-medium-3 mr-2"></i>
														</a></td>

													</tr>

													<%
													y++;	}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!--Extended Table Ends-->
					<!--Shopping cart starts-->

				</div>
              </div>
              
              
              
              
              
              
              <div class="tab-pane" id="tabIcon3" aria-labelledby="baseIcon-tab3">
              <div class="content-wrapper">
					
					<section id="extended">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">
											Liste Des Images <a style="margin-left: 70%;"
												href="addimage.jsp"><button type="button"
													class="btn btn-raised btn-success btn-min-width mr-1 mb-1">
													<i class="fa fa-check"></i> Nouvelle Image
												</button></a>
										</h4>
									</div>
									<div class="card-content">
										<div class="card-body table-responsive">
											<table class="table text-center">
												<thead>
													<tr>
														<th>#</th>
														<th></th>
														<th>Enregistrement</th>
														<th>Top</th>
														<th>Bottom</th>

														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<%
														ImageService im = new ImageService();
														//  User user=(User)request.getSession().getAttribute("user");
														List<Image> Image = im.getListOfImage();
														int r=1;
														for (Image p : Image) {
													%>
													<tr>
														<td><%=r %></td>
														<td>
															<div class="custom-control custom-checkbox m-0">
																<input type="checkbox" class="custom-control-input"
																	id="<%=p.getId()%>"> <label
																	class="custom-control-label" for="item1"></label>
															</div>
														</td>

														<td><%=p.getEnregistrement()%></td>
														<td><%=p.getTop()%></td>

														<td><%=p.getBottom()%></td>

														<td> <a href="modimage.jsp?id=<%=p.getId()%>"
															class="success p-0" data-original-title="" title="">
																<i class="ft-edit-2 font-medium-3 mr-2"></i>
														</a> <a data-toggle="modal"
															data-target="#danger<%=p.getId()%>" class="danger p-0"
															data-original-title="" title=""> <i
																class="ft-x font-medium-3 mr-2"></i>
														</a></td>

													</tr>

													<%
													r++;	}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!--Extended Table Ends-->
					<!--Shopping cart starts-->

				</div>
              </div>
              
              
              
               <div class="tab-pane" id="tabIcon4" aria-labelledby="baseIcon-tab4">
            <div class="content-wrapper">
				
					<section id="extended">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header">
											<h4 class="card-title">
											Liste Des Documents <a style="margin-left: 70%;"
												href="addDocument.jsp"><button type="button"
													class="btn btn-raised btn-success btn-min-width mr-1 mb-1">
													<i class="fa fa-check"></i> Nouveau document
												</button></a>
										</h4>
									</div>
									<div class="card-content">
										<div class="card-body table-responsive">
											<table class="table text-center">
												<thead>
													<tr>
														<th>#</th>
														<th></th>
														<th>Numéro document</th>
														<th>Sigle</th>
														<th>Nom</th>
														<th>Td_m</th>
														<th>Td_formation</th>
																												<th>Format</th>
														
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<%
														DocumentService fis = new DocumentService();
														//  User user=(User)request.getSession().getAttribute("user");
														List<Document> Document = fis.getListOfDocument();
														int z=1;
														for (Document p : Document) {
													%>
													<tr>
														<td><%=z %></td>
														<td>
															<div class="custom-control custom-checkbox m-0">
																<input type="checkbox" class="custom-control-input"
																	id="<%=p.getId()%>"> <label
																	class="custom-control-label" for="item1"></label>
															</div>
														</td>

														<td><%=p.getNum_doc()%></td>
														<td><%=p.getSigle()%></td>

														<td><%=p.getNom()%></td>
	<td><%=p.getTd_m()%></td>
														<td><%=p.getTd_formation()%></td>
												<% 		FormatService O = new FormatService();
												
												%>
														<td><%=O.getFormatbyFormatId(p.getIdformat()+"").getType()%></td>

														<td> <a href="ModDocument.jsp?id=<%=p.getId()%>"
															class="success p-0" data-original-title="" title="">
																<i class="ft-edit-2 font-medium-3 mr-2"></i>
														</a> <a data-toggle="modal"
															data-target="#danger<%=p.getId()%>" class="danger p-0"
															data-original-title="" title=""> <i
																class="ft-x font-medium-3 mr-2"></i>
														</a></td>

													</tr>

													<%
														z++ ;}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!--Extended Table Ends-->
					<!--Shopping cart starts-->

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
  </div>


          </div>

        <!-- END : End Main Content-->

         <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>
	<%
		PuitsService psp = new PuitsService();

		List<Puits> cc = ps.getListOfPuits();
		int j = 1;
		for (Puits p : cc) {
	%>
	<div class="modal fade text-left" id="danger<%=p.getId()%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger white">
					<h4 class="modal-title" id="myModalLabel10">Supprimer
						Puits</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p>voulez-vouz vriment supprimer cette Puits ?</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn grey btn-outline-secondary"
						data-dismiss="modal">Fermer</button>
					<a href="DeletePuits?id=<%=p.getId()%>"><button type="button"
							class="btn btn-outline-danger">Confirmer</button></a>
				</div>
			</div>
		</div>
	</div>

	<%
		}
	%>
	
	
	
	<%
	PermisService pps = new PermisService();

		List<Permis> ss = pps.getListOfPermis();
		for (Permis p : ss) {
	%>
	<div class="modal fade text-left" id="danger<%=p.getId()%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger white">
					<h4 class="modal-title" id="myModalLabel10">Supprimer
						Compagne</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p>voulez-vouz vriment supprimer cette compagne ?</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn grey btn-outline-secondary"
						data-dismiss="modal">Fermer</button>
					<a href="DeletePermis?id=<%=p.getId()%>"><button type="button"
							class="btn btn-outline-danger">Confirmer</button></a>
				</div>
			</div>
		</div>
	</div>

	<%
		}
	%>
	
	
	
	<%
		ImageService iis = new ImageService();

		List<Image> is = iis.getListOfImage();
		for (Image p : is) {
	%>
	<div class="modal fade text-left" id="danger<%=p.getId()%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger white">
					<h4 class="modal-title" id="myModalLabel10">Supprimer
						Image</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p>voulez-vouz vriment supprimer cette Image ?</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn grey btn-outline-secondary"
						data-dismiss="modal">Fermer</button>
					<a href="DeleteImage?id=<%=p.getId()%>"><button type="button"
							class="btn btn-outline-danger">Confirmer</button></a>
				</div>
			</div>
		</div>
	</div>

	<%
		}
	%>
	
	
	
	<%
	
	List<Document> D = fis.getListOfDocument();
	for (Document p : D) {
	%>
	<div class="modal fade text-left" id="danger<%=p.getId()%>"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger white">
					<h4 class="modal-title" id="myModalLabel10">Supprimer
						Document</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p>voulez-vouz vriment supprimer ce Document ?</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn grey btn-outline-secondary"
						data-dismiss="modal">Fermer</button>
					<a href="DeleteDocument?id=<%=p.getId()%>"><button type="button"
							class="btn btn-outline-danger">Confirmer</button></a>
				</div>
			</div>
		</div>
	</div>

	<%
		}
	%>
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