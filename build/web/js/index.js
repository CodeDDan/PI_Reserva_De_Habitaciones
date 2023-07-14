$(document).ready(function () {

    // Código necesario para cargar el día actual y el siguiente
    // Fecha actual
    var meses = [
        "enero", "febrero", "marzo", "abril", "mayo", "junio",
        "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"
    ];

    var fechaActual = new Date();
    var diaActual = fechaActual.getDate();
    var mesActual = meses[fechaActual.getMonth()];

    // Obtener el día siguiente sumando 1 al día actual
    var fechaSiguiente = new Date();
    fechaSiguiente.setDate(fechaActual.getDate() + 1);
    var diaSiguiente = fechaSiguiente.getDate();

    // Obtener el nombre del mes siguiente
    var mesSiguiente = meses[fechaSiguiente.getMonth()];

    // Mostrar el día actual y el día siguiente en los divs correspondientes
    $(".dia-actual").text(diaActual + " de " + mesActual);
    $(".dia-siguiente").text(diaSiguiente + " de " + mesSiguiente);

    // Verificar el estado de los campos de entrada al cargar el documento
    checkInputs();

    // Verificar el estado de los campos de entrada en cada cambio de entrada
    $('#email, #password').on('input', function () {
        checkInputs();
    });

    function checkInputs() {
        var nameValue = $('#email').val();
        var passwordValue = $('#password').val();
        var btnIniciar = $('#btnSubmitIngresar');

        // Verificar si ambos campos de entrada están vacíos
        if (nameValue === '' || passwordValue === '') {
            btnIniciar.prop('disabled', true);
        } else {
            btnIniciar.prop('disabled', false);
        }
    }

    var label = $(".label-Empleado");

    $('#switch-Empleado').on('change', function () {
        // Abrimos el collapse para el empleado y a su vez validamos hacia que controlador o acción debe ir
        if ($(this).is(':checked')) {
            $('#collapse-Empleado').collapse('show');
            label.css("color", "#FF7F00");
            $("#btnSubmitIngresar").val("ingresar-Empleado");
        } else {
            $('#collapse-Empleado').collapse('hide');
            $('input[name="nombre"]#name').val(''); // Limpia el valor del input
            label.css("color", "black");
            $("#btnSubmitIngresar").val("ingresar");
        }
    });
}
);
