var map;
var service;
var infowindow;

function initialize() {
  var pyrmont = new google.maps.LatLng(-48.8665433,2.1956316);
	
  map = new google.maps.Map(document.getElementById('map'), {
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: pyrmont,
      zoom: 7
    });
	
	
var pyrmont = geocoder.getLatLng(document.getElementById('addr').value + ", france", function (point) {
            if (!point) {
                alert(postalCode + " not found");
            } else {
                alert(point);
                var marker = new GMarker(point);

                $.post("/Demographic/Geocode/" + id, marker, function () {
                    alert("success?");
                });
            }
        });
  var request = {
    location: pyrmont,
    radius: '50',
    types: ['decheterie']
  };

  service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
  loadScript();
}
  function loadScript() {

    var script = document.createElement("script");
    script.src = "http://www.google.com/jsapi?key=AIzaSyCPmP7rR3dwKLF-wuGZPo2TBdiJTmrbPq0&callback=loadMaps";
    script.type = "text/javascript";
    document.getElementsByTagName("head")[0].appendChild(script);
}

function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      var place = results[i];
      createMarker(results[i]);
    }
  }
}

window.onload = initialize();
