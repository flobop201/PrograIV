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
            <div class="alert" id="mensaje">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span>
                <span id="txtMensaje">This is an alert box.</span>
            </div>
			<div class="division"></div>
			<div class="row">
				<div class="grid col-3"></div>
				<div class="grid col-6" style="border:1px solid #ccc; border-radius: 4px; padding:25px">
					<div class="row">
					    <div class="grid col-6">
                            <asp:TextBox ID="correo" Name="correo" Type="text" runat="server" CssClass="form-control wide" placeholder="Correo"></asp:TextBox>
					    </div>
					    <div class="grid col-6">
					    	<%--<input type="password" name="password" id="password" class="form-control wide" placeholder="Contrase&ntilde;a"/>--%>
                            <asp:TextBox ID="password" Name="password" Type="password" runat="server" CssClass="form-control wide" placeholder="Contrase&ntilde;a"></asp:TextBox>
					    </div>
					</div>
					<div class="division"></div>
                    <div class="row">
					    <div class="grid col-12">
                            <br />
					    	<a id="A1" class="btn blue wide" href="#" role="button" runat="server" onserverclick="login_btn_Click">Ingresar</a>
					    </div>
					</div>
                    <div class="division"></div>
                    <div class="division"></div>
                    <div class="row">
					    <div class="grid col-12">
                            <asp:LinkButton ID="lbtnRegistrar" runat="server" PostBackUrl="~/user/register.aspx">Nuevo usuario? Registrate aqui</asp:LinkButton>            
					    </div>
					</div>
				</div>
				<div class="grid col-2"></div>
			</div>
            <br />
            <br />
            <br />
		</div>
		<div class="division"></div>
	</section>
            <% if (mensajeError==true){ %>
            
            <script>
                setTimeout(function () {
                    $(document).ready(function () {
                        DesplegarCredencialesInvalidas('Las credenciales suministradas no son correctas.');
                    });
                }, 0);
            </script>           
            <% } %>
</asp:Content>
