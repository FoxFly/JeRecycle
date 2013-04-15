<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>
    <div class="container container-primary">

      
  	   <div class="row">
                <div class="span8">
                    <form class="form-horizontal">
                         <div class="control-group">
                           <label class="control-label" >Nom</label>
                           <div class="controls">
                             <input type="text"  placeholder="Nom">
                           </div>
                         </div>
                         <div class="control-group">
                           <label class="control-label" >Prenom</label>
                           <div class="controls">
                             <input type="text"  placeholder="Prenom">
                           </div>
                         </div>
                         <div class="control-group">
                           <label class="control-label" >Code Postal</label>
                           <div class="controls">
                             <input type="text"  placeholder="EX : 75001">
                           </div>
                         </div>    
                        <div class="control-group">
                           <label class="control-label" for="inputEmail">Email</label>
                           <div class="controls">
                             <input type="text" id="inputEmail" placeholder="Email">
                           </div>
                         </div>
                        <div class="control-group">
                           <label class="control-label" for="inputEmail">Confirmation E-mail</label>
                           <div class="controls">
                             <input type="text" id="inputEmail" placeholder="Email">
                           </div>
                         </div>
                         <div class="control-group">
                           <label class="control-label" for="inputPassword">Mot de Passe</label>
                           <div class="controls">
                             <input type="password" id="inputPassword" placeholder="Mot de Passe">
                           </div>
                         </div>
                         <div class="control-group">
                           <label class="control-label" for="inputPassword">Confirmation Mot de Passe</label>
                           <div class="controls">
                             <input type="password" id="inputPassword" placeholder="Mot de Passe">
                           </div>
                         </div>
                        
                        
                         <div class="control-group">
                           <div class="controls">

                             <button type="submit" class="btn">S'inscrire</button>
                           </div>
                         </div>
                     </form>
                </div>
                <div class="span4">
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