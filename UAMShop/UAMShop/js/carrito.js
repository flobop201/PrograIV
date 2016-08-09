jQuery(document).ready(function () {
    /*$('.alert').hide();  */

    $('.btnDeleteitem').click(function () {
        var $parent = $(this).parents('#parent');
        var id = $('#id', $parent).val();
        deletebyAjax(id, $(this));
    });

    $('#btnRelizarCompra').click(function () {
        var correo = $('#correo').val();
        var titular = $('#titular').val();
        var tarjeta = $('#tarjeta').val();
        realizarComprabyAjax(correo, titular, tarjeta);
    });

    $(".cantidad").bind('keyup mouseup', function () {
        var $parent = $(this).parents('#parent');
        var id = $('#id', $parent).val();
        var cantidad = $('#cantidad', $parent).val();
        actualizarCantidadbyAjax(id, cantidad);
    });

    $('#search').click(function () {
        realizarBusquedabyAjax();
    });

    $('.btn.blue.carrito').click(function () {
        var $parent = $(this).parents('#parent');
        var codigo = $('#codigo', $parent).val();
        var cantidad = 1;
        //var cantidad = $('#cantidad').val();
        agregarCarritobyAjax(codigo, cantidad);
    });
});

function realizarBusquedabyAjax() {
    debugger;
    var newUrl = "../category/category.aspx?search=" + $('#busqueda').val();
    window.location.href = newUrl;
};

function deletebyAjax(id, $self) {
    var actionData = "{'id': '" + id + "'}";
    $.ajax(
    {
        url: "cart.aspx/Eliminar",
        data: actionData,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            var $parent = $self.parents('.listaCarrito');
            $parent.hide();
            alertify.success(msg.d);
        },
        error: function (result) {
            alertify.error(result.d);
        }
    });
};

function validarEmail(valor) {
    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(valor);
}

function validarCreditCard(creditcarnumber) {
    debugger;
    var isamex = false;
    var isvisa = false;
    var ismastercard = false;
    var returnvalue = '';

    //Validar AMEX
    var amexcardno = /^(?:3[47][0-9]{13})$/;
    if (creditcarnumber.match(amexcardno)) {
        isamex = true;
    }
    else {
        isamex = false;
    }

    //Validar VISA
    var visacardno = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
    if (creditcarnumber.match(visacardno)) {
        isvisa = true;
    }
    else {
        isvisa = false;
    }

    //Validar MASTERCAD
    var mastercardno = /^(?:5[1-5][0-9]{14})$/;
    if (creditcarnumber.match(mastercardno)) {
        ismastercard = true;
    }
    else {       
        ismastercard = false;
    }


    if (!isvisa && !isamex && !ismastercard) {
        returnvalue= 'INVALID';
    } else {
        if (isvisa) {
            returnvalue= 'VISA';
        }
        if (isamex) {
            returnvalue= 'AMEX';
        }
        if (ismastercard) {
            returnvalue= 'MASTERCARD';
        }
    }
    return returnvalue;
}

function realizarComprabyAjax(correo, titular, tarjeta) {
    debugger;
    var valido = 1;
    var result = validarEmail(correo);
    if (result == false) {
        valido = 0;
        alertify.error('Ingrese un correo valido...');
    }

    if (titular == '') {
        valido = 0;
        alertify.error('Ingrese el titular de la tarjeta...');
    }

    var resultValidation = validarCreditCard(tarjeta);
    if (resultValidation == 'INVALID') {
        valido = 0;
        alertify.error('Numero de tarjeta invalido...');
    }

    if (valido == 1) {
        var actionData = "{'correo': '" + correo + "', 'titular': '" + titular + "', 'tarjeta': '" + tarjeta + "' }";
        $.ajax(
        {
            url: "cart.aspx/RealizarCompra",
            data: actionData,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (msg) {
                var $parent = $('.checkout');
                $parent.hide();
                var $parent2 = $('.listaCarrito');
                $parent2.hide();
                alertify.success(msg.d);
            },
            error: function (result) {
                alertify.error(result.d);
            }
        });
    }

};

function actualizarCantidadbyAjax(id, cantidad) {
    var actionData = "{'id': '" + id + "', 'cantidad': '" + cantidad + "'}";

    $.ajax(
    {
        url: "cart.aspx/ActualizarCantidad",
        data: actionData,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            location.reload();
        },
        error: function (result) {
        }

    });
};

function agregarCarritobyAjax(codigo, cantidad) {
    var actionData = "{'codigo': '" + codigo + "', 'cantidad': '" + cantidad + "'}";

    $.ajax(
    {
        url: "category.aspx/AgregarCarrito",
        data: actionData,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            alertify.success(msg.d);
        },
        error: function (result) {
            alertify.error(result.d);
        }

    });
};

function DesplegarCredencialesInvalidas(mensaje) {
    setTimeout(function () {
        $('.alert').show();
        $('#txtMensaje').text(mensaje);
        $('#mensaje').addClass("alert");
    }, 0);
}

$("#cantidad").keypress(function (evt) {
    evt.preventDefault();
    var elid = $(document.activeElement).hasClass('cantidad');
    console.log(e.keyCode + ' && ' + elid);
    if (e.keyCode === 8 && !elid) {
        return false;
    };
});

