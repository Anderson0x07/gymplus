<%-- 
    Document   : editarUsuario.jsp
    Created on : 23/05/2022, 9:21:52 p. m.
    Author     : Anderson
--%>

<%@page import="DTO.Plan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Usuario"%>
<%@page import="Facade.UsuarioFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="Facade.UsuarioFacade" scope="session"></jsp:useBean>
<jsp:useBean id="facadeP1" class="Facade.PlanFacade" scope="session"></jsp:useBean>
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
    
    ArrayList<Usuario> usuarios = facade.buscarUsuarios();
    
    String numDoc = request.getParameter("numDoc");
    
    Usuario us = new Usuario();
    us.setNumeroDoc(numDoc);
    
    Usuario usu = new Usuario();
    usu = facade.buscarUsuarioDoc(us); //nuevo usuario con todos los datos del que se buscó por numDoc
    
    ArrayList<Plan> planes = facadeP1.buscarPlanes();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard | Editar</title>
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
                                    <a href="dashboard/agregarUs.jsp">
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
                    
                    
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="card">
                                <div class="card-header">
                                    <h1>Editar Usuario</h1>
                                </div>

                                <div class="card-body">
                                    <%
                                        if (usu!=null){
                                    %>
                                    <form id="frmUsuario" name="frmUsuario" 
                                          action="dashboard/dash-usuarios.jsp" method="post">

                                        <div class="form-group">
                                            <label for="tipo" class="form-label">Tipo de documento: *</label>
                                            <select id="tipo" name="tipo" required class="form-control">
                                                <option value="CC">Cédula de ciudadania</option>
                                                <option value="RC">Registro civil</option>
                                                <option value="TI">Tarjeta de identidad</option>
                                                <option value="PT">Pasaporte</option>
                                            </select>
                                        </div>
                                        <script>
                                            frmUsuario.tipoDocumento.value = '<%= usu.getTipoDoc()%>';
                                        </script>

                                        <div class="form-group">
                                            <label for="documento" class="form-label">Número de documento: *</label>
                                            <input type="text" name="documento" id="documento" 
                                                   placeholder="Digite su número de documento" required
                                                   class="form-control" readonly
                                                   value = "<%= usu.getNumeroDoc()%>">
                                        </div>

                                        <div class="form-group">
                                            <label for="nombre" class="form-label">Nombre: *</label>
                                            <input type="text" name="nombre" id="nombre" 
                                                   placeholder="Digite su nombre" required
                                                   class="form-control"
                                                   value="<%= usu.getNombre() %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="apellido" class="form-label">Apellido: *</label>
                                            <input type="text" name="apellido" id="apellido" 
                                                   placeholder="Digite su apellido" required
                                                   class="form-control"
                                                   value="<%= usu.getApellido() %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="date" class="form-label">Fecha de Nacimiento: *</label>
                                            <input type="date" name="date" id="date" required
                                                   class="form-control"
                                                   value="<%= usu.getFechaNacimiento()%>">
                                        </div>

                                        <div class="form-group">
                                            <label for="telefono" class="form-label">Teléfono:</label>
                                            <input type="text" name="telefono" id="telefono" 
                                                   placeholder="Digite su teléfono" required
                                                   class="form-control"
                                                   value="<%= usu.getTelefono() %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="email" class="form-label">Email: *</label>
                                            <input type="email" name="email" id="email" 
                                                   placeholder="Digite su email" required
                                                   class="form-control" 
                                                   value="<%= usu.getEmail()%>">
                                        </div>

                                        <div class="form-group">
                                            <label for="pass" class="form-label">Password: *</label>
                                            <input type="text" name="pass" id="pass"
                                                   placeholder="Digite su password" required
                                                   class="form-control" 
                                                   value="<%= usu.getPassword()%>">
                                        </div>
                                        
                                        <div class="form-group">    
                                            <label for="plan" class="form-label">Plan: *</label>
                                            <select name="plan" id="plan" required class="form-control">
                                                <%
                                                    for (Plan plan : planes) {
                                                %>
                                                    <option value="<%= plan.getDescripcion()%>"><%= plan.getDescripcion()%></option>
                                                <%
                                                    }
                                                %>
                                            </select> <br>
                                        </div> 
                                        
                                        <br>

                                        <div class="form-group">
                                            <input type="submit" value="Guardar Usuario" class="btn btn-success">
                                            <input type="button" value="Cancelar" 
                                                   name="editar"
                                                   class="btn btn-success">                       
                                        </div>
                                    </form>
                                    <%
                                        } else {  //onclick="location.href='dashboard/dash-usuarios.jsp?documento=<%= usu.getNumeroDoc()% >'"  va aarriba otra opcion
                                    %>

                                        <div id="divMensaje" class="alert alert-danger">
                                            Error: usuario no encontrado.
                                        </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div> 
                        </div>        
                        <div class="col-1"></div>   
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
