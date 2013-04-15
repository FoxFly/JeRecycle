function loadScript() {

    var script = document.createElement("script");
    script.src = "http://www.google.com/jsapi?key=AIzaSyCPmP7rR3dwKLF-wuGZPo2TBdiJTmrbPq0&callback=loadMaps";
    script.type = "text/javascript";
    document.getElementsByTagName("head")[0].appendChild(script);
}

function loadMaps() 
{
    google.load("maps", "3", {
        "callback" : showMap,
        other_params: "sensor=false"
    });
}

function showMap()
{
    document.getElementById("map").style.display = "block";

    var mapOptions = {
        zoom: 7,
        center : new google.maps.LatLng(0, 0),
        mapTypeId: google.maps.MapTypeId.ROADMAP //On indique qu'il s'agit d'une "carte routi�re"
    };

    map = new google.maps.Map(document.getElementById("map"), mapOptions); 
}

function centerMap(map, coords, zoom)
{
    map.panTo(coords);
    map.setZoom(zoom);
}

function searchAddress(map)
{
    geocoder = new google.maps.Geocoder(); //D�claration de la classe de g�ocodage de Google
    geoOptions = {
        'address': document.getElementById("address").value
    };
    geocoder.geocode( geoOptions, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var coords = results[0].geometry.location;

            addMarker(map, geoOptions.address, coords);
            centerMap(map, coords, 7);
        } else {
            alert("L'adresse n'a pu �tre g�ocod�e avec succ�s.");
        }
    });
}

function searchMarkerCoords(marker, infowindow)
{
    console.log(marker);
    geocoder = new google.maps.Geocoder(); //D�claration de la classe de g�ocodage de Google
    geoOptions = {
        'latLng' : marker.position
    };
    geocoder.geocode( geoOptions, function(results, status) {
        /* Si les coordonn�es ont pu �tre geolocalis�es */
        if (status == google.maps.GeocoderStatus.OK) {
            var address = results[0].formatted_address;
            marker.setTitle("Marqueur d�plac�");
            infowindow.setContent(address);
        } else {
            alert("Les nouvelles coordonn�es n'ont pu �tre g�ocod�es avec succ�s.");
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

function removeMarker(marker)
{
    marker.setMap(null);
}

window.onload = loadScript();