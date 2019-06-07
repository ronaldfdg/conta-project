<%-- 
    Document   : vistakardex
    Created on : 06/06/2019, 02:33:00 PM
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.dao"%>
<%@page import="bean.kardex"%>

<%
    dao cd = new dao();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
        <title>Contabilidad</title>
    
    </head>
    <body>
    <style>
		
body{
    margin: 0;
    min-height: 100vh;
    background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy2dj_lcGvzRk5w7NLv5ILZkz9KuoPT9-UW3-DgirMLHx_bSz74Q');
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    
    display: flex;
    justify-content: center;
    align-items: center;
}
body:before{
    content: "";
    width: 100%;
    min-height: 100vh;
    position:absolute;
    top: 0;
    left: 0;
    background: linear-gradient(90def, #52c4df, #ad55c1);
    opacity: 0.7;
    z-index: -1;
}
.form-reg{
    width: 95%;
    max-width: 700px;
    margin: auto;
    /*background: white;*/
    border-radius: 7px;
}
.cont-input{
    padding: 10px 50px;
    display: flex;
    flex-wrap: wrap;
}
label{
    font-size: 20px;
    color: black;
}
input{
    margin-bottom: 15px;
    padding: 8px;
    font-size: 12px;
    border-radius: 3px;
    border: 2px solid darkgray;
}
#txtNom{
    width: 100%;
    padding: 10px 45px 10px;
}
#txtNum{
    width: 20%;

}
.boot{
    background: white;
    color: black;
    margin: auto;
    padding: 8px 18px;
    width: 70%;

}
#Emp{
    font-size: 20px;
    color:#fff;
}
	</style>
	
    <center>
        <h2>KARDEX</h2>
        <br><br>
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script type="text/javascript">
 	
 	$(function(){
 		$(".op").click(function(){
 			if($(this).val()=='1'){
 				$("#txtEnt").removeAttr('disabled');
 				$("#txtEnt").focus();
                                $("#txtPrecio").removeAttr('disabled');
 				$("#txtSal").attr('disabled','disabled');
                                document.getElementById('mostrarOcultar').style.display="none";
 			}else{
 				$("#txtSal").removeAttr('disabled');
                                $("#madurez").removeAttr('disabled');
 				$("#txtSal").focus();
                                $("#txtPrecio").attr('disabled','disabled');
 				$("#txtEnt").attr('disabled','disabled');
                                document.getElementById('mostrarOcultar').style.display="block";                                
 			}
 		})
 	})

 </script>

        <form action="servlet" method="post" class="form-reg" >
            <div class="cont-input">
            <div class="col-md-6">
                <ul>
                    
                    <input value="1" type="radio" class="op" name="opcion" id="madurez" checked><!--name="gender"--> Entrada<br>
                    
                                 
            <input type="text" name="txtEnt" id="txtEnt" placeholder="000 unid."/>

            
            <input type="text" name="txtPrecio" id="txtPrecio" placeholder="Precio:    S/.00.00" <!--disabled-->
                   <br>
	
                <input value="2" type="radio" name="opcion" class="op" id="madurez"> Salida<br>  
            <input type="text" name="txtSal" class="op" id="txtSal" placeholder="000 unid." disabled>
            </ul>
            </div>
            <div class="col-md-6">
            <input  type="submit" value="Ingresar" name="btnReg" class="boot"><br><br>
            
            
            <div class="row" style="padding-left: 45px; display:none;" id="mostrarOcultar"><center>
                    <input type="radio" name="metodo" id="madurez" value="ueps"> UEPS<br>
            
            <input type="radio" name="metodo" id="madurez" value="peps"> PEPS<br>

                <input type="radio" name="metodo" id="madurez" value="pmp"> PMP<br>
                </center>
            </div>
            <div class="row" style="padding-left: 80px;"><center>
                    <a href="kardex.jsp"><input type="button" name="" value="Ver" class="boot" style="width:100%;"></a>
            <input type="submit" name="Limpiar" value="Limpiar">
            </center>
            </div>
            

            </div>
            </form><br><br>
    </body>
</html>
