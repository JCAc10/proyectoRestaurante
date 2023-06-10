
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    String usuario="";
    String tipo;
    HttpSession sesionOk= request.getSession();
    usuario=(String)sesionOk.getAttribute("usuario");
    tipo=(String)sesionOk.getAttribute("tipo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN Page</title>
          <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <!-- Font Awesome JS -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="main.js"></script>
    </head>
    <body>
    <!--   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Perfil</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Delivery</a>
        </li>
        <li class="nav-item">
            <%//if(tipo.equals("1")){%>
          <a class="nav-link" href="#">Productos</a>
          <%//}%>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ServletLogin">Cerrar</a>
        </li>
      </ul>
      <span class="navbar-text">
       Un gusto verte, <%//=usuario%>
      </span>
    </div>
  </div>
</nav> -->
           <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="#"><img src="https://i.imgur.com/BssRO5S.png" alt="alt" width="65" height="60" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 tabs">
        <li class="nav-item">
            <%if(tipo.equals("1")){%>
          <a class="nav-link active" aria-current="page" href="#tab1">Mantenimiento</a>
            <%}%>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Delivery</a>
        </li>
        <li class="nav-item">
            <%if(tipo.equals("1")){%>
            <a class="nav-link" href="#tab2">Productos</a>
           <%}%>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ServletLogin">Cerrar</a>
        </li>
      </ul>
<span class="navbar-text">
       Un gusto verte, <%=usuario%>
      </span>
    </div>
  </div>
</nav>
      	<div class="wrap">
		<div class="secciones">
			<article id="tab1">
				<h1>Lista de productos</h1>
                                <p>
                                    
                                </p>
                        </article>
			<article id="tab2">
				<center><h1>Listado de productos</h1></center>
				 <center><a href="" class="btn btn-primary">Agregar</a></center><br>        
           <div class="d-grid gap-2">
                            <section class="mb-4">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4>Productos en la base de datos</h4>
                                                </div>
                                                <table class="table">
                                                    <tr>
                                                        <td>Codigo</td><td>Nombre</td>
                                                        <td>Precio</td><td>Cantidad</td>
                                                        <td>Monto</td><td>Acciones</td>
                                                    </tr>
                                            <%
                                                 Connection cn = null;
                                                 Statement sta = null;
                                                 ResultSet rs = null;
                                                 String cadena = "jdbc:mysql://localhost/tienda_bluesky?user=root&passwoord=";
                                           try {
                                                     Class.forName("com.mysql.jdbc.Driver");
                                                     cn = DriverManager.getConnection(cadena);
                                                     sta = cn.createStatement();
                                                     rs = sta.executeQuery("select * from producto");
                                                      while (rs.next()) {
                                              %>
                                                    <tr>
                                                        <td><%=rs.getInt(1)%> </td>
                                                        <td><%=rs.getString(2)%> </td>
                                                        <td><%=rs.getString(3)%></td>
                                                        <td><%=rs.getInt(4)%></td>
                                                        <td><%=rs.getDouble(5)%></td>
                                                        <td><input type="hidden" id="idp" value="">
                                                             <a href="ServletCRUD?op=eliminar" class="btn btn-warning"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn btn-danger"><i class="fa fa-book" aria-hidden="true"></i></a>
                                                        </td>
                                                    </tr>

                                                    <%  }
                                                         rs.close();
                                                         sta.close();
                                                         cn.close();
                                            } catch (Exception e) {
                                                 out.println("Error: " + e);
                                                  }
                                             %>    
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
 <div class="text-center text-black mb-3">
         <div class="card-body">
           <div class="container">
              
	<form action="ServletLogin" method="post"> <h3>Agregar Producto</h3>
            <table class="table">
                <tr>
                    <td>Nombre: </td>
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
        </form>
           </div>
        </div>
 </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>			
                        </article>
			<article id="tab3">
				<h1>Servicios</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea numquam odio voluptate. Aliquam incidunt similique, et quasi ducimus quos aut autem non dignissimos dicta sit provident, voluptatibus ut blanditiis perspiciatis cum, vel temporibus minima enim. Asperiores omnis placeat officiis a tenetur sit recusandae, reprehenderit neque. Tempora quibusdam, perferendis id ratione culpa dolorum! Nemo, animi?</p><br>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum dignissimos at esse, ipsum rerum assumenda nisi obcaecati! Aliquam iure voluptatem incidunt, explicabo sit labore, perferendis eius ad vel quia. Praesentium, doloribus. Quisquam provident nostrum totam itaque debitis, minima, tempore dolores!</p>
			</article>
			<article id="tab4">
				<h1>Blog</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea numquam odio voluptate. Aliquam incidunt similique, et quasi ducimus quos aut autem non dignissimos dicta sit provident, voluptatibus ut blanditiis perspiciatis cum, vel temporibus minima enim. Asperiores omnis placeat officiis a tenetur sit recusandae, reprehenderit neque. Tempora quibusdam, perferendis id ratione culpa dolorum! Nemo, animi? Eveniet eaque perspiciatis, libero quia, pariatur iusto, ipsum porro quod, ut tempora cum quo non illum. Non eligendi incidunt sequi, molestias quia perspiciatis architecto repudiandae quod.</p><br>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam ipsa ducimus amet at cumque sed numquam, explicabo impedit optio quas iste aperiam quidem ipsam rerum libero voluptatibus perferendis officiis voluptatum!</p>
			</article>
		</div>
	</div>
      <script>
        $('ul.tabs li a:first').addClass('active');
	$('.secciones article').hide();
	$('.secciones article:first').show();

	$('ul.tabs li a').click(function(){
		$('ul.tabs li a').removeClass('active');
		$(this).addClass('active');
		$('.secciones article').hide();

		var activeTab = $(this).attr('href');
		$(activeTab).show();
		return false;
	});
      </script>
    </body>
</html>
