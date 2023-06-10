<%-- 
    Document   : Cesta
    Created on : 25 nov. 2021, 23:49:09
    Author     : Elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <!-- Font Awesome JS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>Prueba de carro de compras</title>
    </head>
    <body>
        <h2 align="center">Carrito de Compras - Cesta</h2>

        <!-- 
        
        -->   
                   
<div class="d-grid gap-2">
                            <section class="mb-4">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4>Productos agregados al carrito</h4>
                                                </div>
                                                <table class="table">
                                                    <tr>
                                                        <td>Codigo</td><td>Nombre</td>
                                                        <td>Precio</td><td>Cantidad</td><td>Monto</td><td>Acciones</td>
                                                    </tr>
                                                    <%
                    double total=0;
                      ArrayList<Cesta> lista=(ArrayList<Cesta>)session.getAttribute("carrito");
                    if(lista!=null){
                        for(Cesta d:lista){
                                                    %>
                                                    <tr>
                                                        <td><%=d.getIdProducto()%> </td>
                                                        <td><%=d.getNom_Product()%> </td>
                                                        <td><%=d.getPrecio()%></td>
                                                        <td><%=d.getCantidad()%></td>
                                                        <td><%=d.getCantidad() * d.getPrecio()%></td>
                                                        <td><input type="hidden" id="idp" value="<%=d.getIdProducto() %>">
                                                             <a href="servletPro?op=delete?idp=<%=d.getIdProducto() %>" class=""><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                                                    </tr>

                                                    <%
                                                                total = total + (d.getCantidad() * d.getPrecio());
                                                            }
                                                        }
                                                    %>
                                                    <tr>
                                                        <th colspan="4" align="right">Total : </th>
                                                        <th> <%=total%> </th>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="text-center bg-success text-white mb-3">
                                                <div class="card-body">
                                                    <h3>Total productos</h3>
                                                    <h4 class="display-4">
                                                        <i class="fas fa-cheese"></i>${cantidad}
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        <h4 align="center"><a href="ServletPro?op=listarPro" class="btn btn-success">Seguir Comprando</a> 
                       <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Finalizar Compra</a></h4>
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
    </body>
</html>
