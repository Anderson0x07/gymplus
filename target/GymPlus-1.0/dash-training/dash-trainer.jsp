<%@page import="DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<% 
    HttpSession sesion = request.getSession();
    Usuario admin = new Usuario();

    /*if(sesion.getAttribute("trainer") != null){
        admin = (Usuario) sesion.getAttribute("trainer");

    }
    else{
        out.print("<script>location.replace('../html/login.jsp');</script>");
    }*/
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        
        <title>Dash Trainer</title>
    </head>
    
    <body>
        
        <nav class="navbar navbar-dark bg-dark fixed-top">
          <div class="container-fluid">
            <a class="navbar-brand" href="dash-trainer.jsp">Dashboard Trainer</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
              <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dashboard Entrenador</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
              </div>
              <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dash-trainer.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="usuarios-trainer.jsp">Usuarios</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="usuarios-trainer.jsp">Rutinas</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="usuarios-trainer.jsp">Dietas</a>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="../img/otro.png" width="50" height="50"/>
                        <%= admin.getNombre() %>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" >
                      <li><a class="dropdown-item" href="#">Mi Perfil</a></li>
                      <li>
                        <hr class="dropdown-divider">
                      </li>
                      <li><a class="dropdown-item" href="#">Cerrar sesión</a></li>
                    </ul>
                  </li>        
                </ul>

              </div>
            </div>
          </div>
        </nav> <br><br><br>
        
                    
    
        <!-- Page Content -->
        <div id="content" class="bg-grey w-100">

            <section class="bg-light py-3">
                <div class="container" >
                    <div class="row">
                        <div class="col-lg-9 col-md-8">
                            <h1 class="font-weight-bold mb-0">Bienvenido <%= admin.getNombre() %></h1>
                            <p class="lead text-muted">Revisa la ultima informacion</p>
                        </div>

                    </div>
                </div>
            </section>
                            
                            <div class="col-lg-9 col-md-8">
                            <h1 class="font-weight-bold mb-0">Bienvenido <%= admin.getNombre() %></h1>
                            <p class="lead text-muted">Revisa la ultima informacion</p>
                        </div>


        </div>
    </body>
</html>