<%-- 
    Document   : PrincipalCliente
    Created on : 2 dic. 2021, 17:40:13
    Author     : Elvis
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true"%>
<%
    String usuario="";
    String id="";
    String tipo;
    HttpSession sesionOk= request.getSession();
    usuario=(String)sesionOk.getAttribute("usuario");
    tipo=(String)sesionOk.getAttribute("tipo");
    id=(String)sesionOk.getAttribute("id");
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>BLUESKY</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="https://i.imgur.com/95sItqH.png">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  
    </head>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="https://i.imgur.com/BssRO5S.png" alt="alt" width="65" height="60" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">PERFIL</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">PEDIDOS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ServletPro?op=listarPro">MENÚ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ServletLogin">CERRAR</a>
        </li>
      </ul>
      <form class="d-flex">
      <!--  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
      <span class="navbar-text">
       Un gusto verte, <%=usuario%>
      </span>
      </form>
    </div>
  </div>
</nav>
    <body>
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://i.imgur.com/VthFToj.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://i.imgur.com/VVptvM8.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://i.imgur.com/uoRXay4.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
     <br>   
        

                    <h2 class="text-center fs-2 text-dark" style="margin-bottom: 15px;">Nuestras promociones te esperan</h2>
                      <div class="row row-cols-1 row-cols-md-3 g-4">
                        <%
                            Connection cn = null;
                            Statement sta = null;
                            ResultSet rs = null;
                            String cadena = "jdbc:mysql://localhost/proyecto_bluesky?user=root&passwoord=";
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                cn = DriverManager.getConnection(cadena);
                                sta = cn.createStatement();
                                rs = sta.executeQuery("select * from producto");
                                while (rs.next()) {
                                    
                        %>
                        
                        
                            <div class="col">
                                  <div class="card h-100 text-center">
                                         <img src="Imagenes/<%=rs.getString(7)%>" class="card-img-top" alt="...">
                                           <div class="card-body">
                                            <h5 class="card-title"><%=rs.getString(2)%></h5>
                                              <p class="card-text"><%=rs.getString(3)%></p>
                                                <center><h6>s/<%=rs.getDouble(5)%></h6></center> 
                                                 <a href="ServletCarrito?op=anadir&cod=<%=rs.getString(1)%>&nom=<%=rs.getString(2)%>&precio=<%=rs.getDouble(5)%>" class="btn btn-primary">Agregar</a>
                                                  <a href="ServletCarrito?op=comprar&cod=<%=rs.getString(1)%>&nom=<%=rs.getString(2)%>&precio=<%=rs.getDouble(5)%>" class="btn btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Comprar</a>

                                              </div>
                                </div>
                            </div>
                        <%
                            
                                }
                                rs.close();
                                sta.close();
                                cn.close();
                            } catch (Exception e) {
                                out.println("Error: " + e);
                            }
                        %>
                    </div>
        <br>
        <footer class="bg-dark text-center text-white">
  <!-- Grid container -->
  <div class="container p-4 pb-0">
    <!-- Section: Form -->
    <section class="">
      <form action="">
        <!--Grid row-->
        <div class="row d-flex justify-content-center">
          <!--Grid column-->
          <div class="col-auto">
            <p class="pt-2">
              <strong>Inicie Sesión para más información</strong>
            </p>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-5 col-12">
            <!-- Email input -->
            <div class="form-outline form-white mb-4">
              <input type="email" id="form5Example29" class="form-control" />
              <label class="form-label" for="form5Example29">Correo</label>
            </div>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-auto">
            <!-- Submit button -->
            <button type="submit" class="btn btn-outline-light mb-4">
              Ingresar
            </button>
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </form>
    </section>
    <!-- Section: Form -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="index.html">Bluesky</a>
  </div>
  <!-- Copyright -->
</footer>
    </body>
</html>
