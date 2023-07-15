<%-- 
    Document   : registro
    Created on : 14 jul 2023, 08:25:44
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
        <title>Hotel Sanz Registro</title>
        <!--  Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/listar.css">
        <link rel="stylesheet" href="css/registro.css"/>
        <style>
            .texto-valido {
                color: #198754;
            }

            .texto-no-valido {
                color: #dc3545;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="contenedor-form-registro">
            <!-- Para la programación, el atributo importante es name -->
            <form  class="formulario-registro" action="UsuarioControlador" method="post">
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Nombre:</span>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                        <div class="invalid-feedback">
                            Tres o más letras, sin dobles espacios o caracteres especiales 
                        </div>
                        <div class="valid-feedback">
                            Nombre correcto!
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Apellido:</span>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                        <div class="invalid-feedback">
                            Tres o más letras, sin dobles espacios o caracteres especiales 
                        </div>
                        <div class="valid-feedback">
                            Apellido correcto!
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Contraseña:</span>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" aria-describedby="passHelp" placeholder="Contraseña" required>
                        <div class="invalid-feedback">
                            Contraseña mayor a 8 caracteres, al menos 1 dígito y una letra mayúscula
                        </div>
                        <div class="valid-feedback">
                            Luce bien!
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Correo:</span>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="ejemplo@correo.com" required>
                        <div class="invalid-feedback">
                            Ingresa un correo válido por favor.
                        </div>
                        <div class="valid-feedback">
                            Luce bien!
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Dirección:</span>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2" required>
                        <div class="invalid-feedback">
                            Al menos 2 o más letras
                        </div>
                        <div class="valid-feedback">
                            La dirección luce bien!
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <span class="col-sm-2 col-form-label">Teléfono:</span>
                    <div class="col-sm-10">
                        <!-- Se abre como modal, las librerias para esta función están en listar.jsp -->
                        <input type="tel" class="form-control control-telefono" name="telefono" required>
                        <span class="mensaje-feedback" style="margin-left: 10px;"></span>
                    </div>
                </div>
                <!-- Campo oculto para saber desde donde enviamos la acción -->
                <input type="hidden" name="origen" value="registro">
                <button onclick="window.location.href = 'index.jsp';" type="button" class="btn btn-secondary">Regresar</button>
                <button type="submit" name="accion" value="agregar_usuario" class="btn btn-primary">Registrarse</button>
            </form>
        </div>
    </body>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    <!-- Propios, los originales se los extrajo de agregar-->
    <!-- Se debe agregar el index.js porque contiene el script para la función del switch para empleado-->
    <script src="js/index.js"></script>
    <script>
                    var url = "js/agregar.js";
                    $.getScript(url);
    </script>
</html>
