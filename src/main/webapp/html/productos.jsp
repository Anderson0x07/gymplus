<%-- 
    Document   : productos
    Created on : 24/06/2022, 7:13:26 p. m.
    Author     : Anderson
--%>

<%@page import="DTO.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Producto"%>
<%@page import="Facade.ProductoFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facadeP" class="Facade.ProductoFacade" scope="session"></jsp:useBean>
<%@page session="true"%>
<!DOCTYPE html>

<%
    ArrayList<Producto> productos = facadeP.buscarProductos();
    
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();

    if(sesion.getAttribute("user") != null){
        usuario = (Usuario) sesion.getAttribute("user");

    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos | GymPlus</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='../css/main.css'>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1193c03dcb.js" crossorigin="anonymous"></script>

    </head>
    <body id="body-index">
        <!--barra navegacion-->
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="../index.jsp">
                            <img src="../img/gym-plus.png" alt="Gym Plus">
                        </a>
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <a class="nav-link"  href="../index.jsp">Inicio</a>
                            <a class="nav-link" href="planes.jsp">Planes</a>
                            <a class="nav-link" href="noticias.html">Noticias</a>
                            <a class="nav-link" href="productos.jsp">Productos</a>
                        </ul>

                      </div>
                      
                        <% 
                            if(sesion.getAttribute("user") != null){ 
                        %>

                            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                                <div class="container">

                                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                  </button>

                                  <div class="collapse navbar-collapse" id="navbarSupportedContent">

                                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                                        <li class="nav-item dropdown">
                                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                              <img src="../img/otro.png" width="50" height="50" />
                                              <%= usuario.getNombre() %>
                                          </a>
                                          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                            <li><a class="dropdown-item" href="../mi-perfil.jsp">Mi Perfil</a></li>
                                            <div class="dropdown-divider"></div>
                                            <li><a class="dropdown-item" href="login.jsp?cerrar=true">Cerrar Sesion</a></li>
                                          </ul>
                                        </li>
                                    </ul>
                                  </div>
                                </div>
                            </nav>
                        <% 
                            } else {
                        %>
                                <a id="boton"  href="login.jsp">Log in</a> &nbsp &nbsp 
                                <a id="boton" href="registro.jsp">Sign in</a> &nbsp &nbsp 
                        <% 
                            } 
                        %>
                        
                    </div>
                </nav>

            </div>
            <div class="col-1"></div>
        </div><hr><br>

        <div class="container">
            <div class="row">
                <!-- Elementos generados a partir del JSON -->
                
                
                <% 
                    for (Producto producto : productos) {
                %>
                    <div class="card" style="width: 20rem;">
                        <br><h4 class="card-title"><%= producto.getNombre()%></h4>
                        <p style="font-size: xx-small">(<%= producto.getCantidad()%>)</p>
                        <img src="<%= producto.getImg()%>" class="card-img-top">
                        
                        <p class="card-text">$ <%= producto.getCosto()%></p>
                        <a id="boton" href="#">Añadir...</a><br>
                    </div> 
                <%
                    }
                %>
                
                
            </div>
        </div> <br><br>

        <div id="footer">
            <script> $("#footer").load("/src/main/webapp/components/footer.html");</script>
        </div>

    </body>
</html>
