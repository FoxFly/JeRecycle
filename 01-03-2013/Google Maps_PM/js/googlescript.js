  var map;
      var infowindow;

      function initialize() {
        var pyrmont = new google.maps.LatLng(-33.8665433, 151.1956316);

        map = new google.maps.Map(document.getElementById('map'), {
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          center: pyrmont,
          zoom: 15
        });

        var request = {
          location: pyrmont,
          radius: 500,
          types: ['store']
        };
        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch(request, callback);
      }

      function callback(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
          }
        }
      }

      function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }
	  /*
	  function nearestDealerShip(lat, lng) {
        //Boundary Checks
        if (!lat || !lng) { return; }

        var oGivenLatlng = new google.maps.LatLng(lat, lng),
            oDealerLatlng = null,
            dDistance = null,
            sHtml = null;

        for (var iAddrIdx = 0; iAddrIdx < g_oAddrs.length; iAddrIdx++) {
            oDealerLatlng = new google.maps.LatLng(g_oAddrs[iAddrIdx].latitude, g_oAddrs[iAddrIdx].longitude);

            dDistance = google.maps.geometry.spherical.computeDistanceBetween(oGivenLatlng, oDealerLatlng);

            if (!g_dTemp) {
                g_dTemp = dDistance;
            }
            else if (dDistance < g_dTemp) {
                g_dTemp = dDistance;
                g_dNearIndex = iAddrIdx;
            }
        }
        g_dTemp = (g_dTemp * 0.000621371192).toFixed(1); //Converts meters in to miles and rounds the decimal to one(1).
        sHtml = FTForNearestDealer();
        document.getElementById('DNAddr').innerHTML = sHtml;
    }
	  */
	  
	function searchAddress(map){
		geocoder = new google.maps.Geocoder(); 
		geoOptions = {
			'address': document.getElementById("zipcode").value + ",france"
		};
		geocoder.geocode( geoOptions, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var coords = results[0].geometry.location;
			//var dLat = results[0].geometry.location.Pa;
            //var dLnsg = results[0].geometry.location.Qa;
            //nearestDealerShip(dLat, dLnsg);
            addMarker(map, geoOptions.address, coords);
            centerMap(map, coords, 13);
        }
		else {
            alert("L'adresse n'a pu être géocodée avec succès.");
        }
		});
	}


function addMarker(map, body, location) {
    var marker = new google.maps.Marker({
        map : map, 
        position : location,
        animation: google.maps.Animation.DROP,
        draggable : true
    });
    marker.setTitle("Mon marqueur");
    var infowindow = new google.maps.InfoWindow( {
        content : body
    });
    new google.maps.event.addListener(marker, "click", function() {
        infowindow.open(map, marker);
    });
    new google.maps.event.addListener(marker, "rightclick", function() {
        removeMarker(marker);
    });
    new google.maps.event.addListener(marker, 'dragend', function(){
        searchMarkerCoords(marker, infowindow);
    });
}


function centerMap(map, coords, zoom)
{
    map.panTo(coords);
    map.setZoom(zoom);
}
      google.maps.event.addDomListener(window, 'load', initialize);