<%-- 
    Document   : registroUsuarios
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="DTO.Usuario"%>
<%@page import="Facade.UsuarioFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="Facade.UsuarioFacade" scope="session"></jsp:useBean>
<!DOCTYPE html>
<% 
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fechaNacimiento = request.getParameter("date");
    String tipoDoc = request.getParameter("tipo");
    String documento = request.getParameter("documento");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    String password = request.getParameter("pass");
    
    Usuario us = new Usuario(documento, tipoDoc, nombre, apellido, telefono, Date.valueOf(fechaNacimiento), email, password);
    
    String msg = facade.guardarUsuario(us);
    
    ArrayList<Usuario> usuarios = facade.buscarUsuarios();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro | GymPlus</title>
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
                    <a href="dashboard/dash-index.html" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
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
                            Administrador
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Mi perfil</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="index.html">Cerrar sesión</a>
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
                                    <h1 class="font-weight-bold mb-0">INFORMACION DE USUARIOS</h1>
                                    <p class="lead text-muted">Revisa la última información</p>
                                </div>
                            </div>
                            
                        </div>
                    </section>
                    
                    <!--Agregar Usuarios-->
                    <div class="card">
                        <div class="container" style="margin-left: 20px;">
                            <div class="col-lg-9 col-md-8">
                                <h5>Agregar Usuarios
                                    <a href="dashboard/agregarUs.html">
                                        <img src="img/agregar.png" width="50" height="50" >
                                    </a>
                                </h5>
                            </div>
                        </div>

                    </div>


                    <!--tabla de usuarios-->
                    <section>
                        <div class="card">

                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="tablaUsuarios" class="table table-bordered">
                                        
                                        <thead>
                                            <tr>
                                                <th>Documento</th>
                                                <th>Nombres</th>
                                                <th>Telefono</th>
                                                <th>Fecha Nacimiento</th>
                                                <th>Email</th>
                                                <th>Acciones</th>

                                            </tr>                            
                                        </thead>
                                        <tbody>
                                            <% 
                                                for (Usuario usuario : usuarios) {
                                            %>
                                            <tr>                               
                                                <td><%= usuario.getTipoDoc() + " - " + usuario.getNumeroDoc()%></td>
                                                <td><%= usuario.getNombre() + " " + usuario.getApellido()%></td>
                                                <td><%= usuario.getTelefono()%></td>
                                                <td><%= usuario.getFechaNacimiento()%></td>
                                                <td><%= usuario.getEmail()%></td>
                                                <td>
                                                    <a href="editarUsuario.jsp?numDoc=<%= usuario.getNumeroDoc()%>">
                                                        <img src="img/editar.png" width="20" height="20" >
                                                    </a>
                                                    <a href="dashboard/dash-usuarios.jsp?numDoc=<%= usuario.getNumeroDoc()%>">
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
            crossorigin="anonymous"></script>
            
        
        <script src="js/dataTable/dataTables.buttons.min.js"></script>
        <script src="js/dataTable/buttons.flash.min.js"></script>
        <script src="js/dataTable/jszip.min.js"></script>
        <script src="js/dataTable/pdfmake.min.js"></script>
        <script src="js/dataTable/vfs_fonts.js"></script>
        <script src="js/dataTable/buttons.html5.min.js"></script>
        <script src="js/dataTable/buttons.print.min.js"></script>
        <script type="text/javascript">
                    $(document).ready(function () {
                        $('#tablaUsuarios').DataTable({
                            dom: 'Bfrtip',
                            buttons: [
                                'excel', 'pdf'
                            ],
                        });
                    });
        </script>
        
        
    </body>
</html>
