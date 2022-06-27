<%-- 
    Document   : index
    Created on : 25/06/2022, 12:32:12 p. m.
    Author     : Anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INDEX MAIN</title>
    </head>
    <body>
        <% 
            HttpSession sesion = request.getSession();
            String email;
            String pass;
            
            if(sesion.getAttribute("user") != null){
                email= sesion.getAttribute("user").toString();
                out.print("<a href='html/login.jsp?cerrar=true'><h5>Cerrar sesion"+ email +"</h5></a>  ");
                
                
            }else{
                out.print("<script>location.replace('html/login.jsp');</script>");
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
