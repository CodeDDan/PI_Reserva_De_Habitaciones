<%-- 
    Document   : agregar
    Created on : 17 jul 2023, 23:02:19
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Factura</title>
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
        <form action="FacturaControlador" method="post">
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Código</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="codigo" placeholder="Código" required>
                    <div class="invalid-feedback">
                        Tres o más letras, sin espacios o caracteres especiales 
                    </div>
                    <div class="valid-feedback">
                        Código correcto!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Fecha de emisión</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="fecha" placeholder="Fecha de Emisión" required>
                    <div class="invalid-feedback">
                        Ingrese una fecha en formato válido
                    </div>
                    <div class="valid-feedback">
                        Fecha correcta!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Monto total</span>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="monto" placeholder="Monto total" required>
                    <div class="invalid-feedback">
                        Ingrese un monto correcto
                    </div>
                    <div class="valid-feedback">
                        Luce bien!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Estado de la factura</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="estado" placeholder="Estado de la factura" required>
                    <div class="invalid-feedback">
                        Escoga un valor correcto
                    </div>
                    <div class="valid-feedback">
                        Valor correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">ID de Pago</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="pago-id" placeholder="ID de pago asociado" required>
                    <div class="invalid-feedback">
                        Escoga un valor correcto
                    </div>
                    <div class="valid-feedback">
                        Valor correcto
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_factura" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
</html>

