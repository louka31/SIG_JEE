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
  <body >
   
  
   
  
  
  
  
  
 



 
  
  
    

 
 
   
          					<div id="map" >
<div id="popup"></div>
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
         maxZoom: 22,
         zoom: 5.5
     })
 });
 
 
 
 map.addControl(new ol.control.OverviewMap()); 
 map.addControl(new ol.control.MousePosition({    coordinateFormat: ol.coordinate.createStringXY(4),    projection: "EPSG:4326" }));

 map.addControl(new ol.control.ZoomToExtent());
 map.addControl(new ol.control.ZoomSlider());
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
 
 
 var iconStyle = new ol.style.Style({
     image: new ol.style.Icon(({
       anchor: [0.5, 46],
       anchorXUnits: 'fraction',
       anchorYUnits: 'pixels',
       opacity: 0.75,
       src: 'app-assets/img/marker.png'
     })),
     
         text: new ol.style.Text({
             text: " <%=ii.getId() %>",
             offsetY: -47,
             fill: new ol.style.Fill({
                 color: '#04147A'
             })
         })
    
     
   });
layer.setStyle(iconStyle);


 map.addLayer(layer);
<% }%>
 

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