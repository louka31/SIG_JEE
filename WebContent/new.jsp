<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.gcollecte.service.FormatService"%>
<%@page import="com.gcollecte.model.Format"%>
<%@page import="com.gcollecte.service.EchelleService"%>
<%@page import="com.gcollecte.model.Echelle"%>
<%@page import="com.gcollecte.service.StatusService"%>
<%@page import="com.gcollecte.model.Status"%>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    
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
					<div class="row">
						<div class="col-sm-12">
							<div class="content-header">Configuration</div>
							<section id="basic-form-layouts">
								<div id="addformat" style="display: none;">

									<div class="row">
										<div class="col-md-12">
											<div class="card">

												<div class="card-body">
													<div class="px-3">
														<div class="form-body">
														
															<h4 class="form-section">
															
																<i class="icon-plus"></i> Nouvelle Format
															</h4>
															<div class="row">
																<div class="col-md-6">

																	<div class="form-group row">
																		<label class="col-md-3 label-control" for="userinput1">Type
																		</label>
																		<div class="col-md-9">
																			<input type="text" name="type" id="type"
																				class="form-control border-primary"
																				placeholder="Type " required
																				pattern="[A-Za-z]{4,30}"
																				title="Le champs doit contenir au moins 4 lettres alphabétiques">
																		</div>
																	</div>


																</div>

															</div>




															<div class="form-actions right">
																<button id="reset-add-format" type="button"
																	class="btn btn-raised btn-warning mr-1">
																	<i class="ft-x"></i> Annuler
																</button>
																<button type="submit" class="btn btn-raised btn-primary"
																	id="submit-add-format">
																	<i class="fa fa-check-square-o"></i> Sauvgarder
																</button>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>


							<section id="basic-form-layouts">
								<div id="addechelle" style="display: none;">


									<div class="row">
										<div class="col-md-12">
											<div class="card">

												<div class="card-body">
													<div class="px-3">
														<div class="form-body">
															<h4 class="form-section">
																<i class="icon-plus"></i>Nouvelle Echelle
															</h4>
															<div class="row">
																<div class="col-md-6">

																	<div class="form-group row">
																		<label class="col-md-3 label-control" for="userinput1">Nom
																		</label>
																		<div class="col-md-9">
																			<input type="text" name="nom" id="nom"
																				class="form-control border-primary"
																				placeholder="Nom " required pattern="[A-Za-z]{4,30}"
																				title="Le champs doit contenir au moins 4 lettres alphabétiques">
																		</div>
																	</div>



																</div>

															</div>




															<div class="form-actions right">
																<button type="button" id="reset-add-echelle"
																	class="btn btn-raised btn-warning mr-1">
																	<i class="ft-x"></i> Annuler
																</button>
																<button type="submit" class="btn btn-raised btn-primary"
																	id="submit-add-echelle">
																	<i class="fa fa-check-square-o"></i> Sauvgarder
																</button>
															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>

							<section id="basic-form-layouts">
								<div id="addstatus" style="display: none;">


									<div class="row">
										<div class="col-md-12">
											<div class="card">

												<div class="card-body">
													<div class="px-3">
														<div class="form-body">
															<h4 class="form-section">
																<i class="icon-plus"></i>Nouvelle status
															</h4>
															<div class="row">
																<div class="col-md-6">

																	<div class="form-group row">
																		<label class="col-md-3 label-control" for="userinput1">Productive</label>
																		<div class="col-md-9">
																			<input type="text" name="productive" id="productive"
																				class="form-control border-primary"
																				placeholder="Productive " required
																				pattern="[A-Za-z]{4,30}"
																				title="Le champs doit contenir au moins 4 lettres alphabétiques">
																		</div>
																	</div>
																	


																</div>

															</div>




															<div class="form-actions right">
																<button type="button" id="reset-add-status"
																	class="btn btn-raised btn-warning mr-1">
																	<i class="ft-x"></i> Annuler
																</button>
																<button type="submit" id="submit-add-status"
																	class="btn btn-raised btn-primary">
																	<i class="fa fa-check-square-o"></i> Sauvgarder
																</button>
															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</section>








							<p class="content-sub-header"></p>
						</div>
					</div>












































					<section>





						<div class="row">
							<div class="col-md-4 col-12">
								<h4 class="ml-2 mt-2 text-bold-500">
									<i class="ft-file-text"></i> Format

									<button id="btaddformat" type="button"
										class="btn btn-raised btn-outline-primary mr-1">
										<i class="ft-plus"></i>
									</button>
								</h4>

								<%
									FormatService f = new FormatService();
									List<Format> F = f.getListOfFormat();
									for (Format j : F) {
								%>

								<div class="card" id="list-format">
									<div class="card-body pt-3">
										<div class="clearfix">
											<h5 class="text-bold-500 primary float-left"><%=j.getId()%></h5>
											<div class="actions float-right">
												<a data-toggle="modal" data-target="#MM<%=j.getId()%>"
													class="card-link"> <i class="ft-edit mr-1 info"></i></a> 
													<a
													data-toggle="modal" data-target="#myModal<%=j.getId()%>"
													class="card-link"> <i class="ft-trash-2 danger"></i></a>

											</div>
										</div>
										<span class="info"><%=j.getType()%></span>
									</div>
								</div>

								<%
								}
								%>
							</div>










							<div class="col-md-4 col-12">
								<h4 class="ml-2 mt-2 text-bold-500">
									<i class="ft-edit-3"></i>Echelle        

									<button type="button" id="btaddechelle"
										class="btn btn-raised btn-icon btn-outline-warning">
										<i class="ft-plus"></i>
									</button>
								</h4>
								<%
									EchelleService e = new EchelleService();
									List<Echelle> E = e.getListOfEchelle();
									for (Echelle j : E) {
								%>

								<div class="card" id="list-echelle">
									<div class="card-body pt-3">
										<div class="clearfix">
											<h5 class="text-bold-500 warning float-left"><%=j.getId()%></h5>
											<div class="actions float-right">
												<a data-toggle="modal" data-target="#MMM<%=j.getId()%>"
													class="card-link"> <i class="ft-edit mr-1 info"></i></a>
													
												 <a data-toggle="modal"
													data-target="#Modal<%=j.getId()%>" class="card-link"> <i
													class="ft-trash-2 danger"></i></a>
											</div>
										</div>
										<span class="warning"><%=j.getNom()%></span>
									</div>
								</div>
								<%
									}
								%>

							</div>









							<div class="col-md-4 col-12">
								<h4 class="ml-2 mt-2 text-bold-500">
									<i class="icon-chemistry"></i>Status

									<button id="btaddstatus" type="button"
										class="btn btn-raised btn-icon btn-outline-success">
										<i class="ft-plus"></i>
									</button>


								</h4>
								<%
									StatusService s = new StatusService();
									List<Status> S = s.getListOfStatus();
									for (Status k : S) {
								%>
								<div class="card" id="list-status">
									<div class="card-body pt-3">
										<div class="clearfix">
											<h5 class="text-bold-500 success float-left"><%=k.getId()%></h5>
											<div class="actions float-right">
												 <a data-toggle="modal"
													data-target="#MMMM<%=k.getId()%>" class="card-link"> <i class="ft-edit mr-1 info"></i></a>
													
													
													 <a data-toggle="modal"
													data-target="#M<%=k.getId()%>" class="card-link"> <i
													class="ft-trash-2 danger"></i></a>
											</div>
										</div>

										<span class="success">Status : <%=k.getProductive()%>

									</div>
								</div>

								<%
									}
								%>
							</div>

						</div>



					</section>
				</div>
			</div>



		</div>
	</div>




 <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>









	<%									

		List<Format> Ff = f.getListOfFormat();
		for (Format j : Ff) {
	%>

	<div id="myModal<%=j.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Supprimer Format</h4>
				</div>
				<div class="modal-body">
					<p>voulez-vouz vraiment supprimer cette Format ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="deletee('<%=j.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>


	<% FormatService fs = new FormatService();
		List<Format> K = fs.getListOfFormat();
		for (Format y: K) {
	%>

	<div id="MM<%=y.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modifier Format</h4>
				</div>
				<div class="modal-body">
					<input type="text" value="<%=y.getType()%>" name="typee" id="typee<%=y.getId() %>"
						class="form-control border-primary" placeholder="Type " required
						pattern="[A-Za-z]{4,30}"
						title="Le champs doit contenir au moins 4 lettres alphabétiques">
					<input name="id" type="hidden" value="<%=y.getId()%>">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="updatee('<%=y.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>







<% EchelleService fss = new EchelleService();
		List<Echelle> Kk = fss.getListOfEchelle();
		for (Echelle y: Kk) {
	%>

	<div id="MMM<%=y.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modifier Echelle</h4>
				</div>
				<div class="modal-body">
					<input type="text" value="<%=y.getNom()%>" name="nomm" id="nomm<%=y.getId() %>"
						class="form-control border-primary" placeholder="Nom " required
						pattern="[A-Za-z]{4,30}"
						title="Le champs doit contenir au moins 4 lettres alphabétiques">
					<input name="id" type="hidden" value="<%=y.getId()%>">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="updateee('<%=y.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>

<% StatusService SS= new StatusService();
		List<Status>LL= SS.getListOfStatus();
		for (Status y: LL) {
	%>

	<div id="MMMM<%=y.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modifier Status</h4>
				</div>
				<div class="modal-body">
					<input type="text" value="<%=y.getProductive()%>" name="productive" id="productive<%=y.getId() %>"
						class="form-control border-primary" placeholder="productive" required
						pattern="[A-Za-z]{4,30}"
						title="Le champs doit contenir au moins 4 lettres alphabétiques"> <br>
						
					<input name="id" type="hidden" value="<%=y.getId()%>">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="updateeee('<%=y.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>





	<%
		List<Echelle> EE = e.getListOfEchelle();
		for (Echelle j : EE) {
	%>

	<div id="Modal<%=j.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Supprimer Echelle</h4>
				</div>
				<div class="modal-body">
					<p>voulez-vouz vraiment supprimer cette Echelle ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="deleteee('<%=j.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>


	<%
		List<Status> SSS = s.getListOfStatus();
		for (Status j : SSS) {
	%>

	<div id="M<%=j.getId()%>" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Supprimer Status</h4>
				</div>
				<div class="modal-body">
					<p>voulez-vouz vraiment supprimer cette Status ?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<button type="button" onclick="deleteeee('<%=j.getId()%>')"
						class="btn btn-danger" data-dismiss="modal">Confirmer</button>
				</div>
			</div>

		</div>
	</div>
	<%
		}
	%>





	<script>
		$('#reset-add-echelle').on('click', function(event) {
			$('#nom').val("");

			$('#addechelle').hide();

		});
		$('#btaddechelle').on('click', function(event) {
			$('#addechelle').show();

		});

		$(document).ready(function() {
			$('#submit-add-echelle').on('click', function(event) {
				$('#addechelle').hide();
				$.ajax({
					url : 'EchelleServlet',
					data : {

						nom : $('#nom').val(),

						methode : 'add'
					},
					success : function(responseText) {
						$('#list-echelle').html(responseText);
						$('#nom').val("");

					}
				});
			});
		});

		$('#reset-add-status').on('click', function(event) {
			$('#productive').val("");

			$('#addstatus').hide();

		});
		$('#btaddstatus').on('click', function(event) {
			$('#addstatus').show();

		});
		$(document).ready(function() {
			$('#submit-add-status').on('click', function(event) {
				$('#addstatus').hide();
				$.ajax({
					url : 'StatusServlet',
					data : {

						productive : $('#productive').val(),
						methode : 'add'
					},
					success : function(responseText) {
						$('#list-status').html(responseText);
						$('#productive').val("");
					}
				});
			});
		});

		$('#reset-add-format').on('click', function(event) {
			$('#type').val("");

			$('#addformat').hide();

		});
		$('#btaddformat').on('click', function(event) {
			$('#addformat').show();

		});
		$(document).ready(function() {
			$('#submit-add-format').on('click', function(event) {
				$('#addformat').hide();
				$.ajax({
					url : 'FormatServlet',
					data : {

						type : $('#type').val(),

						methode : 'add'
					},
					success : function(responseText) {
						$('#list-format').html(responseText);

					}
				});
			});
		});

		function deletee(idd) {
			$.ajax({

				url : 'FormatServlet',
				data : {

					id : idd,

					methode : 'delete'
				},
				success : function(responseText) {
					$('#list-format').html(responseText);

				}
			});

		}
		function deleteee(idd) {
			$.ajax({

				url : 'EchelleServlet',
				data : {

					id : idd,

					methode : 'delete'
				},
				success : function(responseText) {
					$('#list-echelle').html(responseText);

				}
			});
		}

		function deleteeee(idd) {
			$.ajax({

				url : 'StatusServlet',
				data : {

					id : idd,

					methode : 'delete'
				},
				success : function(responseText) {
					$('#list-status').html(responseText);

				}
			});
		}

		function updatee(idd) {
			$.ajax({
				url : 'FormatServlet',
				data : {
					id : idd,
					type : $('#typee'+idd).val(),
					methode : 'update'
				},
				success : function(responseText) {
					$('#list-format').html(responseText);
					$('#typee').val("");
				}
			});
		}
		
		
		function updateee(idd) {
			$.ajax({
				url : 'EchelleServlet',
				data : {
					id : idd,
					nom : $('#nomm'+idd).val(),
					methode : 'update'
				},
				success : function(responseText) {
					$('#list-echelle').html(responseText);
					$('#nomm').val("");
				}
			});
		}
		
		
		function updateeee(idd) {
			$.ajax({
				url : 'StatusServlet',
				data : {
					id : idd,
					productive: $('#productive'+idd).val(),

					methode : 'update'
				},
				success : function(responseText) {
					$('#list-status').html(responseText);
					$('#productive').val("");

				}
			});
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
	<script src="app-assets/vendors/js/dragula.min.js"
		type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<!-- END APEX JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script src="app-assets/js/taskboard.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
</body>
<!-- END : Body-->
</html>