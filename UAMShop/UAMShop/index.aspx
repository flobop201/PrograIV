<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MainTemplate.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UAMShop.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="slider" style="overflow: hidden; height: 700px;">
        <img class="mySlides" src="../img/mac-coffee-laptops-1920x1080-wallpaper.jpg" />
        <img class="mySlides" src="../img/apple-drone-Introduction.jpg" />
        <img class="mySlides" src="../img/Gadgets Computers Tablets Surface UHD.jpg" />
        <img class="mySlides" src="../img/maxresdefault.jpg" />

        <a class="btn-floating" style="left: 0" onclick="prograIV.slider.plusDivs(-1)">❮</a>
        <a class="btn-floating" style="right: 0" onclick="prograIV.slider.plusDivs(1)">❯</a>
    </section>

    <section class="container" style="margin-top: -200px;">
        <div class="row">
            <%
                foreach (var producto in listProducts)
                {
            %>
            <div class="grid col-3">
                <div class="small-banner">
                    <a href="products/productdetail.aspx">
                        <img src="<%  Page.Response.Write(producto.Imagen); %>" />
                        <span><%  Page.Response.Write(String.Format("{0:C}", producto.Precio)); %></span>
                        <h3><%  Page.Response.Write(producto.Producto); %></h3>
                        <span>Comprar ahora!</span>
                    </a>
                </div>
            </div>
            <% }

            %>
            <%--<div class="grid col-3">
                <div class="small-banner">
                    <a href="#">
                        <img src="../img/banner_02.png">
                        <h5>Producto1</h5>
                        <span>Comprar ahora!</span>
                    </a>
                </div>
            </div>
            <div class="grid col-3">
                <div class="small-banner">
                    <a href="#">
                        <img src="../img/banner_03.png">
                        <h5>Producto1</h5>
                        <span>Comprar ahora!</span>
                    </a>
                </div>
            </div>
            <div class="grid col-3">
                <div class="small-banner">
                    <a href="#">
                        <img src="../img/banner_04.png">
                        <h5>Producto1</h5>
                        <span>Comprar ahora!</span>
                    </a>
                </div>
            </div>--%>
        </div>
    </section>

    <div class="division"></div>

    <section class="grey-bg">
        <div class="division"></div>
        <div class="container">
            <div class="row">
                <div class="grid col-6">
                    <h2>Bienvenidos</h2>
                    <p>
                        Te presentamos este servicio web creado por estudiantes de la Universidad Americana, que te permite realizar compras por internet desde cualquier sitio con conexión a internet.
                       <p>
                           Esta herramienta ha sido diseñada pensando en tu comodidad, en este sitio podra encontrar muchos productos sin tener que hacer filas, todo mas facil al alcance de un click.
                       <p>Para nosotros es un gusto atender todas sus consultas.</p>
                </div>
                <div class="grid col-6">
                    <h2>Sobre Nosotros</h2>
                    <p>
                        UAM Shop es una propuesta a un prototipo de compras por internet que ha sido desarrollado durante el segundo cuatrimestre del 2016.<br>
                        Este prototipo sera evaluado para ser implementado en linea y que las personas puedan realizar sus pedidos por internet ofreciendo calidad y buen servicio a sus usuarios.
                    </p>
                </div>
            </div>
        </div>
        <div class="division"></div>
    </section>
</asp:Content>
