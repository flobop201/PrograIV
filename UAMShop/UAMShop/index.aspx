<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MainTemplate.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UAMShop.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<section class="slider"  style="overflow: hidden;height: 700px;">
		<img class="mySlides" src="../img/mac-coffee-laptops-1920x1080-wallpaper.jpg"/>
		<img class="mySlides" src="../img/apple-drone-Introduction.jpg"/>
		<img class="mySlides" src="../img/Gadgets Computers Tablets Surface UHD.jpg"/>
		<img class="mySlides" src="../img/maxresdefault.jpg"/>

		<a class="btn-floating" style="left:0" onclick="prograIV.slider.plusDivs(-1)">❮</a>
		<a class="btn-floating" style="right:0" onclick="prograIV.slider.plusDivs(1)">❯</a>
	</section>

	<section class="container" style="margin-top: -200px;">
		<div class="row">
			<div class="grid col-3">
			    <div class="small-banner">			    	
			    	<a href="#">
				    	<img src="../img/banner_01.png">
				    	<h5>Producto1</h5>
				    	<span>Comprar ahora!</span>
			    	</a>
			    </div>
			</div>
			<div class="grid col-3">
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
			</div>
		</div>
	</section>

	<div class="division"></div>

	<section class="grey-bg">
		<div class="division"></div>
		<div class="container">
			<div class="row">
				<div class="grid col-6">
				    <h2>Bienvenidos</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				</div>
				<div class="grid col-6">
				    <h2>Sobre Nosotros</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>  
				</div>
			</div>
		</div>
		<div class="division"></div>
	</section>
</asp:Content>
