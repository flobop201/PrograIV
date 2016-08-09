<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="UAMShop.user.history" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">
    <div class="row">
        <div id="carrito" class="grid col-12">
            <div>
                <table class="cart" cellspacing="0">
                    <tr>
                        <th>Factura</th>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Tarjeta</th>
                        <th>Titular</th>
                    </tr>
                    <% foreach (var compra in ListCompras)
                       {%>
                    <tr>
                        <td><% Page.Response.Write(compra.IdFactura); %></td>
                        <td><% Page.Response.Write(compra.Fecha); %></td>
                        <td><% Page.Response.Write(string.Format("₡ {0:N}", compra.Monto)); %></td>
                        <td><% Page.Response.Write(compra.Tarjeta); %></td>
                        <td><% Page.Response.Write(compra.Titular); %></td>
                    </tr>
                    <% } %>
                </table>
                <br/>
                <% if (!ListCompras.Any())
                   {
                       Page.Response.Write(string.Format("No has realizado ninguna compra recientemente. Mira nuestros productos"));
                %>
                <a href="../category/category.aspx">aqui</a>
                <%
                     } %>
            </div>
        </div>
    </div>
</asp:Content>
