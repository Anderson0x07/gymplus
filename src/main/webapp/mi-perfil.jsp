<%-- 
    Document   : mi-perfil
    Created on : 30/06/2022, 1:58:51 a. m.
    Author     : Anderson
--%>

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
        <title>Mi Perfil</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1193c03dcb.js" crossorigin="anonymous"></script>
        
    </head>
    <body id="body-index">
        
        <!--barra navegacion-->
        <div id="navbar">
             <script>$("#navbar").load("components/navbar.jsp");</script>
        </div>


        <br><br>
        <h1>Mi Perfil</h1>
        <p>
            Documento: <%= usuario.getTipoDoc()%>    <%=usuario.getNumeroDoc() %>  <br>
            Nombre: <%= usuario.getNombre() %> <br>
            Apellido: <%= usuario.getApellido()%> <br>
            Telefono: <%= usuario.getTelefono()%> <br>
            E-mail: <%= usuario.getEmail()%> <br>
            <%
                if(usuario.getId_plan() != null){
            %>
                Plan: <%= usuario.getId_plan()%> <br>
            <%
                } else{
            %>
                Plan: Aún no cuenta con un plan.
            <%
                } 
            %>
            
        </p>
        <br><br>

        

        <!--CARRUSEL-->
        <div class="row">
            <div class="col-2"></div>

            <div class="col-8">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="https://www.divulgaciondinamica.es/wp-content/uploads/2020/11/personas-que-buscan-estetica.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://bodytech.com.co/uploads/post/03d28af749454db285945cd083f60507/234-las-manos-en-el-gym.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://blog.smartfit.com.mx/wp-content/uploads/2022/03/en-cuanto-tiempo-se-ven-los-resultados-del-gym-1.jpg" class="d-block w-100" alt="...">
                      </div>
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
        
        <br><br>

        <div id="footer">
            <script> $("#footer").load("/src/main/webapp/components/footer.html");</script>
        </div>
        
    </body>
    
</html>
