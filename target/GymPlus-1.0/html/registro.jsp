<%-- 
    Document   : registro
    Created on : 28/06/2022, 5:52:56 p. m.
    Author     : Anderson
--%>

<%@page import="java.sql.Date"%>
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
        <title>Registro | GymPlus</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        
        <link rel='stylesheet' type='text/css' media='screen' href='../css/main.css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src='../js/main.js'></script>
        
    </head>
    <body id="registro">
    
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
                    </div>
                </nav>

            </div>
            <div class="col-1"></div>
        </div>

        <div class="row">
        <div class="col-1"></div>
        <div class="col-10">
        <div class="card">
            <div class="card-header">
                <br>
                <h1>Crear Cuenta</h1>
            </div>
            <div class="card-header">
                <p>¿Ya tienes cuenta? </p>
                <a id="boton" href="login.jsp">Inicia sesion</a>
                <br><br>
            </div>

            <div class="card-body">
                <form action="registro.jsp" method="post">
                    <div class="form-group">
                        <label for="nombre" class="form-label">Nombre: *</label>
                        <input type="text" name="nombre" id="nombre" placeholder="Digite su nombre" required class="form-control"> <br>
                    </div> 
                    <div class="form-group">
                        <label for="apellido" class="form-label">Apellido *</label> 
                        <input type="text" name="apellido" id="apellido" placeholder="Digite su apellido" required class="form-control"> <br>
                    </div> 
                    <div class="form-group">    
                        <label for="date" class="form-label">Fecha de nacimiento *</label>
                        <input type="date" name="date" id="date" required class="form-control"> <br>
                    </div> 
                    <div class="form-group">    
                        <label for="tipo" class="form-label">Tipo de documento: *</label>
                        <select name="tipo" id="tipo" required class="form-control">
                            <option value="CC">Cedula de Ciudadani­a</option>
                            <option value="TI">Tarjeta de Identidad</option>
                            <option value="CE">Cedula de Extranjeri­a</option>
                        </select> <br>
                    </div> 

                    <div class="form-group">    
                        <label for="documento" class="form-label">Documento: *</label>
                        <input type="documento" name="documento" id="documento" placeholder="Digite su documento" required class="form-control"> <br>
                    </div> 

                    <div class="form-group">    
                        <label for="telefono" class="form-label">Telefono movil: *</label>
                        <input type="tel" name="telefono" id="telefono" placeholder="Digite su telefono" required class="form-control"> <br>
                    </div> 
                    <div class="form-group">    
                        <label for="email" class="form-label">Correo electronico: *</label>
                        <input type="email" name="email" id="email" placeholder="Digite su email" required class="form-control"> <br>
                    </div> 
                    <div class="form-group">    
                        <label for="contraseña" class="form-label">Contraseña: *</label>
                        <input type="password" name="pass" id="pass" placeholder="Digite nueva contraseña" required class="form-control"> <br>
                    </div>    
                    <div class="form-group">    
                        <label for="contraseña2" class="form-label">Confirmar contraseña: *</label>
                        <input type="password" name="pass2" id="pass2" placeholder="Confirmación de contraseña" required class="form-control"> <br>
                    </div>  
                    <div class="form-group">
                        <input type="submit" name="registrar" value="Registrarme" class="btn btn-success"> 
                        <input type="reset" value="Limpiar" class="btn btn-danger"> 
                    </div>

                </form>

                
            </div>    
        </div>
        </div>
        <div class="col-1"></div>
        </div> <br><br>
        
        <% if(request.getParameter("registrar") != null){

                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String fechaNacimiento = request.getParameter("date");
                String tipoDoc = request.getParameter("tipo");
                String documento = request.getParameter("documento");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                String plan = request.getParameter("plan");

                Usuario us = new Usuario(documento, tipoDoc, nombre, apellido, telefono, Date.valueOf(fechaNacimiento), email, password,plan);

                String msg = facade.guardarUsuario(us);
                
                HttpSession sesion = request.getSession();

                if(!msg.contains("Error")){ 
                    sesion.setAttribute("user", us);
                    response.sendRedirect("../index.jsp");
                } else{
                    out.write("No se pudo crear la sesion");
                    //response.sendRedirect("login.jsp");
                }
            }
        %> 
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
