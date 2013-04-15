<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Géoloc Google</title>
<script type="text/javascript" src="geoloc.js"></script>
</head>

<body>
<iframe frameborder="0" style="width: 665px; height: 480px;" src="http://www.weboblog.fr/exploiter-placemarks-google-map.php">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="fr">
  <head>
    <meta name="robots" content="noindex, nofollow">
   <link rel="canonical" href="www.weboblog.fr/afficher-placemarks-getlocations" />
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
      <title>Exploiter les Placemarks retourn?s par la m?thode getLocations (google map)</title>

    <script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAssNHsvRmdjbf…Je4IBRUsz-pYg_Ma22JMdFSMvaUp2krUhQPGyzeHUvioNuo_7zqLxrqnekFOQ&sensor=false" type="text/javascript"></script>
<style type="text/css">
	.linkSidebar{
				display:inline-block; 
				float : left;
				padding: 5px;
				font-size: 10px;
				background: #E6E5FA;
				margin: 0 10px 5px 10px;
				width: 200px;
				color: #333;
				border: 1px solid;
	}
</style>
  </head>

  <body>
<div id="apply" style="text-align: left; border: 1px solid #333;  padding: 5px; float: left;">
	<input type="text" id="addr" style="color: #333;  border: 1px solid; width: 400px; float: left; display: inline-block; margin: 0 0 5px 0;"/>
	<p id="resultLibel" style="display: none; float: left; padding: 2px 10px 1px 10px; text-align: center; font-weight: bold; background: #FFFF86;border: 1px solid; color: #333; margin: 0 0 0 8px; font-size: 11px; width: 190px; text-transform: uppercase;">Listing des r&eacute;sultats</p>
	<p style="clear:both;"></p>
	
	<div id="map" style="width: 400px; height: 430px; float: left;"></div>
	<div id="mySidebar" style=" height: 430px; float: left; overflow-y: auto; overflow-x: hidden;"></div>
</div>
  <script type="text/javascript">
  /*
	var map = new GMap2(document.getElementById("map"),{mapTypes: [G_HYBRID_MAP]});
	map.setUIToDefault();
	map.disableScrollWheelZoom();
	
	var bounds = new GLatLngBounds();
	var markers = [];
	var htmlSidebar = [];
	var myDiv = document.getElementById('mySidebar');
	var i = 0;
	var htmls = []; var myListing = '';
	map.setCenter(new GLatLng(48.8566667, 2.3509871), 13);

	var geocoder = new GClientGeocoder();
	function useGeoCoder(adr){
		geocoder.reset();
		map.clearOverlays();
		var markers = new Array();
		var htmlSidebar = new Array();
		myListing = '';
		if(adr != ''){
			var i = 0;
			geocoder.getLocations(adr,function(coordonnees){				
				if (!coordonnees) {
					alert("! "+adr+" n'existe pas ou n\'a pu ?tre g?olocalis?e ...");
				}else {
					bounds = new GLatLngBounds();
					if(coordonnees.Placemark){
				        var nombrePlacemarks = coordonnees.Placemark.length;					
				        var iPlacemark;
				        var placemark;
				        for (iPlacemark = 0 ; iPlacemark < nombrePlacemarks ; iPlacemark++){							
				            placemark = coordonnees.Placemark[iPlacemark];
				            createMarker(placemark);
				        }
						myDiv.style.width = '225px';
						document.getElementById('resultLibel').style.display = 'block';
						document.getElementById('apply').style.width = '635px';
						myDiv.innerHTML = myListing;
						reloadMap();
					} else
						alert('Aucun resultat trouve pour cette recherche ! ...');
				}}
			);
		}
	}
	
	function createMarker(placemark){
	    var coord = placemark.Point.coordinates;
	    markers[i] = new GMarker(new GLatLng(coord[1], coord[0]));	
		htmls[i] = getHtml(placemark);
		clickMarker(i);
		map.addOverlay(markers[i]);
		myListing += '<a href="javascript:openMarker('+i+')" class="linkSidebar">'+htmlSidebar[i]+'</a>';
		bounds.extend(new GLatLng(coord[1], coord[0]));
		i++;
	}	

	function openMarker(m){
		markers[m].openInfoWindowHtml(htmls[m]);
	}

	function clickMarker(a){
		GEvent.addListener(markers[a], "click", function() {
			openMarker(a);
		});
	}
	
	function getHtml(placemark){
		htmlSidebar[i] = placemark.address;
		var html = '<p style="width: 200px; font-size: 11px; font-family: verdana;">'+placemark.address;

		html += '<br />';
		html += '( ' + placemark.Point.coordinates[1] + ' ; '+ placemark.Point.coordinates[0] + ' )<br />';
		if (placemark.AddressDetails){			
			if (placemark.AddressDetails.Country){			
				if (placemark.AddressDetails.Country.AdministrativeArea){			
					var administrativeArea = placemark.AddressDetails.Country.AdministrativeArea;				
					html += administrativeArea.AdministrativeAreaName;
					if (administrativeArea.SubAdministrativeArea){
						var subAdministrativeArea = administrativeArea.SubAdministrativeArea;
						html += '<br />';
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
			}
		}
		html += '</p>';
		return html;
	}
	
	function reloadMap(){
		var newZoom = map.getBoundsZoomLevel(bounds);
		if(newZoom >= 15)
			newZoom = 13;
		var newCentre = bounds.getCenter();

		map.setCenter(newCentre, newZoom);
	}

	
	
	function enterPressed(evn) {
		if (window.event && window.event.keyCode == 13)
		  useGeoCoder(document.getElementById('addr').value + ", france");
		else if (evn && evn.keyCode == 13)
		  useGeoCoder(document.getElementById('addr').value + ", france");
	}
	document.onkeypress = enterPressed;*/
	
window.onload = initialize();
  </script>
  </body>
</html>

</iframe>
		
<br/>


<div id="map" style="width:500px;height:380px;"></div>



</body>
</html>

