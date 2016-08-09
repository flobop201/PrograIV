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
        debugger;
        var $parent = $(this).parents('#parent');
        var id = $('#id', $parent).val();
        var cantidad = $('#cantidad', $parent).val();
        actualizarCantidadbyAjax(id, cantidad);
    });

    $('#search').click(function () {
        realizarBusquedabyAjax();
    });

    $('.btn.blue.carrito').click(function () {
        debugger;
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
    debugger;
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

function realizarComprabyAjax(correo, titular, tarjeta) {
    var actionData = "{'correo': '" + correo + "', 'titular': '" + titular + "', 'tarjeta': '" + tarjeta + "' }";
    debugger;
    $.ajax(
    {
        url: "cart.aspx/RealizarCompra",
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
    debugger;
};

function actualizarCantidadbyAjax(id, cantidad) {
    var actionData = "{'id': '" + id + "', 'cantidad': '" + cantidad + "'}";

    debugger;
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
    debugger;
};

function agregarCarritobyAjax(codigo, cantidad) {
    var actionData = "{'codigo': '" + codigo + "', 'cantidad': '" + cantidad + "'}";

    debugger;
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
    debugger;
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

function MostrarLogoutCarrito() {
    debugger;
    alertify.success('Sesion finalizada');
};