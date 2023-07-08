<%-- 
    Document   : registro
    Created on : 29 jun 2023, 22:17:48
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/registro.css">
        <title>Registro</title>
    </head>
    <body>
        <form action="">
            <!--  General -->
            <div class="form-group">
                <h2 class="heading">Formulario de Registro</h2>
                <div class="controls">
                    <input type="text" id="nombre" class="floatLabel" name="nombre" placeholder="Nombre">
                </div>
                <div class="controls">
                    <input type="text" id="email" class="floatLabel" name="email" placeholder="Email">
                </div>
                <div class="controls">
                    <input type="tel" id="telefono" class="floatLabel" name="telefono" placeholder="Teléfono">
                </div>
                <div class="controls">
                    <input type="text" id="direccion" class="floatLabel" name="direccion" placeholder="Direccion">
                </div>
                <div class="controls">
                    <input type="text" id="ciudad" class="floatLabel" name="ciudad" placeholder="Ciudad">
                </div>
                <div class="controls">
                    <input type="text" id="country" class="floatLabel" name="country" placeholder="País">
                </div>
                <div class="controls">
                    <input type="password" id="password" class="floatLabel" name="password" placeholder="Contraseña">
                </div>
            </div>
        </form>
    </body>
</html>
