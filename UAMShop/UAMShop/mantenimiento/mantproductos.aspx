<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mantproductos.aspx.cs" Inherits="UAMShop.mantenimiento.mantproductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/generalStyle.css" rel="stylesheet" />
    <link href="../css/navBarStyle.css" rel="stylesheet" />
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/gridStyle.css" rel="stylesheet" />
    <link href="../css/datagrid.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1 class="nav-menu"> Bienvenido al modulo de mantenimiento de productos </h1>
            
    </div>
        <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            SelectCommandType="StoredProcedure" 
            SelectCommand="usp_productosSelect"
            UpdateCommandType="StoredProcedure" 
            UpdateCommand="usp_productosUpdate"
            DeleteCommandType="StoredProcedure"
            DeleteCommand ="usp_productosDelete"
            InsertCommandType="StoredProcedure"
            InsertCommand="usp_productosInsert">
            <DeleteParameters>
             <asp:Parameter Name="Codigo" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Codigo" />
                <asp:Parameter Name="Producto" />
                <asp:Parameter Name="Existencia" />
                <asp:Parameter Name="Precio" />
                <asp:Parameter Name="IdCategoria" />
                <asp:Parameter Name="Imagen" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:Button class="btn blue"  ID="btnVerProductos" runat="server" Text="Ver productos existentes" OnClick="btnVerProductos_Click" />
        <asp:Button class="btn blue" ID="btnAgregarProductos" runat="server" Text="Agregar producto nuevo" OnClick="btnAgregarProductos_Click" />
        <asp:Button class="btn blue" ID="btnModificarProductos" runat="server" Text="Modificar productos existentes" OnClick="btnModificarProductos_Click" />
        <asp:MultiView ID="MultiViewProductos" runat="server" ActiveViewIndex="0">
            <br />
            <asp:View ID="View1" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridViewVerProductos" runat="server" CssClass="tablestyle" DataSourceID="SqlDataSourceProductos" Visible="False" AllowSorting="True">
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:Label ID="lblProductos" runat="server" align="left" Text="Favor ingresar los valores requeridos:" Visible="False"></asp:Label>
                &nbsp;<br />
                <br />
                <asp:Label align="left" display="inline-block" width= "150px" ID="lblAgregarCodigoProducto" runat="server" Text="Codigo del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarCodigoProducto" runat="server" placeholder="Codigo del producto" ></asp:TextBox>
                <br />
                <asp:Label ID="lblAgregarNombreProducto" runat="server" Text="Nombre del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarNombreProducto" runat="server" placeholder="Nombre del producto"></asp:TextBox>
                <br />
                <asp:Label ID="lblAgregarExistenciaProducto" runat="server" Text="Cantidad de existencias: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarExistenciaProducto" runat="server" placeholder="Cantidad de existencias"></asp:TextBox>
                <br />
                <asp:Label ID="lblAgregarPrecioProducto" runat="server" Text="Precio del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarPrecioProducto" runat="server" placeholder="Precio del producto"></asp:TextBox>
                <br />
                <asp:Label ID="lblAgregarCategoriaProducto" runat="server" Text="Categoria: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarCategoriaProducto" runat="server" placeholder="Categoria" Height="16px"></asp:TextBox>
                <br />
                <asp:Label ID="lblImagenDelProducto" runat="server" Text="Imagen del producto: "></asp:Label>
                <asp:FileUpload class="form-control" ID="FileUploadAgregarProducto" runat="server" Visible="False" />
                <br />
                <br />
                <asp:Button class="btn blue" ID="btnAgregarProducto" runat="server" Text="Agregar" OnClick="btnAgregarProducto_Click" />
                <br />
                <br />
                <asp:Label ID="lblResultadoAgregarProducto" runat="server" Visible ="false"></asp:Label>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridViewModificarProductos" Visible="False" AutoGenerateEditButton="True" DataKeyNames="Codigo" runat="server" DataSourceID="SqlDataSourceProductos" CssClass="tablestyle" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
