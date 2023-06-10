<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Productos"%>
<%@page import="Beans.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
         <link rel="shortcut icon" href="https://i.imgur.com/95sItqH.png">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <!-- Font Awesome JS -->
    <script src="https://kit.fontawesome.com/0000000000.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
    </head>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="index.html"><img src="https://i.imgur.com/BssRO5S.png" alt="alt" width="65" height="60" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">INICIO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">NOSOTROS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">MENÚ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">CONTACTO</a>
        </li>
      </ul>
        <span class="navbar-text">
      </span>
      <form class="d-flex">
          <!--  <i class="fa fa-shopping-cart" aria-hidden="true">a</i>
      <!--  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
      
        <a href="Login.jsp" class="btn btn-outline-info" type="submit">Iniciar Sesión</a>
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
  
            <!-- CON CARTAS -->
 <br>  <h2 class="titulo" align="center">Menú</h2>    
<div class="row row-cols-1 row-cols-md-3 g-4">
     <%
                ArrayList<Productos> lista1=(ArrayList<Productos>)request.getAttribute("listita");
                for(int i=0;i<lista1.size();i++){
                Productos p = lista1.get(i);
               
                %>
  <div class="col">
    <div class="card h-100 text-center">
      <img src="Imagenes/<%=p.getImg_producto()%>" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><%=p.getNom_Product()%> </h5>
        <p class="card-text"><%=p.getDescripcion()%> </p>
        <center><h6>s/<%=p.getPrecio()%></h6></center> 
        <a href="ServletPro?op=anadir&cod=<%=p.getIdProducto()%>&nom=<%=p.getNom_Product()%>&precio=<%=p.getPrecio()%>" class="btn btn-primary">Agregar</a>
       <a href="ServletPro?op=anadir&cod=<%=p.getIdProducto()%>&nom=<%=p.getNom_Product()%>&precio=<%=p.getPrecio()%>" class="btn btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Comprar</a>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel">Carrito de compras</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
      <!-- comment -->
      <div class="container">
            <table class="table">
                <tr bgcolor="Skyblue">
                    <th colspan="5">Cesta de Productos</th>
                </tr>
                <tr bgcolor="skyblue">
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                    <td>Monto</td>
                </tr>
                <%
                    double total=0;
                      ArrayList<Cesta> lista=(ArrayList<Cesta>)session.getAttribute("carrito");
                    if(lista!=null){
                        for(Cesta d:lista){
                        %>
                <tr>
                    <td><%=d.getIdProducto()%></td>
                    <td><%=d.getNom_Product()%></td><!-- comment -->
                    <td><%=d.getPrecio()%></td>
                    <td><%=d.getCantidad() %></td>
                    <td><%=d.getCantidad()*d.getPrecio() %></td>
                </tr>
                <%
                    total=total+(d.getPrecio()*d.getCantidad());
                    }
                   }%>
                   <tr>
                       <td align="right" colspan="4">Total</td>
                       <td><%=total%></td>
                   </tr><!-- comment -->
</table>
                   <h4 align="center"><a href="ServletPro?op=listarPro" class="btn btn-success">Seguir Comprando</a> 
                       <!-- Button trigger modal -->
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Finalizar Compra
                    </a>

        </div>

  </div>
</div>
      </div>
    </div>
  </div>
  
   <%
      }
            %>
</div>
 <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alerta</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         Su compra no pudo procesarse ya que no ha iniciado sesión.
        ¿Desea iniciar sesión?
      </div>
      <div class="modal-footer">
        <a href="Login.jsp" class="btn btn-primary">Iniciar Sesión</a>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
      </div>
    </div>
  </div>
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
