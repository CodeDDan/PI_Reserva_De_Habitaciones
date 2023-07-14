<%-- 
    Document   : habitaciones
    Created on : 9 jul 2023, 20:50:25
    Author     : Daniel
--%>

<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ModeloCombinadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--  Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Sanz Habitaciones</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/habitaciones.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="contenedor-texto-inicial">
            <div class="texto-inicial">
                Su estadía con Hotel Sanz incluye los siguientes servicios
            </div>
        </div>
        <div class="contenedor-lista">
            <ul class="lista-servicios">
                <li><img src="iconos/icons8-garage-50.png" alt="Inicio" class="icono-header">Estacionamiento</li>
                <li><img src="iconos/icons8-wifi-50.png" alt="Inicio" class="icono-header">WiFi</li>
                <li><img src="iconos/icons8-poolside-bar-50.png" alt="Inicio" class="icono-header">Restaurante</li>
                <li><img src="iconos/icons8-pool-50.png" alt="Inicio" class="icono-header">Piscina al aire libre</li>
                <li><img src="iconos/icons8-gym-50.png" alt="Inicio" class="icono-header">Gimnasio</li>
                <li><img src="iconos/icons8-pets-50.png" alt="Inicio" class="icono-header">Habitación para mascotas</li>
                <li><img src="iconos/icons8-meeting-room-50.png" alt="Inicio" class="icono-header">Centro de negocios</li>
            </ul>
        </div>
        <div class="card-container">
            <%
                ModeloCombinadoDAO mcd = new ModeloCombinadoDAO();
                List<String> detalles = mcd.detallesHabitaciones();
                String imagenPrincipal = "";
                int count = 0;
                for (String detalle : detalles) {
                    if (count % 3 == 0 && count > 0) {
            %>
        </div>
        <div class="card-container">
            <% }
                String[] elementos = detalle.split(", ");
                String cardDetalle = elementos[2];
                String cardTipo = elementos[3];
                String cardText = elementos[4];
                String capacidad = elementos[5];
                String buttonLabel = "Tarifas desde " + elementos[6] + " $";

            %>
            <div class="card">
                <%                    int hab_Id = Integer.valueOf(elementos[0]);
                    List<String> imagenes = mcd.imagenesHabitacion(hab_Id);
                    String imgPath = "/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg";
                    if (imagenes.isEmpty()) {
                        imagenPrincipal = "";
                        imagenes.add(imgPath);
                    }
                %>
                <!-- Aquí la imagen del card, se utiliza un carrousel-->
                <div id="carousel<%=count%>" class="carousel slide" data-bs-ride="carousel"> <!-- Puede generar problemas data-bs-ride="carousel"-->
                    <div class="carousel-indicators">
                        <%
                            int iter = 0;
                            for (String imagen : imagenes) {
                                if (iter == 0) {
                                    imagenPrincipal = imagen;
                        %>
                        <button type="button" data-bs-target="#carousel<%= count%>" data-bs-slide-to="<%= iter%>" class="active" aria-current="true" aria-label="Slide <%= iter + 1%>"></button>
                        <%
                        } else {

                        %>
                        <button type="button" data-bs-target="#carousel<%= count%>" data-bs-slide-to="<%= iter%>" aria-label="<%= iter + 1%>"></button>
                        <% }
                                iter++;
                            }
                        %>
                    </div>
                    <div class="carousel-inner">
                        <%
                            int val = 0;
                            for (String imagen : imagenes) {

                                if (val == 0) {

                        %>
                        <div class="carousel-item active">
                            <img src="<%=imagen%>" class="d-block w-100" onerror="this.src='/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg';" alt="/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg" style="width: 100%; height: 220px; object-fit: cover;">
                        </div>
                        <% } else {

                        %>
                        <div class="carousel-item">
                            <img src="<%=imagen%>" class="d-block w-100" onerror="this.src='/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg';" alt="/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg" style="width: 100%; height: 220px; object-fit: cover;">
                        </div>
                        <%                        }
                                val++;
                            }
                        %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%=count%>" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel<%=count%>" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!-- Aquí termina el carrousel, se usa comunmente es: -->
                <!--img src="..." class="card-img-top" alt="..." style="width: 100%; height: 220px; object-fit: cover;"-->
                <div class="card-body">
                    <h5 class="card-title"><%= cardTipo%></h5>
                    <p class="card-text"><%= cardText%></p>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal<%= count%>"><%= buttonLabel%></button>
                </div>
            </div>
            <!-- Modal dinámico-->
            <div class="modal fade" id="modal<%= count%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <!-- Aquí se modifica el tipo modal -->
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Detalles</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <img src="<%=imagenPrincipal%>" class="d-block w-100" onerror="this.src='/PI_Reserva_De_Habitaciones/imagenes/hotel_2.jpg';" style="width: 100%; height: 220px; object-fit: cover; border-radius: 10px;">
                            <div style="margin-top: 10px;"></div>
                            <h4 style="text-align: center;">Habitación <%= cardTipo%></h4>
                            <div style="border-bottom: 1px solid #bdc3c7; margin: 5px 0;"></div>
                            <h5 style="color: #555; margin-top: 10px;">Aspectos importantes</h5>
                            <h7><%= cardDetalle%></h7>
                            <div style="margin-top: 10px;"></div>
                            <h6>Capacidad máxima <%= capacidad%> persona/s</h6>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" form="formulario-ingreso" class="btn btn-primary" name="accion" value ="ingresar">Reservar</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    count++;
                }
            %>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="modalRegistro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- Aquí se modifica el tipo modal -->
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Iniciar Sesión</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formulario-ingreso" action="AccesoControlador" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Correo</label>
                                <input type="text" class="form-control" id="email" name="correo" placeholder="Ingresa tu correo" autocomplete="on" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña" autocomplete="off" required>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="switch-Empleado">
                                <label class="form-check-label label-Empleado" for="switch-Empleado" style="margin-left: 20px;">Empleado</label>
                            </div>
                            <div class="collapse" id="collapse-Empleado">
                                <div class="mb-3" style="margin-top: 10px;">
                                    <label for="name" class="form-label">Nombre</label>
                                    <input type="password" class="form-control" id="name" name="nombre" placeholder="Ingresa tu nombre" autocomplete="on">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" form="formulario-ingreso" class="btn btn-primary btn-submitI" id="btnSubmitIngresar" name="accion" value ="ingresar">Ingresar</button>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <h3>©2023 Daniel Sánchez</h3>
            <h4>Proyecto Integrador de Reserva de Habitaciones - Todos los derechos reservados</h4>
            <ul>
                <li><img src="iconos/icons8_linkedin_50px.png" alt="LinkedIn" class="icono-footer"></li>
                <li><img src="iconos/icons8_github_50px.png" alt="GitHub" class="icono-footer"></li>
                <li><img src="iconos/icons8_instagram_50px.png" alt="Instagram" class="icono-footer"></li>
                <li><img src="iconos/icons8_twitter_50px.png" alt="Twitter" class="icono-footer"></li>
            </ul>
        </footer>
    </body>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Se debe agregar el index.js porque contiene el script para la función del switch para empleado-->
    <script src="js/index.js"></script>
</html>
