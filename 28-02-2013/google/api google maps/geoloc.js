/* Déclaration de la map */
   var map = new GMap2(document.getElementById("map"),{mapTypes: [G_HYBRID_MAP]});
   /* Attribution des paramètres par défaut de la Google Map */
   map.setUIToDefault();
   /* Désactivation du zoom  + / - généré par la molette de la souris */
   map.disableScrollWheelZoom();

   /* Création d'un objet  GLatLngBounds qui permettra de recentrer la carte en fonction
   des points obtenus */
   var bounds = new GLatLngBounds();

   /* Déclaration des variables utilisées dans l'application */
   var markers = [];
   var htmlSidebar = [];
   var myDiv = document.getElementById('mySidebar');
   var i = 0;
   var htmls = [];
   var myListing = '';

   /* Création de la map centrée sur Paris */
   map.setCenter(new GLatLng(48.8566667, 2.3509871), 13);

   /* Déclaration de l'objet GClientGeocoder utilisé dans l'application */
   var geocoder = new GClientGeocoder();

   /* Déclaration de la fonction chargée de communiquer avec le geocoder de Google */
   function useGeoCoder(adr){
     /* On vide le cache de l'objet geocoder */
     geocoder.reset();
     /* On efface tous les markers présents sur la map */
     map.clearOverlays();
     /* On réinitialise nos variables afin que l'application ne prenne en compte
     uniquement les éléments de la recherche en cours*/
     var markers = new Array();
     var htmlSidebar = new Array();
     myListing = '';

     /* Si une adresse a été saisie (champ de recherche non vide) */
     if(adr != ''){
       var i = 0;
       /* Appel envoyé au geocoder de Google */
       geocoder.getLocations(adr,function(ADRESSE){
         /* Si l'adresse n'a pu être géolocalisée */
         if (!ADRESSE) {
           alert(ADRESSE+" n'existe pas ou n'a pu être géolocalisée ...");
         }else {
           /* Le service web de géocodage de Google a renvoyé au moins un résultat */
           bounds = new GLatLngBounds();
           if(ADRESSE.Placemark){
             /* Le service web de géocodage de Google a renvoyé au moins un point  */
             /* nombrePlacemarks représente le nombre de points renvoyés */
             var nombrePlacemarks = ADRESSE.Placemark.length;
             var iPlacemark;
             var placemark;
             /* Tant que l'on a des résultats, on les traite */
             for (iPlacemark = 0 ; iPlacemark < nombrePlacemarks ; iPlacemark ++){
              placemark = ADRESSE.Placemark[iPlacemark];
              createMarker(placemark);
             }

           /* Préparation des éléments HTML pour l'affichage des résultats */
           myDiv.style.width = '225px';
           document.getElementById('resultLibel').style.display = 'block';
           document.getElementById('apply').style.width = '635px';
           myDiv.innerHTML = myListing;
           /* Rechargement de la map */
           reloadMap();
         }else
           alert('Aucun resultat trouve pour cette recherche ! ...');
       }});
     }
   }

   /* Déclaration de la fonction chargée d'ajouter les markers sur la map */
   function createMarker( placemark){
     /* Récupération des coordonnées du point */
     var coord = placemark.Point.coordinates;
     markers[i] = new GMarker(new GLatLng(coord[1], coord[0]));
     /* Récupération du contenu de l'infobulle (infowindow) */
     htmls[i] = getHtml(placemark);
     /* Ajout de l'écouteur d'événement sur le marker */
     clickMarker(i);
     /* Ajout du marker sur la map */
     map.addOverlay(markers[i]);
     /* Création du listing des résultats (colonne de droite) */
     myListing += '<a href="javascript:openMarker('+i+')" class="linkSidebar">';
     myListing += htmlSidebar[i];
     myListing += '</a>';
     /* Extension des limites de la carte en ajoutant le nouveau point obtenu */
     bounds.extend(new GLatLng(coord[1], coord[0]));
     i++;
   }	

   /* Déclaration de la fonction chargée d'ouvrir l'infobulle après un click
   sur un item du listing des résultats ou sur un marker */
   function openMarker(m){
     markers[m].openInfoWindowHtml(htmls[m]);
   }

   /* Déclaration de la fonction "écouteur d'événement" sur les markers */
   function clickMarker(a){
     GEvent.addListener(markers[a], "click", function() {
       openMarker(a);
     });
   }

   /* Déclaration de la fonction chargée de récupérer le contenu de l'infobulle
   pour le point concerné */
   function getHtml(placemark){
     /* Implémentation du contenu du listing de résultats */ 
     htmlSidebar[i] = placemark.address;
     var html  = '<p style="width: 200px; font-size: 11px; font-family: verdana;">';
     html += placemark.address;
     html += '<br />';
     html += placemark.Point.coordinates[1] + ' - '+ placemark.Point.coordinates[0];
     html += '<br />';
     /* Si l'élément de réponse contient les informations liées à l'adresse
     postale du point, on les récupère */
     if (placemark.AddressDetails.Country.AdministrativeArea){
       var administrativeArea = placemark.AddressDetails.Country.AdministrativeArea;
       html += administrativeArea.AdministrativeAreaName;
       if (administrativeArea.SubAdministrativeArea){
         var subAdministrativeArea = administrativeArea.SubAdministrativeArea;
         html += '';
         html += subAdministrativeArea.SubAdministrativeAreaName;
         if (subAdministrativeArea.Locality){
           var locality = subAdministrativeArea.Locality;
           html += '<br />';
           html += locality.LocalityName;
           if (locality.DependentLocality){
             html += '<br />';
             html += locality.DependentLocality.DependentLocalityName;
           }
         }
       }
     }
     html += '</p>';
     return html;
   }

   /* Déclaration de la fonction chargée de réafficher la map */
   function reloadMap(){
     /* Récupération du zoom optimum pour contenir tous les points */
     var newZoom = map.getBoundsZoomLevel(bounds);
     /* Définition d'un zoom maximum, ici 13 */
     if(newZoom >= 14)
       newZoom = 13;
     /* Récupération du nouveau centre de la map */
     var newCentre = bounds.getCenter();

     /* Affichage de la map */
     map.setCenter(newCentre, newZoom);
   }

   /* Déclaration de la fonction qui appelle la fonction useGeoCoder
   après avoir enfoncé la touche "entrée" */
   function enterPressed(evn) {
     if (window.event && window.event.keyCode == 13)
       useGeoCoder(document.getElementById('addr').value);
     else if (evn && evn.keyCode == 13)
       useGeoCoder(document.getElementById('addr').value);
   }

   document.onkeypress = enterPressed;