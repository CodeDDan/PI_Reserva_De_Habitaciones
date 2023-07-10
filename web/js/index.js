$(document).ready(function () {

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
if ($(this).is(':checked')) {
$('#collapse-Empleado').collapse('show');
        label.css("color", "#FF7F00");
} else {
$('#collapse-Empleado').collapse('hide');
        $('input[name="nombre"]#name').val(''); // Limpia el valor del input
        label.css("color", "black");
}
});
        }
);