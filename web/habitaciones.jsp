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
        <div class="header-container">
            <header class="top-header">
                <div>
                    <img src="iconos/Logo_hotel_base.png" alt="Hotel Sanz" class="imagen-logo">
                </div>
                <ul>
                    <li><a href="index.html"><img src="iconos/icons8_downtown_50px.png" alt="Inicio" class="icono-header">Inicio</a></li>
                    <li><a href="habitaciones.jsp"><img src="iconos/icons8_booking_50px.png" alt="Habitaciones" class="icono-header">Habitaciones</a></li>
                    <li><a href="#"><img src="iconos/icons8_people_50px.png" alt="Nosotros" class="icono-header">Sobre nosotros</a></li>
                    <li><a href="#"><img src="iconos/icons8_image_gallery_50px.png" alt="Galería" class="icono-header">Galería</a></li>
                    <li class="barra-vertical"></li>
                    <li><button class="boton-registro" onclick="location.href = 'Controlador?accion=registro'">Registrarse</button></li>
                    <li><!-- Button trigger modal -->
                        <button type="button" class="boton-iniciar" data-bs-toggle="modal" data-bs-target="#modalRegistro">
                            Iniciar Sesión
                        </button>
                    </li>
                </ul>
            </header>
        </div>
        <div class="card-container">
            <%
                ModeloCombinadoDAO mcd = new ModeloCombinadoDAO();
                List<String> detalles = mcd.detallesHabitaciones();
                int count = 0;
                for (String detalle : detalles) {
                    if (count % 3 == 0 && count > 0) {
            %>
        </div>
        <div class="card-container">
            <% }
                String[] elementos = detalle.split(", ");
                String cardTitle = elementos[3];
                String cardText = elementos[2];
                String buttonLabel = "Tarifas desde " + elementos[5] + " $";
            %>
            <div class="card">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%= cardTitle%></h5>
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
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Detalles <%= elementos[0]%></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>Capacidad máxima <%= elementos[4]%></h5>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" form="formulario-ingreso" class="btn btn-primary" id="btnSubmitIngresar" name="accion" value ="ingresar">Reservar</button>
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
</html>
