
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Planes | GymPlus</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../css/main.css'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1193c03dcb.js" crossorigin="anonymous"></script>
    
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

    <h1>PLANES DE GYMPLUS</h1>
    
    
    <%
        if(usuario.getNombre() != null){
    %>
        <%
            if(usuario.getId_plan() != null){
        %>
            <p><%= usuario.getNombre() %> cuentas con el plan <%= usuario.getId_plan()%></p> <br>
        <%
            }
            else {
        %>
                <p><%= usuario.getNombre() %> usted aun no cuenta con un plan, a continuacion te enseñaremos los diferentes planes que ofrece Health and Body</p> <br>
        <%
            }
        %>
    <%
        } else{
    %>
            <p> A continuacion te enseñaremos los diferentes planes que ofrece Health and Body</p>
    <%
        }
    %>
    

    <div class="row">
        <div class="col-4" align="center"> 
            <div class="card" style="width: 25rem;">
                <div class="card-header">    
                    <h2 class="card-title">PLAN NUTRICIONAL</h2>
                </div>
                <img src="../img/alimentacionsana.webp" class="card-img-top" alt="IMAGEN PERIODICO" width="150px">
                <div class="card-body">
                    <p class="card-text">Diagnostico a partir de tus habitos de alimentacion y ejercicio por un profesional.</p>
                    <p class="card-text">Acceso a recetas y planes de alimentacion.</p>
                    <p class="card-text">Asesori­a nutricional, recibe tres sesiones.</p>
                    <p class="card-text">Plan de alimentacion personalizado vi­a E-mail.</p>
                    
                </div>
                <a id="boton" href="#">Escoger Plan</a>
            </div> <br>
            
            
        </div>
        <div class="col-4" align="center">
            <div class="card" style="width: 25rem;">
                <div class="card-header">    
                    <h2 class="card-title">PLAN BASICO</h2>
                </div>
                <img src="../img/Basico.jpeg" class="card-img-top" alt="MANCUERNA" width="150px">
                <div class="card-body">
                    <p class="card-text">Area de peso libre, peso integrado, cardio y clases grupales.</p>
                    <p class="card-text">Asesori­a de los entrenadores de planta.</p>
                    <p class="card-text">Zona cardio</p>
                    <p class="card-text">Musculacion</p>
                </div>
                <a id="boton" href="#">Escoger Plan</a>
            </div> <br>
            
        </div>
        <div class="col-4" align="center">
            <div class="card" style="width: 25rem;">
                <div class="card-header">    
                    <h2 class="card-title">PLAN AVANZADO</h2>
                </div>
                <img src="../img/Avanzado.jpeg" class="card-img-top" alt="MANCUERNA" width="150px">
                <div class="card-body">
                    <p class="card-text">Area de peso libre, peso integrado, cardio y clases grupales.</p>
                    <p class="card-text">Asesori­a de los entrenadores de planta.</p>
                    <p class="card-text">Acceso al sistema de Reserva para ingresar al gimnasio.</p>
                </div>
                <a id="boton" href="#">Escoger Plan</a>
            </div> <br>
            
        </div>
    </div>
    <br> <br>
    
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