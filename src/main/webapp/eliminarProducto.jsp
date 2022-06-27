<%-- 
    Document   : eliminarProducto
    Created on : 25/05/2022, 2:41:58 p. m.
    Author     : Anderson
--%>

<%@page import="DTO.Producto"%>
<%@page import="Facade.ProductoFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facadeProducto" class="Facade.ProductoFacade" scope="session"></jsp:useBean>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
    
    Producto producto = new Producto();
    producto.setId(Integer.parseInt(id));
    
    String msg = facadeProducto.eliminarProducto(producto);
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard | Eliminar</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
    </head>
    <body>
        <div class="card">
            <div class="card-header">
                <h1>Eliminar Producto</h1>
            </div>
            <div class="card-body">
                <%
                    if(msg.contains("Error")){
                %>
                
                    <div class="alert alert-danger">
                        <%= msg %>
                    </div>
                <%
                    } else {
                %>

                    <div class="alert alert-success">
                        <%= msg %>
                    </div>
                <%
                    }
                %>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <td>ID del producto: </td>
                            <td><%= producto.getId() %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="card-footer">
                <input type="button" value="Volver" 
                               onclick="location.href='dashboard/dash-productos.jsp'"
                               class="btn btn-success">                      
            </div>
        </div>
    </body>
</html>
