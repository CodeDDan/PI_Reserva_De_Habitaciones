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
    </head>
    <body>
        <!-- Para la programación, el atributo importante es name -->
        <form action="UsuarioControlador" method="post">
            <div class="form-group row" style="margin-bottom: 10px;">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" placeholder="Nombre">
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <label class="col-sm-2 col-form-label">Apellido</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="apellido" placeholder="Apellido">
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <label class="col-sm-2 col-form-label">Contraseña</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" aria-describedby="passHelp" placeholder="Contraseña">
                    <small id="passHelp" class="form-text text-muted">Más de 8 caracteres</small>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <label class="col-sm-2 col-form-label">Correo</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="ejemplo@correo.com">
                    <small id="emailHelp" class="form-text text-muted">Comprobar el valor correcto</small>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <label>Dirección</label>
                <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2">
            </div>
            <div class="form-group">
                <label>Teléfono</label>
                <input type="text" class="form-control" name="telefono" placeholder="+000 000 000 0000">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_usuario" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
</html>
