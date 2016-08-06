<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MainTemplate.Master" CodeBehind="mantusuarios.aspx.cs" Inherits="UAMShop.mantenimiento.mantusuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>

<!DOCTYPE html>

<head >
    <title></title>
    <link href="../css/generalStyle.css" rel="stylesheet" />
    <link href="../css/navBarStyle.css" rel="stylesheet" />
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/gridStyle.css" rel="stylesheet" />
    <link href="../css/datagrid.css" rel="stylesheet" />
</head>

    <div>
    <h3 class="nav-menu"> Bienvenido al modulo de mantenimiento de usuarios </h3>
    </div>

         <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            SelectCommandType="StoredProcedure" 
            SelectCommand="selectusers"
            UpdateCommandType="StoredProcedure" 
            UpdateCommand="usp_usuariosUpdate"
            DeleteCommandType="StoredProcedure"
            DeleteCommand ="usp_usuariosDelete"
            InsertCommandType="StoredProcedure"
            InsertCommand="usp_usuariosInsert">
            <DeleteParameters>
             <asp:Parameter Name="Usuario" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="IdUsuario" />
                <asp:Parameter Name="Usuario" />
                <asp:Parameter Name="Nombre" />
                <asp:Parameter Name="Contrasena" />
                <asp:Parameter Name="IdRol" />
                <asp:Parameter Name="IdEstado" />
            </UpdateParameters>
            
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceRol" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            SelectCommandType="StoredProcedure" 
            SelectCommand="usp_RoleSelect">
        </asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSourceEstado" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            SelectCommandType="StoredProcedure" 
            SelectCommand="usp_EstadoSelect">

        </asp:SqlDataSource>
        <asp:Button class="btn blue"  ID="btnVerUsuarios" runat="server" Text="Ver usuario existentes" OnClick="btnVerUsuario_Click" />
        <asp:Button class="btn blue" ID="btnAgregarUsuarios" runat="server" Text="Agregar usuario nuevo" OnClick="btnAgregarUsuario_Click" />
        <asp:Button class="btn blue" ID="btnModificarUsuarios" runat="server" Text="Modificar usuario existentes" OnClick="btnModificarUsuario_Click" />
        <asp:MultiView ID="MultiViewUsuarios" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridViewVerUsuarios" runat="server" CssClass="tablestyle" DataSourceID="SqlDataSourceUsuarios" Visible="False" AllowSorting="True" AutoGenerateColumns="False">
                <Columns>
                <asp:BoundField DataField="IdUsuario" HeaderText="Id Usuario" 
                InsertVisible="False" ReadOnly="True" SortExpression="IdUsuario" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" 
                InsertVisible="False" ReadOnly="True" SortExpression="Usuario" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre del usuario" 
                InsertVisible="False" ReadOnly="True" SortExpression="Nombre" />
                <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" 
                InsertVisible="False" ReadOnly="True" SortExpression="Contrasena" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" 
                InsertVisible="False" ReadOnly="True" SortExpression="Rol" />
                <asp:BoundField DataField="EstadoA" HeaderText="Estado" 
                InsertVisible="False" ReadOnly="True" SortExpression="Estado" />
                </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>

                <br />
                <asp:Label ID="lblErrorVerUsuarios" runat="server" Text=""></asp:Label>

            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <br />
                <br />
                <asp:Label ID="lblUsuarios" runat="server" align="left" Text="Favor ingresar los valores requeridos:" ></asp:Label>
                &nbsp;<br />
                <br />
                <asp:Label align="left" display="inline-block" width= "200px" ID="lblAgregarUsuario" runat="server" Text="Usuario: "></asp:Label>
                <asp:TextBox class="form-control" maxlength="40" ID="txtbAgregarUsuario" runat="server" placeholder="Ej: Juan.Perez@gmail.com"></asp:TextBox>
                <asp:Label ID="lblErrorUsuario" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarNombreUsuario" width= "200px" runat="server" Text="Nombre del usuario: "></asp:Label>
                <asp:TextBox class="form-control" maxlength="30" ID="txtbAgregarNombreUsuario" runat="server" placeholder="Ej: Juan Perez"></asp:TextBox>
                <asp:Label ID="lblErrorNombre" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarContrasenaUsuario" width= "200px" runat="server" Text="Contrasena: "></asp:Label>
                <asp:TextBox class="form-control" maxlength="10" ID="txtbAgregarContrasenaUsuario" runat="server" placeholder="Contrasena"></asp:TextBox>
                <asp:Label ID="lblErrorContrasena" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
     
                <asp:Label ID="lblAgregarRolUsuario" width= "200px" runat="server" Text="Rol: "></asp:Label>
                
                <asp:DropDownList ID="DropDownListRol" class="form-control" runat="server"  Width="200px" DataSourceID="SqlDataSourceRol"
                DataTextField="Rol" DataValueField="Id">
                </asp:DropDownList>

                <br />

                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button class="btn blue"  ID="btnAgregarUsuario" runat="server" Text="Agregar" OnClick="btnAgregarUsuario_Click1" Width="206px" />

                <br />
                <br />
                <br />
                <asp:Label ID="lblResultadoAgregarUsuario" runat="server" Text="" Visible ="false"></asp:Label>

            </asp:View>
            <asp:View ID="View3" runat="server">
                    <br />
                    <br />
                    <asp:GridView ID="GridViewModificarUsuarios" onitemdatabound="DataGrid1_ItemDataBound()" Visible="False" AutoGenerateEditButton="True" DataKeyNames="Usuario" runat="server" DataSourceID="SqlDataSourceUsuarios" CssClass="tablestyle" AllowSorting="True" AutoGenerateColumns="False"> 
                        <Columns>
                <asp:TemplateField ShowHeader="False"><ItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton></ItemTemplate></asp:TemplateField>
                <asp:BoundField DataField="IdUsuario" HeaderText="Id Usuario" 
                SortExpression="IdUsuario"/>
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" 
                SortExpression="Usuario" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre del usuario" 
                SortExpression="Nombre" />
                <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" 
                SortExpression="Contrasena" />
                <asp:TemplateField HeaderText="Rol" SortExpression="IdRol">
                <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceRol" DataTextField="Rol" DataValueField="Id" SelectedValue='<%# Bind("IdRol") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rol") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" InsertVisible="False" SortExpression="Estado">
                                <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceEstado" DataTextField="EstadoA" DataValueField="IdEstado" SelectedValue='<%# Bind("IdEstado") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EstadoA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
                    <br />
                    <asp:Label ID="lblErrorModificarUsuario" runat="server" Text=""></asp:Label>
            </asp:View>
        </asp:MultiView>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        <div class="division"></div>
        </section>
</asp:Content>
