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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1193c03dcb.js" crossorigin="anonymous"></script>    

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
        <br><br>

        <div class="container">
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

        <div id="footer">
            <script> $("#footer").load("/src/main/webapp/components/footer.html");</script>
        </div>

    </body>
</html>
