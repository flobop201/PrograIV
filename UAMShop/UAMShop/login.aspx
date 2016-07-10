<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MainTemplate.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UAMShop.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        footer{
            bottom: 0px;
            position: fixed;
            left: 0;
            right: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
		<div class="container">
			<div class="division"></div>
			<div class="row">
				<div class="grid col-3"></div>
				<div class="grid col-6" style="border:1px solid #ccc; border-radius: 4px; padding:25px">
					<div class="row">
					    <div class="grid col-6">
					    	<input type="text" name="correo" id="correo" class="form-control wide" placeholder="Correo"/>
					    </div>
					    <div class="grid col-6">
					    	<input type="password" name="password" id="password" class="form-control wide" placeholder="Contrase&ntilde;a"/>
					    </div>
					</div>
					<div class="division"></div>
					<div class="row">
					    <div class="grid col-12">
					    	<a class="btn blue wide" href="#" role="button">Ingresar</a>
					    </div>
					</div>
				</div>
				<div class="grid col-2"></div>
			</div>
		</div>
		<div class="division"></div>
	</section>
</asp:Content>
