<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>

    <div class="container container-primary">

      
  	   <div class="row">
                <div class="span12">
                    <h3> <a href="deposeruneannonce.jsp"> Déposer une offre </a> </h3>
                
                    <form class="form-horizontal form-inline">
                          
                               <select class="selectpicker input-mysize2">  
                                 <option>Catégorie</option>
                                 <option>Laptop</option>
                                 <option>Tablette</option>
                                 <option>Smartphone</option>
                                 
                               </select>
                               <select class="selectpicker input-mysize3">  
                                 <option>Marque</option>
                                 <option>Marque 1</option>
                                 <option>Marque 2</option>
                             </select>
                               <select class="selectpicker input-departement">  
                                 <option>Département</option>
                                 <option>75</option>
                                 <option>93</option>
                                 <option>94</option>
                                 <option>69</option>
                             </select>
                         
                        <div class="control-group">
                           <div class="controls">
                             <select class="selectpicker input-mysize3 input-modele">  
                                 <option>Modéle</option>
                                 <option>Modéle 1</option>
                                 <option>Modéle 2</option>
                             </select>
                              <select class="selectpicker input-mysize1">  
                                <option>Couleur</option>
                                <option>Noir</option>
                                <option>Blanc</option>
                                <option>Rouge</option>
                             </select>
                               
                               
                               <input type="text" class="input-mysize2"  placeholder="Code postal">
                             
                               <select class="selectpicker input-mysize2">  
                                <option>Etat</option>
                                <option>Neuf</option>
                                <option>Occasion</option>
                               </select>
                               
                               <select class="selectpicker input-mysize2">  
                                <option>Prix Max</option>
                                <option>50</option>
                                <option>75</option>
                                <option>100</option>
                                <option>125</option>
                                <option>150</option>
                                <option>175</option>
                                <option>200</option>
                                <option>250</option>
                                <option>300</option>
                               </select>

                               
                           </div>
                         </div>
                         <button type="submit" class="btn btn-success input-mysize4">Rechercher</button> 
                      
                        
                     </form>
                    
                </div>
                    
                    <hr>
                    
                    
                <div class="achat span12">
                    <table class="table table-hover">
                        <tr>
                            <thead>
                                <th class="span2">DATE</th>
                                <th class="span3">MODELE</th>
                                <th class="span1">COULEUR</th>
                                <th class="span2">LOCALISATION</th>
                                <th class="span2">ETAT</th>
                                <th class="span2">PRIX</th>     
                            </thead>
                        </tr>
                        <tr>
                            <tbody>
                                
                                <tr>
                                    <td>Aujourd'hui <br> 15h60</td>
                                    <td>Samsung Galaxy S12</td>
                                    <td>Noir</td>
                                    <td>Val de Marne <br> 94230 CACHAN</td>
                                    <td>Comme neuf</td>
                                    <td> <h2 class="text-pink"> 550 &euro; </h2></td>
                                </tr>
                                
                                <tr>
                                    <td>10/02/2013</td>
                                    <td>Samsung Galaxy S4</td>
                                    <td>Noir</td>
                                    <td>Val de Marne <br> 94230 CACHAN</td>
                                    <td>Comme neuf</td>
                                    <td> <h2 class="text-orange"> 490 &euro; </h2></td>
                                </tr>
                                
                                <tr>
                                    <td>20/02/2013</td>
                                    <td>Samsung Galaxy Ss1</td>
                                    <td>Noir</td>
                                    <td>Val de Marne <br> 94230 CACHAN</td>
                                    <td>Comme neuf</td>
                                    <td> <h2 class="text-green"> 350 &euro; </h2></td>
                                </tr>
                                
                            </tbody>    
                        </tr>

                     </table>                    
                </div>
            </div>  
        
   </div> <!-- /container -->
   
   
        <%@include file="./footer/footer.jsp"%>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="../js/jquery-1.8.3.js"></script>
    <script src="../js/bootstrap.min.js"></script>-->
    <script type="text/javascript">
        
        $(document).ready(function(){
            
            $('.achat table tr').click(function(){
                    
                    window.location = 'produit.jsp';

            });
            
        });
        
        
        
    </script>


</body>
</html>