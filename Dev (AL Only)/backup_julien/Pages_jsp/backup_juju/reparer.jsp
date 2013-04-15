<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>

    <div class="container container-primary">

      
  	   <div class="row">
                <div  class="span8">
                     
                <div id="map_canvas">       
                    <form class="form-inline" method="POST" action="#">
                          
                               <select class="input-mysize2">  
                                 <option>Catégorie</option>
                                 <option>Laptop</option>
                                 <option>Tablette</option>
                                 <option>Smartphone</option>
                                 
                               </select>
                               <select class="input-mysize2">  
                                 <option>Marque</option>
                                 <option>Marque 1</option>
                                 <option>Marque 2</option>
                             </select>
                           

                           
                         <button type="submit" class="btn-success input-mysize2">Rechercher</button> 
                      
                        
                     </form>
                    <img class="formulaire" src="./css/img/map.png"/>
                </div>
                </div>
                <div class="span4">
               
                    <h5>LISTE DES CENTRES DE REPARATION </h5>
                        
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