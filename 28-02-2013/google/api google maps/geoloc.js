/* D�claration de la map */
   var map = new GMap2(document.getElementById("map"),{mapTypes: [G_HYBRID_MAP]});
   /* Attribution des param�tres par d�faut de la Google Map */
   map.setUIToDefault();
   /* D�sactivation du zoom  + / - g�n�r� par la molette de la souris */
   map.disableScrollWheelZoom();

   /* Cr�ation d'un objet  GLatLngBounds qui permettra de recentrer la carte en fonction
   des points obtenus */
   var bounds = new GLatLngBounds();

   /* D�claration des variables utilis�es dans l'application */
   var markers = [];
   var htmlSidebar = [];
   var myDiv = document.getElementById('mySidebar');
   var i = 0;
   var htmls = [];
   var myListing = '';

   /* Cr�ation de la map centr�e sur Paris */
   map.setCenter(new GLatLng(48.8566667, 2.3509871), 13);

   /* D�claration de l'objet GClientGeocoder utilis� dans l'application */
   var geocoder = new GClientGeocoder();

   /* D�claration de la fonction charg�e de communiquer avec le geocoder de Google */
   function useGeoCoder(adr){
     /* On vide le cache de l'objet geocoder */
     geocoder.reset();
     /* On efface tous les markers pr�sents sur la map */
     map.clearOverlays();
     /* On r�initialise nos variables afin que l'application ne prenne en compte
     uniquement les �l�ments de la recherche en cours*/
     var markers = new Array();
     var htmlSidebar = new Array();
     myListing = '';

     /* Si une adresse a �t� saisie (champ de recherche non vide) */
     if(adr != ''){
       var i = 0;
       /* Appel envoy� au geocoder de Google */
       geocoder.getLocations(adr,function(ADRESSE){
         /* Si l'adresse n'a pu �tre g�olocalis�e */
         if (!ADRESSE) {
           alert(ADRESSE+" n'existe pas ou n'a pu �tre g�olocalis�e ...");
         }else {
           /* Le service web de g�ocodage de Google a renvoy� au moins un r�sultat */
           bounds = new GLatLngBounds();
           if(ADRESSE.Placemark){
             /* Le service web de g�ocodage de Google a renvoy� au moins un point  */
             /* nombrePlacemarks repr�sente le nombre de points renvoy�s */
             var nombrePlacemarks = ADRESSE.Placemark.length;
             var iPlacemark;
             var placemark;
             /* Tant que l'on a des r�sultats, on les traite */
             for (iPlacemark = 0 ; iPlacemark < nombrePlacemarks ; iPlacemark ++){
              placemark = ADRESSE.Placemark[iPlacemark];
              createMarker(placemark);
             }

           /* Pr�paration des �l�ments HTML pour l'affichage des r�sultats */
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

   /* D�claration de la fonction charg�e d'ajouter les markers sur la map */
   function createMarker( placemark){
     /* R�cup�ration des coordonn�es du point */
     var coord = placemark.Point.coordinates;
     markers[i] = new GMarker(new GLatLng(coord[1], coord[0]));
     /* R�cup�ration du contenu de l'infobulle (infowindow) */
     htmls[i] = getHtml(placemark);
     /* Ajout de l'�couteur d'�v�nement sur le marker */
     clickMarker(i);
     /* Ajout du marker sur la map */
     map.addOverlay(markers[i]);
     /* Cr�ation du listing des r�sultats (colonne de droite) */
     myListing += '<a href="javascript:openMarker('+i+')" class="linkSidebar">';
     myListing += htmlSidebar[i];
     myListing += '</a>';
     /* Extension des limites de la carte en ajoutant le nouveau point obtenu */
     bounds.extend(new GLatLng(coord[1], coord[0]));
     i++;
   }	

   /* D�claration de la fonction charg�e d'ouvrir l'infobulle apr�s un click
   sur un item du listing des r�sultats ou sur un marker */
   function openMarker(m){
     markers[m].openInfoWindowHtml(htmls[m]);
   }

   /* D�claration de la fonction "�couteur d'�v�nement" sur les markers */
   function clickMarker(a){
     GEvent.addListener(markers[a], "click", function() {
       openMarker(a);
     });
   }

   /* D�claration de la fonction charg�e de r�cup�rer le contenu de l'infobulle
   pour le point concern� */
   function getHtml(placemark){
     /* Impl�mentation du contenu du listing de r�sultats */ 
     htmlSidebar[i] = placemark.address;
     var html  = '<p style="width: 200px; font-size: 11px; font-family: verdana;">';
     html += placemark.address;
     html += '<br />';
     html += placemark.Point.coordinates[1] + ' - '+ placemark.Point.coordinates[0];
     html += '<br />';
     /* Si l'�l�ment de r�ponse contient les informations li�es � l'adresse
     postale du point, on les r�cup�re */
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

   /* D�claration de la fonction charg�e de r�afficher la map */
   function reloadMap(){
     /* R�cup�ration du zoom optimum pour contenir tous les points */
     var newZoom = map.getBoundsZoomLevel(bounds);
     /* D�finition d'un zoom maximum, ici 13 */
     if(newZoom >= 14)
       newZoom = 13;
     /* R�cup�ration du nouveau centre de la map */
     var newCentre = bounds.getCenter();

     /* Affichage de la map */
     map.setCenter(newCentre, newZoom);
   }

   /* D�claration de la fonction qui appelle la fonction useGeoCoder
   apr�s avoir enfonc� la touche "entr�e" */
   function enterPressed(evn) {
     if (window.event && window.event.keyCode == 13)
       useGeoCoder(document.getElementById('addr').value);
     else if (evn && evn.keyCode == 13)
       useGeoCoder(document.getElementById('addr').value);
   }

   document.onkeypress = enterPressed;