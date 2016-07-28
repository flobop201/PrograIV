jQuery(document).ready(function () {

    $('#search').click(function () {
        var busqueda = $('#busqueda').val();
        
    });

    $('#btnDeleteitem').click(function () {
        var id = $('#id').val();
        deletebyAjax(id);        
    });

    $('#btnRelizarCompra').click(function () {
        realizarComprabyAjax();
    });

    $("#cantidad").bind('keyup mouseup', function () {
        var id = $('#id').val();
        var cantidad = $('#cantidad').val();
        actualizarCantidadbyAjax(id, cantidad);
    });

    $('.btn.blue.carrito').click(function () {

        debugger;
        var codigo = $('#codigo').val();
        var cantidad = 1;
        //var cantidad = $('#cantidad').val();
        agregarCarritobyAjax(codigo, cantidad);
    });
});

function deletebyAjax(id) {

    var actionData = "{'id': '" + id + "'}";
    debugger;
    $.ajax(
    {
        url: "cart.aspx/Eliminar",
        data: actionData,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (msg) {
            //$("#success").show();
            location.reload();
            //alertify.success(msg.d);
        },
        error: function (result) {
            $("#onerror").show();
            //alertify.error("ERROR " + result.status + ' ' + result.statusText);
        }

    });
    debugger;
};

function realizarComprabyAjax() {
    var actionData = "";
    debugger;
    $.ajax(
    {
        url: "cart.aspx/RealizarCompra",
        data: actionData,
        dataType: "json",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        success: function (msg) {           
            //alertify.alert(msg.d);
            location.reload();
        },
        error: function (result) {
            //alertify.error("ERROR " + result.status + ' ' + result.statusText);
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
            //alertify.alert(msg.d);
        },
        error: function (result) {
            //alertify.error("ERROR " + result.status + ' ' + result.statusText);
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
            //alertify.alert(msg.d);
        },
        error: function (result) {
            //alertify.error("ERROR " + result.status + ' ' + result.statusText);
        }

    });
    debugger;
};