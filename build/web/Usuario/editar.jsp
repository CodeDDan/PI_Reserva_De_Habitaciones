<%-- 
    Document   : editar
    Created on : 6 jul 2023, 18:14:48
    Author     : Daniel
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
        <!-- El objeto en cuestión se lo genera en el controlador -->
    </head>
    <body>
        <form action="UsuarioControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${usu.getId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Nombre</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="${usu.getNombre()}" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Apellido</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="apellido" placeholder="Apellido" value="${usu.getApellido()}" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Contraseña</span>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" aria-describedby="passHelp" placeholder="Contraseña" value="${usu.getPass()}" required>
                    <small id="passHelp" class="form-text text-muted" style="margin-left: 13px;">Más de 8 caracteres</small>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Correo</span>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="ejemplo@correo.com" value="${usu.getCorreo()}" required>
                    <small id="emailHelp" class="form-text text-muted" style="margin-left: 13px;">Comprobar el valor correcto</small>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Dirección</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2" value="${usu.getDireccion()}" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px;">
                <span class="col-sm-2 col-form-label">Teléfono</span>
                <div class="col-sm-10">
                    <input type="tel" class="form-control control-telefonoE" name="telefono" value="${usu.getTelefono()}" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </body>
    <!-- Propios -->
    <script>
        var url = "js/editar.js";
        $.getScript(url);
    </script>
</html>
