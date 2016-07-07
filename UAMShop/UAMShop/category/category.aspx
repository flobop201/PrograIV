<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="UAMShop.category.category" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CategoryNameContentPlaceHolder" runat="server">
    Categoria escogida
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">
    <!--Iterar cuantas veces sea necesario -->
    <div class="grid col-4">
        <div class="prod-thumb">
            <a href="detail.html">    
                <img src="../img/banner_01.png">
                <span>$80.00</span>
                <h5>Producto 1</h5>
            </a>
        </div>
        <div><a class="btn blue wide" href="#" role="button">Agregar a la compra</a></div>
        <div class="division"></div>
    </div>
    <div class="grid col-4">
        <div class="prod-thumb">                    
            <a href="detail.html">    
                <img src="../img/banner_02.png">
                <span>$80.00</span>
                <h5>Producto 2</h5>
            </a>
        </div>
        <div><a class="btn blue wide" href="#" role="button">Agregar a la compra</a></div>
        <div class="division"></div>
    </div>
    <div class="grid col-4">
        <div class="prod-thumb">                    
            <a href="detail.html">    
                <img src="../img/banner_03.png">
                <span>$80.00</span>
                <h5>Producto 3</h5>
            </a>
        </div>
        <div><a class="btn blue wide" href="#" role="button">Agregar a la compra</a></div>
        <div class="division"></div>
    </div>
    <div class="grid col-4">
        <div class="prod-thumb">                    
            <a href="detail.html">    
                <img src="../img/banner_04.png">
                <span>$80.00</span>
                <h5>Producto 4</h5>
            </a>
        </div>
        <div><a class="btn blue wide" href="#" role="button">Agregar a la compra</a></div>
        <div class="division"></div>
    </div>
</asp:Content>