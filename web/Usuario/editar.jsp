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
    <center>
        <form action="UsuarioControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${usu.getId()}"><br>
            <input type="text" name="nombre" placeholder="Nombre" value="${usu.getNombre()}"><br>
            <input type="text" name="apellido" placeholder="Apellido" value="${usu.getApellido()}"><br>
            <input type="password" name="password" placeholder="Contraseña" value="${usu.getPass()}"><br>
            <input type="email" name="correo" placeholder="Correo" value="${usu.getCorreo()}"><br>
            <input type="text" name="direccion" placeholder="Dirección" value="${usu.getDireccion()}"><br>
            <input type="text" name="telefono" placeholder="Teléfono" value="${usu.getTelefono()}"><br>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </center>
</body>
</html>
