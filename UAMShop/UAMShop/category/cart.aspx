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
                <tr  id="parent" class="listaCarrito">
                    <td>
                        <input type="hidden" id="id" value="<% Page.Response.Write(item.Id); %>" />
                        <img src="<% Page.Response.Write(item.Imagen); %>" width="45" height="45">
                    </td>
                    <td><% Page.Response.Write(item.Descripcion); %></td>
                    <td><% Page.Response.Write(string.Format("{0:C}", item.Precio)); %></td>
                    <td>
                        <input id="cantidad" type="number" step="1" min="1" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="<% Page.Response.Write(item.Cantidad); %>" title="Qty" class="input-text qty text"></td>
                    <td><% Page.Response.Write(string.Format("{0:C}", item.Cantidad * item.Precio)); %></td>
                    <td><a class="btn red wide btnDeleteitem" role="button"><i class="fa fa-times"></i></a></td>
                </tr>
                <% } %>
            </table>
        </div>
        <div class="division"></div>
        <div>
            <a id="btnRelizarCompra" class="btn blue wide" role="button">Proceder con la compra <i class="fa fa-chevron-right"></i></a>
        </div>
        <div class="division"></div>
        <div class="alert hide" id="mensaje">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span>
            <span id="txtMensaje">This is an alert box.</span>
        </div>
    </div>
    <div class="division"></div>

</asp:Content>
