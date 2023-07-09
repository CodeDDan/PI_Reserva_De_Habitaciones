// Control de envío
function actualizarBotonEnvio() {
    var hayCamposInvalidos = $('input.is-invalid').length > 0;
    var hayCamposVacios = $('input[name="nombre"]').val() === '' ||
            $('input[name="apellido"]').val() === '' ||
            $('input[name="correo"]').val() === '' ||
            $('input[name="password"]').val() === '' ||
            $('input[name="direccion"]').val() === '' ||
            $('input[name="telefono"]').val() === '';

    if (hayCamposInvalidos || hayCamposVacios) {
        $('button[name="accion"][value="actualizar"]').attr('disabled', 'disabled');
    } else {
        $('button[name="accion"][value="actualizar"]').removeAttr('disabled');
    }
}

//Ejecutamos la función cuando cargue el documento
$(document).ready(function () {
    actualizarBotonEnvio();
});

$('input[name="nombre"],    input[name="apellido"]').on('input', function () {
    // Validar el valor del nombre utilizando una expresión regular
    var nombre = $(this).val();
    // Permite caracteres españoles, con una longitud de 3 hasta 64, sin numeros y no mas de 2 espacios
    var nombreValido = /^[\wáéíóúñÁÉÍÓÚ\s]{3,64}$/.test(nombre) && !/\d/.test(nombre) && !/\s{2,}/.test(nombre);

    // Agregar o quitar las clases de Bootstrap según la validez del nombre
    if (nombreValido) {
        $(this).removeClass('is-invalid');
        $(this).addClass('is-valid');
    } else {
        $(this).removeClass('is-valid');
        $(this).addClass('is-invalid');
    }

    actualizarBotonEnvio();
});

$('input[name="nombre"], input[name="apellido"]').on('keypress', function (event) {
    var key = event.which || event.keyCode;
    var char = String.fromCharCode(key);
    var isNumber = /\d/.test(char);

    if (isNumber) {
        event.preventDefault();
    }
});

// Agregar un event listener para el evento 'input'
$('input[name="password"]').on('input', function () {
    // Validar el valor de la contraseña utilizando expresiones regulares
    var contrasena = $(this).val();

    // Verificar la longitud mínima
    var longitudValida = contrasena.length >= 8;

    // Verificar la complejidad y combinación de mayúsculas, minúsculas y números
    var complejidadValida = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/.test(contrasena);

    // Agregar o quitar las clases de Bootstrap según la validez de la contraseña
    if (longitudValida && complejidadValida) {
        $(this).removeClass('is-invalid');
        $(this).addClass('is-valid');
    } else {
        $(this).removeClass('is-valid');
        $(this).addClass('is-invalid');
    }
    actualizarBotonEnvio();
});

// Agregar un event listener para el evento 'input'
$('input[name="correo"]').on('input', function () {
    // Validar el valor del correo utilizando una expresión regular
    var correo = $(this).val();
    var correoValido = /^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$/.test(correo);
    // Agregar o quitar las clases de Bootstrap según la validez del correo
    if (correoValido) {
        $(this).removeClass('is-invalid');
        $(this).addClass('is-valid');
    } else {
        $(this).removeClass('is-valid');
        $(this).addClass('is-invalid');
    }
    actualizarBotonEnvio();
});

$('input[name="direccion"]').on('input', function () {
    // Validar el valor de la dirección utilizando una expresión regular
    var direccion = $(this).val();
    // Al menos 2 letras y un espacio seguido de 2 letras más
    var direccionValida = /^[a-zA-Z0-9\s]{2,}$/.test(direccion);

    // Agregar o quitar las clases de Bootstrap según la validez de la dirección
    if (direccionValida) {
        $(this).removeClass('is-invalid');
        $(this).addClass('is-valid');
    } else {
        $(this).removeClass('is-valid');
        $(this).addClass('is-invalid');
    }
    actualizarBotonEnvio();
});

// Tenemos que envolver la inicialización en document.ready para que se ejecute cada que se carga
$(document).ready(function () {

    const phoneInputField = $(".control-telefonoE");
    const phoneInput = window.intlTelInput(phoneInputField[0], {
        initialCountry: "ec",
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
    });

    //Formateamos el número con cada input
    phoneInputField.on("input", function () {
        const phoneNumber = phoneInput.getNumber(); // Obtén el número de teléfono formateado
        phoneInputField.val(phoneNumber); // Vuelve a establecer el número formateado en el campo de entrada
    });

    // Formateamos el número antes de enviarlo 
    $('button[name="accion"][value="actualizar"]').on("click", function () {
        const phoneNumber = phoneInput.getNumber(); // Obtén el número de teléfono formateado
        phoneInputField.val(phoneNumber); // Vuelve a establecer el número formateado en el campo de entrada
    });

    // Desactivar ingreso de letras en el campo de teléfono
    phoneInputField.on("keypress", function (event) {
        const key = event.which || event.keyCode;
        const char = String.fromCharCode(key);
        const isLetter = /[a-zA-Z]/.test(char);
        if (isLetter) {
            event.preventDefault();
        }
    });

    function validatePhoneNumber() {
        const isValid = phoneInput.isValidNumber();
        // Recupera el código del país por letra
        const countryCode = phoneInput.getSelectedCountryData().iso2;
        // Si se desea traducir el código del país, se debe crear un mapa, ejemplo;
        //    const countryCodeMapping = {
        //  "ec": "+593", // Ecuador
        //  "us": "+1",   // Estados Unidos
        //};
        // Luego
        // const countryCodeNumeric = countryCodeMapping[countryCodeAlpha2];

        if (isValid) {
            $(this).removeClass('is-invalid');
            $(this).addClass('is-valid');
            $('.mensaje-feedback').removeClass('texto-no-valido').addClass('texto-valido').text('Teléfono válido!');
        } else {
            $(this).removeClass('is-valid');
            $(this).addClass('is-invalid');
            $('.mensaje-feedback').removeClass('texto-valido').addClass('texto-no-valido').text('Teléfono no válido!');
        }
        actualizarBotonEnvio();
    }

    phoneInputField.on("input", validatePhoneNumber);
});
