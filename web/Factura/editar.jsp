<%-- 
    Document   : editar
    Created on : 17 jul 2023, 23:02:33
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Factura</title>
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
            <input type="hidden" name="id_edit" value="${fac.getId()}">
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Código</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="codigo" placeholder="Código" value="${fac.getCodigo()}" required>
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
                    <input type="text" class="form-control" name="fecha" placeholder="Fecha de Emisión" value="${fac.getFechaDeEmision()}" required>
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
                    <input type="number" class="form-control" name="monto" placeholder="Monto total" value="${fac.getMontoTotal()}"required>
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
                    <input type="text" class="form-control" name="estado" placeholder="Estado de la factura" value="${fac.getEstadoDeFactura()}"required>
                    <div class="invalid-feedback">
                        Escoga un valor correcto
                    </div>
                    <div class="valid-feedback">
                        Valor correcto
                    </div>
                </div>
            </div>
                    <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">ID Pago</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="estado" placeholder="Estado de la factura" value="${fac.getPagoId()}"required>
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
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </body>
</html>
