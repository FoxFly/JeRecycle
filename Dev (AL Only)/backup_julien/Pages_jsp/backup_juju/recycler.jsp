<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>

    <div class="container container-primary">

      
  	   <div class="row">
                <div  class="span8">

                
                <div id="map_canvas">       
                    <form class="form-inline" method="POST" action="#" >
                            <input class="span6" type="text" placeholder="Saisir votre code postal ou votre adresse">
                            <button type="submit" class="btn-success">Rechercher</button>
                       </form>
                    <img class="formulaire" src="./css/img/map.png"/>
                </div>
                </div>
                <div class="span4">
               
                    <h5>LISTE DES CENTRES DE RECYCLAGE </h5>
                        
                        <div class="map-list">
                           
                            <div class="list-map">
                                <ul>
                                    <li>Nom du centre</li>
                                    <li>Rue</li>
                                    <li>Code Postal</li>
                                    <li>Télephone</li>
                                </ul>
                            </div>
                            
                           
                            <div class="list-map">
                                <ul>
                                    <li>Nom du centre</li>
                                    <li>Rue</li>
                                    <li>Code Postal</li>
                                    <li>Télephone</li>
                                </ul>
                            </div>
                            
                        </div>
                </div>
              </div>  


        </div> <!-- /container -->

         <%@include file="./footer/footer.jsp"%>  
 
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="../js/jquery-1.8.3.js"></script>
    <script src="../js/bootstrap.min.js"></script>-->
    
</body>
</html>