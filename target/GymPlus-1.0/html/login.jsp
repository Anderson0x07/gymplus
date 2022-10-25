<%-- 
    Document   : login
    Created on : 25/06/2022, 11:55:56 a. m.
    Author     : Anderson
--%>

<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.Usuario"%>
<%@page import="Facade.UsuarioFacade"%>
<jsp:useBean id="facade" class="Facade.UsuarioFacade" scope="session"></jsp:useBean>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel='stylesheet' type='text/css' media='screen' href='../css/main.css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src='../js/main.js'></script>

        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <!-- Nuestro css-->
        <link rel="stylesheet" type="text/css" href="../css/login.css" th:href="@{/css/login.css}">
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
                        <a id="boton" href="registro.jsp">Sign in</a> &nbsp &nbsp 
                        
                    </div>
                </nav>

            </div>
            <div class="col-1"></div>
        </div><hr>

        <div>
        <div class="col-4 main-section" style="margin-top: 70px">
            <div class="modal-content">
                <div class="col-12 user-img">
                    <img src="../img/otro.png"/>
                </div>

                <form action="login.jsp" method="post">
                    <div class="form-group" id="user-group">
                        <input type="email" class="form-control" placeholder="Correo electrónico" name="email" required/>
                    </div> <br>
                    <div class="form-group" id="contrasena-group">
                        <input type="password" class="form-control" placeholder="Contraseña" name="pass" required/>
                    </div> <br>

                    <button type="submit" name= "iniciar" class="btn btn-primary"> <i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                </form>
                <div class="col-12">
                    <input type="button" value="Cancelar" name="cancelar" onclick="location.href='../index.jsp'" class="btn btn-danger">
                </div>
                <br>
                
                <% if(request.getParameter("iniciar") != null){
                
                        String email = request.getParameter("email");
                        String password = request.getParameter("pass");

                        Usuario usuario = new Usuario();
                        usuario.setEmail(email);
                        usuario.setPassword(password);
                        
                        Usuario us = new Usuario();

                        us = facade.buscarUsuario(usuario);
                                                
                        HttpSession sesion = request.getSession();
                
                        if(us != null){ 
                            if(us.getEmail().equals("admin@gymplus.com") && us.getPassword().equals("admin")){ //admin
                                sesion.setAttribute("admin", us);
                                response.sendRedirect("../dashboard/dash-index.jsp");
                            }
                            else{
                                sesion.setAttribute("user", us);
                                response.sendRedirect("../index.jsp");
                            }
                        } else{
                        %>
                            <div class="alert alert-danger">
                                Error al inicar sesión, intente nuevamente
                            </div>
                        <%  
                        }
                        %>
                
                
                <%
                    } 

                    if(request.getParameter("cerrar") != null ){
                        session.invalidate();
                    }
                %>
                
                
                

            </div>
        </div>
        </div>
        <br><br>
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
