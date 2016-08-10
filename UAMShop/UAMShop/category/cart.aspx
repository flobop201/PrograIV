<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="UAMShop.category.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CategoryNameContentPlaceHolder" runat="server">
    Compras
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">

    <div id="carrito" class="grid col-12">
        <div>
            <table class="cart" cellspacing="0">
                <tr>
                    <th colspan="2">Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th></th>
                </tr>
                <% foreach (var item in ListCarrito)
                   {%>
                <tr id="parent" class="listaCarrito">
                    <td>
                        <input type="hidden" id="id" value="<% Page.Response.Write(item.Id); %>" />
                        <img src="<% Page.Response.Write(item.Imagen); %>" height="45">
                    </td>
                    <td><% Page.Response.Write(item.Descripcion); %></td>
                    <td><% Page.Response.Write(string.Format("₡{0:N}", item.Precio)); %></td>
                    <td>
                        <input id="cantidad" class="cantidad" type="number" step="1" min="1" max="100" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="<% Page.Response.Write(item.Cantidad); %>" title="Qty" class="input-text qty text"></td>
                    <td><% Page.Response.Write(string.Format("₡ {0:N}", item.Cantidad * item.Precio)); %></td>
                    <td><a class="btn red wide btnDeleteitem" role="button"><i class="fa fa-times"></i></a></td>
                </tr>
                <% } %>
            </table>
        </div>
        <div class="division"></div>
        <br>
        <style>
            .checkout input,
            .checkout select
            {
                width: 100%;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px #ddd;
                border-radius: 4px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 12px;
                padding-bottom: 12px;
            }
        </style>
        <% if (ListCarrito.Any())
           {%>
        <div id="checkout" class="checkout" style="border-radius: 5px; background-color: #f2f2f2; padding: 40px;">
            <h3>Realizar Compra</h3>
            <label for="correo">* Correo Electronico:</label>
            <input type="email" id="correo" placeholder="Enviar correo a" value="<% Page.Response.Write(Session["usuario_correo"]);%> " />
            <label for="titular">* Titular Tarjeta:</label>
            <input type="text" id="titular" style="text-transform: uppercase" placeholder="Nombre en la tarjeta" />
            <label for="tarjeta">* Numero Tarjeta: (  <i class="fa  fa-cc-amex blue"></i>- <i class="fa  fa-cc-mastercard blue"></i>- <i class="fa  fa-cc-visa blue"></i>)</label>
            <input type="text" id="tarjeta" placeholder="Tarjeta Debito / Credito, sin guiones"/>
            <label for="montototal">Monto Total:</label>
            <input type="text" readonly="readonly" id="montototal" value="<% Page.Response.Write(string.Format("₡{0:N}", ListCarrito.Sum(a => a.Cantidad * a.Precio))); %>" />
            <div>
                <br>
                <a id="btnRelizarCompra" class="btn blue wide" role="button">Proceder con la compra <i class="fa fa-chevron-right"></i></a>
            </div>
        </div>
        <br>
        <% }
           else
           {%>
        <span style="width: 70%; font-weight: 600; color: gray; max-width: 25em; margin-left: auto; margin-right: auto;">
            <%  Page.Response.Write(string.Format("No hay articulos en el carrito de compras. Mira nuestros productos")); %>
            <a href="../category/category.aspx">aqui</a>
        </span>
        <%} %>
        <div class="division"></div>
        <div class="alert hide" id="mensaje">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span>
            <span id="txtMensaje">Texto de Alerta</span>
        </div>
    </div>
    <div class="division"></div>

</asp:Content>
