<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.gcollecte.service.LoginService"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.gcollecte.model.Projet"%>
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
				<button type="button" data-toggle="collapse" class="navbar-toggle d-lg-none float-left"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><span class="d-lg-none navbar-right navbar-collapse-toggle"><a aria-controls="navbarSupportedContent" href="javascript:;" class="open-navbar-container black"><i class="ft-more-vertical"></i></a></span>
            <form role="search" class="navbar-form navbar-right mt-1" action="users1.jsp" >
              <div class="position-relative has-icon-right">
                <input name="o" type="text" placeholder="Search" class="form-control round"/>
                <div class="form-control-position"><i class="ft-search"></i></div>
              </div>
            </form>	
					
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
				<div class="content-wrapper" align="center">
					<!--Statistics cards Starts-->





					<div class="col-xl-6 col-lg-12" >
						<div class="card">
							<div class="card-header">
								<h4 class="card-title mb-0">Liste utilisateurs</h4>
							</div>
							<div class="card-content">
								<div class="card-body">
							  <% LoginService ps=new LoginService();
								if(request.getParameter("o")!=null){

               List<User> projet=ps.getListOfUsers();
              
               for(User p:projet){
            	   if((p.getFirst_name().contains(request.getParameter("o")))||(p.getLast_name().contains(request.getParameter("o")))||(p.getRole().contains(request.getParameter("o"))))
               

                   {
                   %>
							
									<div class="media mb-1">
									         										<a> <img alt="96x96"
									         											class="media-object d-flex mr-3 bg-primary height-50 rounded-circle"
									         											src="app-assets/img/portrait/small/avatar-s-12.png">
									         										</a>
									         										<div class="media-body">
									         											<h4 class="font-medium-1 mt-1 mb-0"><%=p.getFirst_name()+" "+p.getLast_name()%></h4>
									         											<p class="text-muted font-small-3"><%=p.getRole() %></p>
									         										</div>
									         										<div class="mt-1">
									         											<div
									         												class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
									         												 <a href="moduser.jsp?id=<%=p.getId()%>" class="success p-0" data-original-title="" title="">
									                               <i class="ft-edit-2 font-medium-3 mr-2"></i>
									                             </a>
									                              <a  data-toggle="modal" data-target="#danger<%=p.getId()%>" class="danger p-0" data-original-title="" title="">
									                               <i class="ft-x font-medium-3 mr-2"></i>
									                             </a>
									         											</div>

									         										</div>
									         										
									         									</div>
									                   <% }}} else {
									                	   List<User> projet=ps.getListOfUsers();
									                        for(User p:projet){
									                        

									                            %>
									         							
									         									<div class="media mb-1">
									         										<a> <img alt="96x96"
									         											class="media-object d-flex mr-3 bg-primary height-50 rounded-circle"
									         											src="app-assets/img/portrait/small/avatar-s-12.png">
									         										</a>
									         										<div class="media-body">
									         											<h4 class="font-medium-1 mt-1 mb-0"><%=p.getFirst_name()+" "+p.getLast_name()%></h4>
									         											<p class="text-muted font-small-3"><%=p.getRole() %></p>
									         										</div>
									         										<div class="mt-1">
									         											<div
									         												class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
									         												 <a href="moduser.jsp?id=<%=p.getId()%>" class="success p-0" data-original-title="" title="">
									                               <i class="ft-edit-2 font-medium-3 mr-2"></i>
									                             </a>
									                              <a  data-toggle="modal" data-target="#danger<%=p.getId()%>" class="danger p-0" data-original-title="" title="">
									                               <i class="ft-x font-medium-3 mr-2"></i>
									                             </a>
									         											</div>

									         										</div>
									         										
									         									</div>
									                	<% }} %>
								
								
								
								
									<div class="action-buttons mt-2 text-center">
										<a
											class="btn btn-raised gradient-blackberry py-2 px-4 white mr-2" href="adduser.jsp">Ajouter nouveau utilisateur</a>
									<a
											class="btn btn-raised gradient-blackberry py-2 px-4 white mr-2" href="users.jsp">Plus de détails</a>
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

		</div>
	</div>
	<% LoginService psp=new LoginService();
			   
               List<User> projeti=ps.getListOfUsers();
              int j=1;
               for(User p:projeti){%>
 <div class="modal fade text-left" id="danger<%=p.getId() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel10"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header bg-danger white">
                          <h4 class="modal-title" id="myModalLabel10">Supprimer Utilisateur</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                        
                          <p>voulez-vouz vriment supprimer cet Utilisateur ?</p>
                          
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">Fermer</button>
                          <a href="DeleteUser?id=<%=p.getId() %>"><button type="button" class="btn btn-outline-danger">Confirmer</button></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <% } %>
	
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
	<script src="app-assets/vendors/js/chartist.min.js"
		type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN APEX JS-->
	<script src="app-assets/js/app-sidebar.js" type="text/javascript"></script>
	<script src="app-assets/js/notification-sidebar.js"
		type="text/javascript"></script>
	<script src="app-assets/js/customizer.js" type="text/javascript"></script>
	<!-- END APEX JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script src="app-assets/js/dashboard1.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
</body>
<!-- END : Body-->
</html>