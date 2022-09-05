<%@page import="DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<% 
    HttpSession sesion = request.getSession();
    Usuario usuario = new Usuario();

    if(sesion.getAttribute("user") != null){
        usuario = (Usuario) sesion.getAttribute("user");

    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Carro de Compras | GymPlus</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../css/main.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src='../js/main.js'></script>
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
    
    <h1>MI CARRITO</h1>

    <h3>Total: </h3>

    <p>Completa tu plan...</p>
    <br><br><br>

</body>
<footer id="footer">
    <br><br><hr>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            
            <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark" id="nav-footer">
                <div class="container-fluid">
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
                    <a id="boton" href="carrito.jsp">
                          <img src="../img/carrito.png" alt="carrito" width="35px">
                    </a>
                    <% 
                        }
                    %>
                </div>
            </nav> 

        </div>
        <div class="col-2"></div>
    </div> <hr> <br>



    <div class="row">
        <div class="col-6">
            <div style="font-size: 11pt;">
                <p>Envíanos un mensaje a Whatsapp o escríbenos un correo</p>

                <a href="https://api.whatsapp.com/send?phone=573219238493&text=Hola%20gymplus%2C%20quisiera%20saber%20que%20precios%20manejan%20de%20los%20planes%20%3F" target="_blank" style="text-decoration: none; color: white;">
                    <img src="https://assets.stickpng.com/images/580b57fcd9996e24bc43c543.png" alt="logo_whatsapp" width="4%">
                    +57 3219238493
                </a> <br>
                <a href="mailto:gymplus.co@gmail.com" target="_blank" style="text-decoration: none; color: white;">
                    <img src="https://www.aliarango.com/wp-content/uploads/2018/12/email.png" alt="logo_gmail" width="5%">
                    gymplus@gmail.com
                </a>
            </div>

        </div>
        <div class="col-6">
            <div style="font-size: 11pt;">
                <p>Siguenos en nuestras redes sociales</p>
                <a href="https://www.facebook.com/Gym-plus-106609758773964/" target="_blank" style="text-decoration: none;">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="logo-facebook" width="5%">
                </a>
                <a href="https://www.instagram.com/gymplus.co/?hl=es" target="_blank" style="text-decoration: none;">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png" alt="logo-instagram" width="5%">
                </a>
                <a href="https://twitter.com/Gymplus_" target="_blank" style="text-decoration: none;">
                    <img src="https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2013/08/17981-logo-twitter.png?itok=Ba6ST1-S" alt="logo-twitter" width="5%">
                </a>
            </div>
        </div>
    </div>  


    <br><br>
    <h6>Copyright ©2022 © Gimnasio GymPlus - Cucuta - Norte de Santander - Colombia</h6>
    <br><br>
</footer>
</html>