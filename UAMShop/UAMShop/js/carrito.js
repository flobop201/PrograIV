jQuery(document).ready(function () {

    $('.alert').hide();

    $('#search').click(function () {
        var busqueda = $('#busqueda').val();        
    });

    $('.btnDeleteitem').click(function () {
        debugger;
        var $parent = $(this).parents('#parent');
        var id = $('#id', $parent).val();       
        deletebyAjax(id, $(this));        
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
        var $parent = $(this).parents('#parent');
        var codigo = $('#codigo', $parent).val();
        var cantidad = 1;
        //var cantidad = $('#cantidad').val();
        agregarCarritobyAjax(codigo, cantidad);
    });
});

function deletebyAjax(id, $self) {

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
            var $parent = $self.parents('.listaCarrito');
            $parent.hide();
            $('.alert').show();
            $('#txtMensaje').text(msg.d);
            $('#mensaje').addClass("info");           
        },
        error: function (result) {
            $('.alert').show();
            $('#txtMensaje').text(result.d);
            $('#mensaje').addClass("alert");
        }
    });   
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
            $('.listaCarrito').hide();
            $('.alert').show();
            $('#txtMensaje').text(msg.d);
            $('#mensaje').addClass("success");
        },
        error: function (result) {
            $('.alert').show();
            $('#txtMensaje').text(result.d);
            $('#mensaje').addClass("alert");
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
            $('.alert').show();
            $('#txtMensaje').text(msg.d);
            $('#mensaje').addClass("info");
        },
        error: function (result) {
            $('.alert').show();
            $('#txtMensaje').text(result.d);
            $('#mensaje').addClass("alert");
        }

    });
    debugger;
};