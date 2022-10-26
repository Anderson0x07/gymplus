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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1193c03dcb.js" crossorigin="anonymous"></script>
        
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

        <div id="footer">
            <script> $("#footer").load("/src/main/webapp/components/footer.html");</script>
        </div>

    </body>
</html>
