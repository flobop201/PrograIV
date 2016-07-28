<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="UAMShop.category.category" %>

<%@ MasterType VirtualPath="../MasterPages/CategoryTemplate.master" %>
<asp:Content ID="Content3" ContentPlaceHolderID="CategoryNameContentPlaceHolder" runat="server">
    > 
    <%
        string result;
        if (IdCategoria > 0)
        {
            result = (from categorias in Master.ListCategory
                      where categorias.Id == IdCategoria
                      select categorias.Categoria).FirstOrDefault();
        }
        else
        {
            result = "Todas las Categorias";
        }
        Page.Response.Write(result);
           
           
    %>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">
    <div class="alert" id="mensaje">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span>
        <span id="txtMensaje">This is an alert box.</span>
    </div>
    <%
        foreach (var producto in ListProducts)
        {
    %>
    <div class="grid col-4" id="parent">
        <div class="prod-thumb">
            <input id="codigo" type="hidden" value="<%  Page.Response.Write(producto.Codigo); %>" />
            <a href="../products/productdetail.aspx">
                <img src="<%  Page.Response.Write(producto.Imagen); %>">
                <span><%  Page.Response.Write(String.Format("{0:C}", producto.Precio)); %></span>
                <% if (producto.Existencia == 0)
                   {
                %> <font color="red"> <%Page.Response.Write(String.Format("(Agotado)"));%> </font><%
                   }
                   else if (producto.Existencia > 10)
                   {
                %> <font color="green"> <%Page.Response.Write(String.Format("(En Stock)"));%> </font><%
                       
                   }
                   else
                   {
                %> <font color="green"> <%Page.Response.Write(String.Format("({0} en Stock)", producto.Existencia));%> </font><%                       
                   }
                %>
                <h5><%  Page.Response.Write(producto.Producto); %></h5>
            </a>
        </div>
        <div>
            <a class="btn blue wide carrito <% if (producto.Existencia == 0)
                                               {%> disabled <%} %> "
                role="button">Agregar a la compra</a>
        </div>
        <div class="division"></div>
    </div>
    <% }

    %>
</asp:Content>
