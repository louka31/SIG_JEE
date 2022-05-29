<%@page import="com.gcollecte.service.LoginService"%>
<%@page import="com.gcollecte.model.User"%>
<%@page import="java.util.List"%>


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
          <div class="content-wrapper"><!--Extended Table starts-->
<div class="row">
  <div class="col-12">
    <div class="content-header">Liste Des utilisateurs</div>
    <p class="content-sub-header">ce tableau contient liste des utilisateurs de système</p>
  </div>
</div>
<section id="extended">
  <div class="row">
    <div class="col-sm-12">
      <div class="card">
        <div class="card-header">
          <h4 class="card-title">Liste Des Utlisateurs <a style="margin-left:70%;"href="adduser.jsp"><button type="button" class="btn btn-raised btn-success btn-min-width mr-1 mb-1"><i class="fa fa-check"></i>
                   Nouveaux Utilisateur</button></a></h4>
        </div>
        <div class="card-content">
          <div class="card-body table-responsive">
            <table class="table text-center">
              <thead>
                <tr>
                  <th>#</th>
                  <th></th>
                  <th>Nom</th>
                      <th>Prénom</th>
                      <th>Nom D'Utilisateur</th>
                       <th>Mot De Passe</th>
                       <th>Genre</th>
                      <th>Role</th>
                      <th>Email</th>
                       <th>Telephone</th> 
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
			   <% LoginService ps=new LoginService();
			 //  User user=(User)request.getSession().getAttribute("user");
               List<User> projet=ps.getListOfUsers();
              int i=1;
               for(User p:projet){%>
                <tr>
                   <td><%=i%>   </td>
                  <td>
                    <div class="custom-control custom-checkbox m-0">
                      <input type="checkbox" class="custom-control-input" id="<%=p.getId()%>">
                      <label class="custom-control-label" for="item1"></label>
                    </div>
                  </td>
                
                                            <td><%=p.getLast_name()%></td>
                                                                  <td><%=p.getFirst_name()%></td>
                                            
                                            <td><%=p.getLogin()%></td>
                                            <td><%=p.getPassword()%></td>
                                           <td><%=p.getGenre()%></td>
                                            <td><%=p.getRole()%></td>
                                            <td><%=p.getEmail()%></td>
                                            <td><%=p.getTelephone()%></td>
                  <td>
                    <a href="plan.jsp?id=<%=p.getId()%>" class="info p-0" data-original-title="" title="">
                      <i class="ft-eye font-medium-3 mr-2"></i>
                    </a>
                    <a href="moduser.jsp?id=<%=p.getId()%>" class="success p-0" data-original-title="" title="">
                      <i class="ft-edit-2 font-medium-3 mr-2"></i>
                    </a>
                    <a  data-toggle="modal" data-target="#danger<%=p.getId()%>" class="danger p-0" data-original-title="" title="">
                      <i class="ft-x font-medium-3 mr-2"></i>
                    </a>
                  </td>
                 
                </tr>
                 
               <% i++; } %>  </tbody>
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
        <!-- END : End Main Content-->

        <!-- BEGIN : Footer-->
        <footer class="footer footer-static footer-light">
          <p class="clearfix text-muted text-sm-center px-2"><span>Copyright  &copy; 2020 <a href="http://yebni.comt" id="pixinventLink" target="_blank" class="text-bold-800 primary darken-2">YEBNI </a>, All rights reserved. </span></p>
        </footer>
        <!-- End : Footer-->

      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
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


    <!-- START Notification Sidebar-->
   
    <!-- END Notification Sidebar-->
    <!-- Theme customizer Starts-->
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