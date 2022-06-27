<%-- 
    Document   : Login
--%>

<%@page import="DTO.Usuario"%>
<%@page import="Facade.UsuarioFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="Facade.UsuarioFacade" scope="session"></jsp:useBean>
<%@page session="true" %>

<!DOCTYPE html>
<% 
    String email = request.getParameter("email");
    String password = request.getParameter("pass");
    
    Usuario usuario = new Usuario();
    
    usuario.setEmail(email);
    usuario.setPassword(password);
    
    String msg = facade.buscarUsuario(usuario);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | GymPlus</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <div class="card">
            <div class="card-header">
                <h1>Login</h1>
            </div>
            <div class="card-body">
                <%
                    if(msg.contains("Error")){
                %>
                
                    <div class="alert alert-danger">
                        <%= msg %>
                    </div>
                    <input type="button" value="Volver a Intentar" 
                              onclick="location.href='html/login.html'" 
                              class="btn btn-success">
                <%
                    } else {
                %>

                    <div class="alert alert-success">
                        <%= msg %>
                    </div>
                
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <td>Email </td>
                            <td><%= email %></td>
                        </tr>
                        <tr>
                            <td>Pass </td>
                            <td><%= password%></td>
                        </tr>
                    </table>
                </div>
            </div>
                        
            <div class="card-footer">
                
                    <%
                        if(usuario.getEmail().equals("admin@gymplus.com") && usuario.getPassword().equals("admin")){ //es el admin
                    %>
                       <input type="button" value="Continuar" 
                              onclick="location.href='dashboard/dash-index.html'" 
                              class="btn btn-success">
                    <%
                        } else{
                    %>
                       <input type="button" value="Continuar" 
                              onclick="location.href='index.html'" 
                              class="btn btn-success">
                    <%
                        }
                    %>
            </div>
                <%
                    }
                %>
            
        </div>
        
        
    </body>
</html>
