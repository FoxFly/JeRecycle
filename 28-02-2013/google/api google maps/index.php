<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Initiation à l'utilisation de Google Maps v3</title>
        <script type="text/javascript" src="getMapByAddress.js"></script>
    </head>
    <body>
        <form onsubmit="return false">
            <label>Code Posatl </label>
			<input type="text" name="address" id="address" placeHolder="Indiquez votre adresse ici."/>
            <input type="submit" value="Géolocalisez" onclick="searchAddress(map)"/>
        </form>
        <div id="map" style="width: 640px; height: 480px; display: none;"></div>
    </body>
</html>