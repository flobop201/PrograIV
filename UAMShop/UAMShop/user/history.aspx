<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="UAMShop.user.history" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">
    <div class="row">
        <div id="carrito" class="grid col-12">
            <div>
                <table class="cart" cellspacing="0">
                    <tr>
                        <th colspan="2">Factura</th>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Tarjeta</th>
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
                        <td><% Page.Response.Write(string.Format("{0:C}", item.Precio)); %></td>
                        <td>
                            <input id="cantidad" class="cantidad" type="number" step="1" min="1" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="<% Page.Response.Write(item.Cantidad); %>" title="Qty" class="input-text qty text"></td>
                        <td><% Page.Response.Write(string.Format("{0:C}", item.Cantidad * item.Precio)); %></td>
                        <td><a class="btn red wide btnDeleteitem" role="button"><i class="fa fa-times"></i></a></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
