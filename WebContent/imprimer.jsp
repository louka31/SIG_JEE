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
											<table
												class="table display nowrap table-striped table-bordered scroll-horizontal-vertical" id="M" name="M">
												<thead>
													<tr>
														<th colspan="3"><center>Puits</center></th>

														<th colspan="4"><center>Cordonnees</center></th>
														<th colspan="3"><center>Permis</center></th>
														<th colspan="3"><center>Image</center></th>
														<th ><center>Status</center></th>
														<th><center>Echelle</center></th>
														<th colspan="4"><center>Fichier</center></th>



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

														<th>Numéro</th>
														<th>Nouveau nom</th>
														<th>Ancien nom</th>
														
														
														<th>Enregistrement</th>
														<th>Top</th>
														<th>Bottom</th>

														<th>productive</th>

														<th>Nom</th>
														
														<th>Numéro</th>
														<th>Enregistrement</th>
														<th>Top</th>
														<th>Bottom</th>


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

														<td><%=pps.getId()%>"></td>

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

														<td><%=ell.getNom()%>"></td>




														<%
														DocumentService z = new DocumentService();
														Document ff=z.getDocumentbyDocumentId((String.valueOf(p.getIdFichier())));
														%>

														<td><%=ff.getId()%>"></td>

														<td><%=ff.getNom()%></td>
														<td><%=ff.getTd_formation()%></td>

														<td><%=ff.getTd_m()%></td>



													</tr>

													<%
														}
													%>

												</tbody>
											</table>
																			
		<script type="text/javascript">
	document.getElementById("M").style.marginTop = "700px";

	  document.getElementById("M").style.transform 
      = 'rotate(90deg)'; 
  window.print();
</script>		

						
</body>
</html>