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
        <!-- Propios -->
        <script src="js/agregar.js"></script>
    </head>
    <body>
        <!-- Para la programación, el atributo importante es name -->
        <form action="UsuarioControlador" method="post">
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Nombre</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Apellido</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Contraseña</span>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" aria-describedby="passHelp" placeholder="Contraseña" required>
                    <small id="passHelp" class="form-text text-muted" style="margin-left: 13px;">Más de 8 caracteres</small>
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
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Dirección</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Teléfono</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="telefono" placeholder="+000 000 000 0000" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_usuario" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
</html>
