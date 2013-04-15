<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="./header/header.jsp"%>


    <div class="container container-primary" style="margin:0 auto;">

      
        
        <div class="row">
        
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