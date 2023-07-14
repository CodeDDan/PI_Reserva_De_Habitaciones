<%-- 
    Document   : header
    Created on : 14 jul 2023, 08:53:22
    Author     : Daniel
--%>
<%-- Libreria importante para uso de jstl, permite que el código de la página sea más legible--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-container">
    <header class="top-header">
        <div>
            <img src="iconos/Logo_hotel_base.png" alt="Hotel Sanz" class="imagen-logo">
        </div>
        <ul>
            <li><a href="index.jsp"><img src="iconos/icons8_downtown_50px.png" alt="Inicio" class="icono-header">Inicio</a></li>
            <li><a href="habitaciones.jsp"><img src="iconos/icons8_booking_50px.png" alt="Habitaciones" class="icono-header">Habitaciones</a></li>
            <li><a href="#"><img src="iconos/icons8_people_50px.png" alt="Nosotros" class="icono-header">Sobre nosotros</a></li>
            <li><a href="#"><img src="iconos/icons8_image_gallery_50px.png" alt="Galería" class="icono-header">Galería</a></li>
            <li class="barra-vertical"></li>

            <c:choose>
                <c:when test="${sessionScope.usuario == null}">
                    <li><button onclick="window.location.href = 'registro.jsp';" class="boton-registro">Registrarse</button></li>
                    <li>
                        <!-- Button trigger modal -->
                        <button type="button" class="boton-iniciar" data-bs-toggle="modal" data-bs-target="#modalLogin">
                            Iniciar Sesión
                        </button>
                    </li>
                </c:when>
                <c:otherwise>
                    <form id="cerrar-sesion" action="CerrarSesionControlador" method="post" style="display: none;">
                    </form>
                    <li><button class="boton-cerrar" type="submit" form="cerrar-sesion">Cerrar Sesión</button></li>
                    <li><button type="button" class="boton-iniciar">Bienvenido ${usuario.getNombre()}</button></li>
                    </c:otherwise>
                </c:choose>

        </ul>
    </header>
</div>
<!-- Modal -->
<div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <!-- Aquí se modifica el tipo modal -->
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Iniciar Sesión</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formulario-ingreso" action="UsuarioControlador" method="post">
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