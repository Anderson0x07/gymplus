<%-- 
    Document   : agregarProductos
    Created on : 24/06/2022, 5:07:11 p. m.
    Author     : Anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Styles -->
        <link rel="stylesheet" href="../css/style.css">
    
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <title>Agregar Productos</title>
    </head>
    <body>
        <div class="d-flex" id="content-wrapper">
    
            <!-- Sidebar -->
            <div id="sidebar-container" class="bg-primary">
                <div class="logo">
                    <h4 class="text-light font-weight-bold mb-0">DashBoard</h4>
                </div>
                <div class="menu">
                    <a href="dash-index.html" class="d-block text-light p-3 border-0"><i class="icon ion-md-apps lead mr-2"></i>
                        Tablero</a>
    
                    <a href="dash-usuarios.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-people lead mr-2"></i>
                        Usuarios</a>
                    <a href="dash-productos.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
                        Productos</a>
                    <a href="dash-planes.jsp" class="d-block text-light p-3 border-0"><i class="icon ion-md-person lead mr-2"></i>
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
                          <img src="../img/otro.png" class="img-fluid rounded-circle avatar mr-2"
                          alt="https://generated.photos/" />
                            Administrador
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">Mi perfil</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="../index.html">Cerrar sesión</a>
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
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <br>
                                            <h1>Agregar Productos</h1>
                                        </div>

                                        <div class="card-body">
                                            <form action="../registroProductos.jsp" method="post">
                                                <div class="form-group">    
                                                    <label for="idProducto" class="form-label">Identificador *</label>
                                                    <input type="number" name="idProducto" id="idProducto" placeholder="Digite el ID del producto" required class="form-control"> <br>
                                                </div> 
                                                <div class="form-group">
                                                    <label for="nombre" class="form-label">Nombre: *</label>
                                                    <input type="text" name="nombre" id="nombre" placeholder="Digite su nombre" required class="form-control"> <br>
                                                </div> 
                                                <div class="form-group">
                                                    <label for="cantidad" class="form-label">Cantidad *</label> 
                                                    <input type="number" name="cantidad" id="cantidad" placeholder="Digite la cantidad disponible" required class="form-control"> <br>
                                                </div>  
                                                
                                                <div class="form-group">
                                                    <label for="costo" class="form-label">Costo: *</label> 
                                                    <input type="text" name="costo" id="costo" placeholder="Digite el costo del producto" required class="form-control"> <br>
                                                </div> 

                                                <div class="form-group">
                                                    <input type="submit" value="Registrar producto" class="btn btn-success"> 
                                                    <input type="reset" value="Limpiar" class="btn btn-danger"> 
                                                </div>

                                            </form>
                                        </div>    
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </section>
        

                </div>
            </div>
        </div>
    
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    </body>
</html>
