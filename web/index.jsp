<%-- 
    Document   : index
    Created on : 12 jul 2023, 21:21:06
    Author     : Daniel
--%>

<%@page import="ModeloDAO.UsuarioDAO"%>
<%-- Libreria importante para uso de jstl, permite que el código de la página sea más legible--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
    Código para forzar el cierre de sesión
<%
    if (session != null) {
        session.invalidate(); // Cerrar la sesión si existe
    }
%>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- Es importante que la referencia esté correctamente indicada o no sirven los estilos -->
        <!-- Flatpickr calendario -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <title>Hotel Sanz</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <% if (session.getAttribute("error") != null) {%>
        <div class="alert alert-danger alert-dismissible fade show alerta-personalizada" role="alert">
            <strong>Error!</strong> <%= session.getAttribute("error")%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% }%>
        <% if (session.getAttribute("ingreso-exitoso") != null) {%>
        <div class="alert alert-primary alert-dismissible fade show alerta-personalizada" role="alert">
            <strong>Cuenta creada!</strong> <%= session.getAttribute("ingreso-exitoso")%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <%
                session.removeAttribute("ingreso-exitoso");
            %>
        </div>
        <% }%>
        <section class="principal">
            <div class="texto-principal">
                <div style="font-size: 30px; padding: 2px 0;">Hotel Sanz</div>
                <h2>Duerme como un rey, despierta como una estrella.</h2>
            </div>
        </section>
        <div class="registro-rapido">
            <div class="registro-rapido-acciones">
                <form class="formulario-rapido" method="post">
                    <input type="date" class="flatpickr-input llegada" id="llegada" name="llegada" placeholder="Llegada">
                    <input type="date" class="flatpickr-input partida" id="salida" name="salida" placeholder="Salida">
                    <button class="boton-registro-rapido">Reserva rápida, 1 persona</button>
                </form>
            </div>
        </div>
        <div class="seccion-fotos">
            <img src="imagenes/hotel_1.jpg" alt="Hotel_1" style="border-radius: 10px 0 0 10px;"/>
            <img src="imagenes/hotel_2.jpg" alt="Hotel_2"/>
            <img src="imagenes/hotel_3.jpg" alt="Hotel_3"/>
            <img src="imagenes/hotel_4.jpg" alt="Hotel_4"/>
            <img src="imagenes/hotel_5.jpg" alt="Hotel_5"/>
            <img src="imagenes/hotel_6.jpg" alt="Hotel_6" style="border-radius: 0 10px 10px 0;"/>
        </div>
        <!-- <div><a href="HabitacionControlador?accion=listar">Listar</a></div> -->
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
    <!-- Flatpickr -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/es.js"></script>
    <script src="js/index.js"></script>
    <script src="js/calendario.js"></script>
</html>

