// Para confirmar la eliminación
function clicked(e)
{
    if (!confirm('¿Estás seguro?')) {
        e.preventDefault();
    }
}

$('.boton-editar a').on('click', function () {
    var id = $(this).data('id');
    $.ajax({
        url: 'FacturaControlador?accion=editar&id=' + id,
        type: 'GET',
        success: function (response) {
            $('#modalEditar .modal-body').html(response);
            $('#modalEditar').modal({show: true});
        }
    });
});

// Para abrir los modales
$('.boton-agregar').on('click', function () {
    $.ajax({
        url: 'FacturaControlador?accion=agregar',
        type: 'GET',
        success: function (response) {
            $('#modalAgregar .modal-body').html(response);
            $('#modalAgregar').modal({show: true});
        }
    });
});

$('#buscarInput').on('input', function () {
    var filtro = $(this).val().toLowerCase();
    var longitudTermino = filtro.length;
    var umbralMinimo = calcularUmbralMinimo(longitudTermino);

    $('.tabla-personal tbody tr').each(function () {
        var fila = $(this);
        var coincidenciaEncontrada = false;
        fila.find('td').each(function () {
            var contenido = $(this).text().toLowerCase();
            if (calcularCoincidencia(contenido, filtro, umbralMinimo)) {
                coincidenciaEncontrada = true;
                return false; // Salir del bucle interno
            }
        });
        if (coincidenciaEncontrada || filtro === '') {
            fila.show();
        } else {
            fila.hide();
        }
    });
});

function calcularCoincidencia(cadena1, cadena2, umbralMinimo) {
    var distancia = levenshteinDistance(cadena1, cadena2);
    var longitudMaxima = Math.max(cadena1.length, cadena2.length);
    var porcentaje = 1 - distancia / longitudMaxima;
    return porcentaje >= umbralMinimo;
}

function calcularUmbralMinimo(longitudTermino) {
    var umbralInicial = 0.235; // Umbral mínimo inicial
    var incrementoUmbral = 0.015; // Incremento del umbral por letra adicional
    var umbralMinimo = umbralInicial + longitudTermino * incrementoUmbral;
    return Math.min(umbralMinimo, 0.7); // Limitar el umbral máximo a 1
}

function levenshteinDistance(cadena1, cadena2) {
    var distancia = [];
    for (var i = 0; i <= cadena1.length; i++) {
        distancia[i] = [i];
    }
    for (var j = 1; j <= cadena2.length; j++) {
        distancia[0][j] = j;
    }
    for (var i = 1; i <= cadena1.length; i++) {
        for (var j = 1; j <= cadena2.length; j++) {
            var costo = (cadena1.charAt(i - 1) === cadena2.charAt(j - 1)) ? 0 : 1;
            distancia[i][j] = Math.min(
                    distancia[i - 1][j] + 1,
                    distancia[i][j - 1] + 1,
                    distancia[i - 1][j - 1] + costo
                    );
        }
    }
    return distancia[cadena1.length][cadena2.length];
}

