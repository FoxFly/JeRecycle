<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>
    TOTO
    <div class="container container-primary">
  	   <div class="row">
                <div class="span8">
                    <form class="form-horizontal"  method="post" action="ServletConnection">
                        <div class="control-group">
                           <label class="control-label" for="inputEmail">Email</label>
                           <div class="controls">
                             <input type="text" id="inputEmail" name="email" placeholder="Email">
                           </div>
                         </div>
                         <div class="control-group">
                           <label class="control-label" for="inputPassword">Mot de Passe</label>
                           <div class="controls">
                             <input type="password" id="inputPassword" placeholder="Mot de Passe">
                           </div>
                         </div>
                         <div class="control-group">
                           <div class="controls">
                             <label class="checkbox">
                               <input type="checkbox"> Se souvenir de moi
                             </label>
                               <button type="submit" class="btn btn-primary">Connexion</button> <span><a href="motdepasseoublie.jsp"> Mot de passe oublié</a></span>
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