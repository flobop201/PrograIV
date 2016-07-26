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
    <%
        foreach (var producto in ListProducts)
        {
    %>
    <div class="grid col-4">
        <div class="prod-thumb">
            <a href="../products/productdetail.aspx">
                <img src="<%  Page.Response.Write(producto.Imagen); %>">
                <span><%  Page.Response.Write(String.Format("{0:C}", producto.Precio)); %></span>
                <h5><%  Page.Response.Write(producto.Producto); %></h5>
            </a>
        </div>
        <div>
            <a class="btn blue wide <% if (producto.Existencia == 0)
                                       {%> disabled <%} %> "
                href="#" role="button">Agregar a la compra</a>
        </div>
        <div class="division"></div>
    </div>
    <% }

    %>
</asp:Content>
