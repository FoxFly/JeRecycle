<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>

    <div class="container container-primary">

      
  	   <div class="row">
                <div class="span8">
                    <form class="form-horizontal"">
                      <div class="control-group">
                               <label class="control-label" >Catégorie</label>
                   
                          <div class="controls">
                     
                               <select class="input-meduim" name="device">  
                                 <option> </option>
                                 <option>Laptop</option>
                                 <option>Tablette</option>
                                 <option>Smartphone</option>
                                 
                               </select>
                         </div>
                      </div>
                        
                        <div class="control-group">
                                <label class="control-label" >Marque</label>
                   
                            <div class="controls">
                     
                               <select class="input-meduim">  
                                 <option> </option>
                                 <option>Marque 1</option>
                                 <option>Marque 2</option>
                               </select>
                         </div>
                      </div>
                        
                        <div class="control-group">
                                <label class="control-label" >Modéle</label>
                   
                      
                            <div class="controls">
                     
                               <select class="input-meduim">  
                                 <option>  </option>
                                 <option>Modéle 1</option>
                                 <option>Modéle 2</option>
                             </select>
                         </div>
                      </div>
                        
                        <div class="control-group">
                                     <label class="control-label" >Couleur</label>
                   
                      
                            <div class="controls">
                             <select class="input-meduim">  
                                <option>  </option>
                                <option>Noir</option>
                                <option>Blanc</option>
                                <option>Rouge</option>
                             </select>
                             
                         </div>
                      </div>
                          
                        <div class="control-group">
                                 <label class="control-label" >Etat</label>
                   
                      
                            <div class="controls">
                            
                               <select class="input-meduim">  
                                <option>  </option>
                                <option>Neuf</option>
                                <option>Occasion</option>
                               </select>
                             
                         </div>
                      </div>
                          
                        <div class="control-group">
                            <label class="control-label" >Prix</label>
                           
                        <div class="controls ">
                        
                            <input type="text"  placeholder="Ex : 100">
                             <span class="add-on">&euro;</span>
                        
                         </div>
                      </div>
      
                        
                        <div class="control-group">
                            <label class="control-label" >Votre N° de télephone</label>
                           
                        <div class="controls">
                        
                            <input type="text"  placeholder="Ex : 06 01 02 03 04"><span> (Optionnel)</span>
                        
                         </div>
                      </div>
                        
                        <div class="control-group">
                            <label class="control-label" >Votre annonce</label>
                           
                        <div class="controls">
                        
                            <textarea class="field span4" rows="10"></textarea>
                            
                         </div>
                      </div>
                        
                        
                         <div class="control-group">
                           
                        <div class="controls">
                        
                             <button type="submit" class="btn btn-success">Poster l'annonce</button> 
                            
                         </div>
                      </div>
                                 
                    </form>   
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