<%-- 
    Document   : mis_reservas
    Created on : 12 sept 2023, 18:14:30
    Author     : Daniel
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ModeloCombinadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--  Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Reservas realizadas</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/habitaciones.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="card-container">
            <%
                ModeloCombinadoDAO mcd = new ModeloCombinadoDAO();
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                List<String> detalles = mcd.detallesHabitacionReserva(Integer.parseInt(usuario.getId()));
                String imagenPrincipal = "";
                int count = 0;
                for (String detalle : detalles) {
                    if (count % 3 == 0 && count > 0) {
            %>
        </div>
        <div class="card-container">
            <% }
                String[] elementos = detalle.split(", ");
                String habitacionId = elementos[0];
                String cardDetalle = elementos[2];
                String cardTipo = elementos[3];
                String cardText = elementos[4];
                String capacidad = elementos[5];
                String numeroPersonas = elementos[7];
                String fechaLlegada = elementos[8];
                String fechaPartida = elementos[9];
                String buttonLabel = "Ver detalles " + elementos[1];

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
                    <div class="input-group mb-2">
                        <button class="btn btn-outline-dark" type="button" style="min-width: 220px">Fecha de Llegada</button>
                        <button class="btn active btn-outline-dark" type="button"><%= fechaLlegada %></button>
                    </div>
                    <div class="input-group mb-2">
                        <button class="btn btn-outline-dark" type="button" style="min-width: 220px">Fecha de Partida</button>
                        <button class="btn active btn-outline-dark" type="button"><%= fechaPartida %></button>
                    </div>
                    <div class="input-group mb-2">
                        <button class="btn btn-outline-dark" type="button" style="min-width: 220px">Cantidad de Personas</button>
                        <button class="btn active btn-outline-dark" type="button"><%= numeroPersonas%></button>
                    </div>
                    <button type="button" class="btn btn-primary boton-modal-propio" data-bs-toggle="modal" data-bs-target="#modal<%= count%>"><%= buttonLabel%></button>
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
                            <form action="ReservaControlador">
                                <input type="hidden" name="habitacion-id" value="<%= habitacionId%>">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    count++;
                }
            %>
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
    <!-- Se debe agregar el index.js porque contiene el script para la función del switch para empleado-->
    <script src="js/index.js"></script>
</html>
