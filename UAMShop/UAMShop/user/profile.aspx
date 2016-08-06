<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MainTemplate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="UAMShop.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <section>
        <div class="container">
            <div align="center">
                <div align="center">
                    <img width="50px" alt="User Pic" src="https://d2ln1xbi067hum.cloudfront.net/assets/default_user-abdf6434cda029ecd32423baac4ec238.png" />
                </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            UpdateCommandType="StoredProcedure" 
            UpdateCommand="usp_usuariosUpdatePassword">
            </asp:SqlDataSource>
            
                
                <div>
                    <table align="center">
                        <tbody>
                            <tr>
                                <td>Nombre de Usuario:</td>
                                <td><% Page.Response.Write(Session["usuario"]); %>
                                </td>
                            </tr>
                            <tr>
                                <td>Tipo de Usuario:</td>
                                <td><% Page.Response.Write(Session["usuario_idrol"]); %>
                            </tr>
                            <tr>
                                <td>Fecha de Suscripcion:</td>
                                <td><% Page.Response.Write(Session["usuario_fecha_suscripcion"]); %>
                            </tr>
                            <tr>
                                <td>Estado de Usuario</td>
                                <td><% Page.Response.Write(Session["usuario_estado"]); %>
                            </tr>

                            <tr>
                                <td>Correo Electronico:</td>
                                <td><a href="mailto:<% Page.Response.Write(Session["usuario_correo"]); %>.com"><% Page.Response.Write(Session["usuario_correo"]); %>
                                    <asp:Label ID="lblCorreo" runat="server" Text=""></asp:Label>
                                    </a></td>
                            </tr>
                            <tr>
                                <td>Nueva Contraseña:</td>
                                <td>
                                    &nbsp;
                                    <asp:TextBox ID="txtbPass" maxlength="15" TextMode="Password" text-align= "left" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Repetir Nueva Contraseña:</td>
                                <td>
                                    &nbsp;
                                    <asp:TextBox ID="txtbPassConfirmation" maxlength="15" TextMode="Password" runat="server"></asp:TextBox>
&nbsp;<asp:Button class="btn blue" ID="btnCambiarContrasena" runat="server" Text="I" Height="30px" OnClick="btnCambiarContrasena_Click" Width="60px" />
                                    
                                </td>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Label ID="lblResultadoCambiarContrasena" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <br />
            </div>
        </div>

    </section>
</asp:Content>
