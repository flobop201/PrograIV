<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MainTemplate.Master" AutoEventWireup="true" CodeBehind="productdetail.aspx.cs" Inherits="UAMShop.products.productdetail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%  Page.Response.Write("Detalle de producto " + CodigoProducto); %>
</asp:Content>
