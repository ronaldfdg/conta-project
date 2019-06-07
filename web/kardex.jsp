<%-- 
    Document   : index
    Created on : 06/06/2019, 02:13:27 PM
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.dao"%>
<%@page import="bean.kardex"%>

<%  
    kardex kardex = null;
    int acum1 = 0;
    double acum2 = 0.0;
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Kardex</title>

    </head>
    <body>
        
        <style type="text/css">
    
    body{
    margin: 0;
    min-height: 100vh;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: cursive;

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
.tabla{
    border: 2px solid;
    width: 90%;
    border-collapse: collapse;
    background-color: white;
    text-align: center;
}
th, td{
    padding: 20px;
}
.tabla td{
    border: 1px solid;
    text-align: center;
}
.tabla th{
    border:1px solid;
    background-color: #ECE6F6;
}

label{
    font-size: 20px;
    color:#fff;
}

</style>
        
        <div class="container">

                    
            <div class="row">
                <center><br><h2>KARDEX</h2><br><br>
                    <table class="tabla">
                        <tr>
                            <th colspan="3">E S P E C I E</th>
                            <th colspan="2">PRECIO</th>
                            <th colspan="3">VALORES</th>
                            
                        </tr>
                        <tr>
                            <th>Entrada</th>
                            <th>Salida</th>
                            <th>Existencia</th>
                            <th>Compra</th>
                            <th>Salida</th>
                            <th>Debe</th>
                            <th>Haber</th>
                            <th>Saldo</th>
                        </tr>
                        <% for (kardex k : dao.listaCta) {%>
                        <tr>
                            <td><%=k.getEntrada()%></td>
                            <td><%=k.getSalida()%></td>
                            <td><%=acum1 = acum1 + k.getExistencia()%></td>
                            <%
                                double precio1, precio2;
                                precio1 = k.getPrecio();
                                precio2 = k.getPrecio();
                                if (k.getEntrada() == 0 ){
                                    precio1 = 0;
                                }else if (k.getSalida() == 0 ){
                                    precio2 = 0;
                                }
                            %>
                            <td><%=precio1%></td>
                            <td><%=precio2%></td>
                            <td><%=k.getEntrada()*k.getPrecio()%></td>
                            <td><%=k.getSalida()*k.getPrecio()%></td>
                            <%
                                double saldo = 0;
                                if((k.getEntrada()*k.getPrecio())>(k.getSalida()*k.getPrecio())){
                                    saldo = (k.getEntrada()*k.getPrecio())-(k.getSalida()*k.getPrecio());
                                    acum2 = acum2 + saldo;
                                }else if ((k.getEntrada()*k.getPrecio())<(k.getSalida()*k.getPrecio())){
                                    saldo = (k.getSalida()*k.getPrecio())-(k.getEntrada()*k.getPrecio());
                                    acum2 = acum2 - saldo;
                                }
                            %>
                            <td><%=acum2%></td>
                        </tr><%}%>
                    </table>
                </center>
            </div>

            <br><br><br>    
            <center><a href="index.jsp"><input class="btn btn-primary" type="button" value="volver"></a></center>

        </div>
    </body>
</html>
