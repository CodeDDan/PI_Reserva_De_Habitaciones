<%-- 
    Document   : agregar
    Created on : 16/06/2023, 10:26:55
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Usuario</title>
        <!-- Agregamos estilos personalizados para que funcionen con el selector de paises -->
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
        <!-- Para la programación, el atributo importante es name -->
        <form action="UsuarioControlador" method="post">
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Nombre</span>
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
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Apellido</span>
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
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Contraseña</span>
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
            <div class="form-group row" style="margin-bottom: 10px; height: 60px;">
                <span class="col-sm-2 col-form-label">Correo</span>
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
            <div class="form-group row" style="margin-bottom: 10px; height: 60px;">
                <span class="col-sm-2 col-form-label">Dirección</span>
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
            <div class="form-group row" style="margin-bottom: 10px; height: 60px;">
                <span class="col-sm-2 col-form-label">Teléfono</span>
                <div class="col-sm-10">
                    <!-- Se abre como modal, las librerias para esta función están en listar.jsp -->
                    <input type="tel" class="form-control control-telefono" name="telefono" required>
                    <span class="mensaje-feedback" style="margin-left: 10px;"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_usuario" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
    <!-- Propios -->
    <script>
        var url = "js/agregar.js";
        $.getScript(url);
    </script>
</html>
