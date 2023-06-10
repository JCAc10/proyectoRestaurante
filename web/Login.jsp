<%-- 
    Document   : Login
    Created on : 26 nov. 2021, 11:24:52
    Author     : Elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>   
<head>
	<title>Inicio de Sesión</title>
        <link rel="shortcut icon" href="https://i.imgur.com/95sItqH.png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/estilos_login.css"/>
</head>
<!--Coded with love by Mutiullah Samim-->
<body>
    <div class="container">
	<form action="ServletLogin" method="post">
            <center><h3>INICIO DE SESIÓN</h3></center>
            <table class="table">
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" name="txtUsu" placeholder="Ingrese su DNI" class="form-control"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="txtPas" placeholder="Ingrese su password" class="form-control"></td>
                </tr>
                 <tr>
                    <td><input type="checkbox" id="empleado" name="empleado" value="Empleado"></td>
                    <td> <label for="empleado">Soy empleado</label></td>
                  </tr>
                <tr align="center">
                    <th colspan="2">
                    <input type="submit" name="btn" value="Iniciar Sesión"class="form-control btn btn-primary">
                     <center><p>¿No tienes cuenta? Regístrate <a href="Registro.jsp" class="regis">aquí</a></p></center>
                </tr>
                </table>
              <% 
                                 if(request.getAttribute("Error")!=null){
                                 String error= request.getAttribute("Error").toString();
                                    
                                %>
                                
                                <div class="alert alert-danger" role="alert">
                                    <%=error%>
                                </div>
                                <% 
                                 }
                                %>
        </form>
          
                                </div>
</body>
</html>

