<%@page import="DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<% 
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();

    if(sesion.getAttribute("user") != null){
        usuario = (Usuario) sesion.getAttribute("user");

    }
    /* else{
        out.print("<script>location.replace('html/login.jsp');</script>");
    }*/
%>

<html>
    <div id="navbar" class="row" style="margin-bottom: 10px">
            <div class="col-1" ></div>
            <div class="col-10">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    
                    
                        <a class="navbar-brand" href="index.jsp">
                            <i style="font-weight: bold ">Body Health</i>
                        </a>
                      
                      <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav mr-auto">
                            <li><a class="nav-link"  href="index.jsp"><i class="fa-sharp fa-solid fa-house"></i> Home</a></li>
                            <li><a class="nav-link" href="html/planes.jsp"><i class="fa-sharp fa-solid fa-tag"></i> Planes</a></li>
                            <li><a class="nav-link" href="html/noticias.html"><i class="fa-solid fa-newspaper"></i> Noticias</a></li>
                            <li><a class="nav-link" href="html/productos.jsp"><i class="fa-sharp fa-solid fa-shop"></i> Productos</a></li>
                            
                        </ul>
                        
                      </div>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown" style="justify-content:flex-end;">
                        <div class="dropdown-divider"></div>   
                        <% 
                            if(sesion.getAttribute("user") != null){ 
                        %>
                           
                            <div>
                                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                                    <li class="nav-item dropdown">
                                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                          <img src="img/otro.png" class="img-fluid" width="50" height="50" />
                                          <%= usuario.getNombre() %>
                                      </a>
                                      <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="mi-perfil.jsp"><i class="fa-solid fa-circle-user"></i> Mi Perfil</a></li>
                                        <li><a class="dropdown-item" href="html/carrito.jsp"><i class="fa-sharp fa-solid fa-cart-shopping"></i> Carrito</a></li>
                                        <div class="dropdown-divider"></div>
                                        <li><a class="dropdown-item" href="html/login.jsp?cerrar=true"><i class="fa-solid fa-circle-info fa-beat-fade" style="--fa-beat-fade-opacity: 0.67; --fa-beat-fade-scale: 1.075;" ></i> Cerrar Sesion</a></li>
                                      </ul>
                                    </li>
                                </ul>
                            </div>
                        <% 
                            } else{ 
                        %>
                        <ul class="navbar-nav mr-auto">
                            <li><a class="nav-link" href="html/login.jsp"><i class="fa-solid fa-circle-user"></i> Login</a></li>
                            
                        </ul>
                        
                        <% 
                            } 
                        %> 
                        
                        </div>
                </nav>

            </div>
            <div class="col-1"></div>
        </div>     
</html>