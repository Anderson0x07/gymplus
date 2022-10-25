<%-- 
    Document   : registroProductos
    Created on : 29/05/2022, 07:25:14 PM
    Author     : Jorge Orlando Vera
--%>



<%@page import="DTO.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Producto"%>
<%@page import="Facade.ProductoFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facadeProducto" class="Facade.ProductoFacade" scope="session"></jsp:useBean>
<%@page session="true"%>
<!DOCTYPE html>
<% 
    HttpSession sesion = request.getSession();
    Usuario admin = new Usuario();

    if(sesion.getAttribute("admin") != null){
        admin = (Usuario) sesion.getAttribute("admin");

    }
    else{
        out.print("<script>location.replace('html/login.jsp');</script>");
    }
    
    String id = request.getParameter("idProducto");
    String nombre = request.getParameter("nombre");
    String cantidad = request.getParameter("cantidad");
    String costo = request.getParameter("costo");
    String img = request.getParameter("img");
    String prov = request.getParameter("proveedor");

    Producto pro = new Producto(Integer.parseInt(id), nombre, Integer.parseInt(cantidad), Double.parseDouble(costo),img,Integer.parseInt(prov));
    
    String msg = facadeProducto.guardarProducto(pro);
    
    ArrayList<Producto> productos = facadeProducto.buscarProductos();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Productos</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        
        <link href="css/dataTable/jquery.dataTables.min.css" rel="stylesheet">
        <link href="css/dataTable/buttons.dataTables.min.css" rel="stylesheet">

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/dataTable/jquery.dataTables.min.js"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Styles -->
        <link rel="stylesheet" href="css/style.css">
    
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="d-flex" id="content-wrapper">
    
            <!-- Sidebar -->
            <div id="sidebar-container" class="bg-primary">
                <div class="logo">
                    <h4 class="text-light font-weight-bold mb-0">DashBoard</h4>
                </div>
                <div class="menu">
                    <a href="dashboard/dash-index.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
                        Tablero</a>
                    <a href="dashboard/dash-usuarios.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                        Usuarios</a>
                    <a href="dashboard/dash-productos.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                        Productos</a>
                    <a href="dashboard/dash-planes.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                        Planes</a>
                </div>
            </div>
    
            <div class="w-100">
             <!-- Navbar -->
             <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <div class="container">
        
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
        
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                      <li class="nav-item dropdown">
                        <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img src="img/otro.png" class="img-fluid rounded-circle avatar mr-2"
                          alt="https://generated.photos/" />
                            <%= admin.getNombre() %>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Mi perfil</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="html/login.jsp?cerrar=true">Cerrar sesión</a>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
              <!-- Fin Navbar -->
    
                <!-- Page Content -->
                <div id="content" class="bg-grey w-100">
        
                    <section class="bg-light py-3">
                        <div class="container" style="margin-left: 20px;">
                            <div class="row">
                                <div class="col-lg-9 col-md-8">
                                    <h1 class="font-weight-bold mb-0">INFORMACION DE PRODUCTOS</h1>
                                    <p class="lead text-muted">Revisa la última información</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                    <!--Agregar Productos-->
                    <div class="card">
                        <div class="container" style="margin-left: 20px;">
                            <div class="col-lg-9 col-md-8">
                                <h5>Agregar Productos
                                    <a href="dashboard/agregarProductos.jsp">
                                        <img src="img/agregarProducto.png" width="50" height="50" >
                                    </a>
                                </h5>
                            </div>
                        </div>

                    </div>


                    <!--tabla de productos-->
                    <section>
                        <div class="card">

                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="tablaProductos" class="table table-bordered">
                                        
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nombre</th>
                                                <th>Cantidad</th>
                                                <th>Costo</th>
                                                <th>URL Imagen</th>
                                                <th>Proveedor</th>
                                                <th>Acciones</th>

                                            </tr>                            
                                        </thead>
                                        <tbody>
                                            <% 
                                                for (Producto producto : productos) {
                                            %>
                                            <tr>                               
                                                <td><%= producto.getId_producto()%></td>
                                                <td><%= producto.getNombre()%></td>
                                                <td><%= producto.getCantidad()%></td>
                                                <td><%= producto.getCosto()%></td>
                                                <td><%= producto.getImg()%></td>
                                                <td><%= producto.getId_proveedor()%></td>
                                                <td>
                                                    <a href="editarProducto.jsp?id=<%= producto.getId_producto()%>">
                                                        <img src="img/editar.png" width="20" height="20" >
                                                    </a>
                                                    <a href="dashboard/dash-productos.jsp?id=<%= producto.getId_producto()%>">
                                                        <img src="img/eliminar.png" width="20" height="20" >
                                                    </a>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="alert alert-success">
                        <%= msg %>
                    </div>
                </div>
            </div>
        </div>
                   
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous">
        </script>
        <script src="js/dataTable/dataTables.buttons.min.js"></script>
        <script src="js/dataTable/buttons.flash.min.js"></script>
        <script src="js/dataTable/jszip.min.js"></script>
        <script src="js/dataTable/pdfmake.min.js"></script>
        <script src="js/dataTable/vfs_fonts.js"></script>
        <script src="js/dataTable/buttons.html5.min.js"></script>
        <script src="js/dataTable/buttons.print.min.js"></script>
        <script type="text/javascript">
                    $(document).ready(function () {
                        $('#tablaProductos').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'excel', 'pdf'
                            ],
                        });
                    });
        </script>
        
        
    </body>
</html>
