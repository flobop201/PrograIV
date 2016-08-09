<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MainTemplate.Master" CodeBehind="mantproductos.aspx.cs" Inherits="UAMShop.mantenimiento.mantproductos" %>
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
    <style>
        footer{
            bottom: 0px;
            position: fixed;
            left: 0;
            right: 0;
        }
    </style>
</head>

    <div>
      <section class="grey-bg">
        <div class="division"></div>
        <div class="container">
            <div class="row">
                <div class="grid col-12">
                        <h4>Bienvenido al modulo de mantenimiento de productos </h4>
                </div>
            </div>
        </div>
        <div class="division"></div>
    </section>

        <section class="container">
        <div class="division"></div>
        <div class="row">
            <div class="grid col-12">
                <div class="row">

         <asp:Label ID="LblMantproducto" runat="server" Text="Seleccionar la modificacion a realizar: "></asp:Label>
            <br />
            <br />
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

         <asp:SqlDataSource ID="SqlDataSourceCategoria" runat="server"
            ConnectionString="<% $AppSettings:ConnectionString %> "
            SelectCommandType="StoredProcedure" 
            SelectCommand="usp_categoriasSelect">
        </asp:SqlDataSource>

        <asp:Button class="btn blue"  ID="btnVerProductos" runat="server" Text="Ver productos existentes" OnClick="btnVerProductos_Click" />
        <asp:Button class="btn blue" ID="btnAgregarProductos" runat="server" Text="Agregar producto nuevo" OnClick="btnAgregarProductos_Click" />
        <asp:Button class="btn blue" ID="btnModificarProductos" runat="server" Text="Modificar productos existentes" OnClick="btnModificarProductos_Click" />
        <asp:MultiView ID="MultiViewProductos" runat="server" ActiveViewIndex="0">
            <br />
            <asp:View ID="View1" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridViewVerProductos" runat="server" CssClass="tablestyle" DataSourceID="SqlDataSourceProductos" Visible="False" AllowSorting="True" AutoGenerateColumns="False" CaptionAlign="Left">
                
                <Columns>
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                InsertVisible="False" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Producto" HeaderText="Producto" 
                InsertVisible="False" ReadOnly="True" SortExpression="Producto" />
                <asp:BoundField DataField="Existencia" HeaderText="Existencia" 
                InsertVisible="False" ReadOnly="True" SortExpression="Existencia" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" 
                InsertVisible="False" ReadOnly="True" SortExpression="Precio" />
                <asp:BoundField DataField="Categoria" HeaderText="Categoria"/>
                <asp:ImageField  DataImageUrlField = "Imagen"
                 DataImageUrlFormatString="~/Photos/{0}"
                 ControlStyle-Height = "100" 
                 HeaderText = "Imagen previa"
                 runat="server">
                    <ControlStyle Height="100px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:ImageField>
                </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
                <asp:Label ID="lblerrorverproducto" runat="server" Visible="False"></asp:Label>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <br />
                <br />
                <asp:Label ID="lblProductos" runat="server" align="left" Text="Favor ingresar los valores requeridos:" Visible="False"></asp:Label>
                &nbsp;<br />
                <br />
                <asp:Label align="left" display="inline-block" width= "200px" ID="lblAgregarCodigoProducto" runat="server" Text="Codigo del producto: "></asp:Label>
                <asp:TextBox class="form-control" maxlength="10" ID="txtbAgregarCodigoProducto" runat="server" placeholder="Codigo" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorCodigo" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarNombreProducto" width= "200px" runat="server" Text="Nombre del producto: "></asp:Label>
                <asp:TextBox class="form-control" maxlength="30" ID="txtbAgregarNombreProducto" runat="server" placeholder="Nombre" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorNombre" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarExistenciaProducto" width= "200px" runat="server" Text="Cantidad de existencias: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarExistenciaProducto" maxlength="10" runat="server" placeholder="Cantidad" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorExistencia" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarPrecioProducto" width= "200px" runat="server" Text="Precio del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarPrecioProducto" maxlength="20" runat="server" placeholder="Precio" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorPrecio" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarCategoriaProducto" width= "200px" runat="server" Text="Categoria: "></asp:Label>
                
                <asp:DropDownList ID="DropDownListCategorias" class="form-control" runat="server"  Width="270px" DataSourceID="SqlDataSourceCategoria"
                DataTextField="Categoria" DataValueField="Id" OnSelectedIndexChanged="DropDownListCategorias_SelectedIndexChanged1">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="lblImagenDelProducto"  width= "200px" runat="server" Text="Imagen del producto: "></asp:Label>

                <asp:FileUpload class="form-control" ID="FileUploadAgregarProducto" runat="server" Visible="False" />
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button class="btn blue" ID="btnAgregarProducto" runat="server" Text="Agregar" OnClick="btnAgregarProducto_Click" Width="275px" />
                <br />
                <br />
                <asp:Label ID="lblResultadoAgregarProducto" runat="server" Visible ="false"></asp:Label>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridViewModificarProductos" OnRowUpdating="GridView1_RowUpdating" onitemdatabound="DataGrid1_ItemDataBound()" Visible="False" AutoGenerateEditButton="True" DataKeyNames="Codigo" runat="server" DataSourceID="SqlDataSourceProductos" CssClass="tablestyle" AllowSorting="True" AutoGenerateColumns="False">
                 <Columns>
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                SortExpression="Codigo" />
                <asp:BoundField DataField="Producto" HeaderText="Producto" 
                SortExpression="Producto" />
                <asp:BoundField DataField="Existencia" HeaderText="Existencia" 
                SortExpression="Existencia" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" 
                SortExpression="Precio" />
                 <asp:TemplateField HeaderText="Categoria" SortExpression="IdCategoria">
                <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCategoria" DataTextField="Categoria" DataValueField="Id" SelectedValue='<%# Bind("IdCategoria") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                     <asp:TemplateField HeaderText="Imagen" SortExpression="Imagen">
                         <EditItemTemplate>
                             <asp:FileUpload ID="FileUpload1" value='<%# Eval("Imagen","~/Images/{0}") %>' runat="server" 
                             />
                             <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("Imagen","~/Images/{0}") %>'
                                ControlStyle-Height = "100"
                                HeaderText = "Imagen previa"/>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("Imagen","~/Images/{0}") %>'
                                ControlStyle-Height = "100"
                                HeaderText = "Imagen previa"/>
                         </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                     </asp:TemplateField>
                    </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
                <asp:Label ID="lblErrorModificarProducto" runat="server" Visible="False"></asp:Label>
            </asp:View>
        </asp:MultiView>
                </div>
            </div>
        </div>
    </section>
        <div class="division"></div>

    </div>
        
        </section>
</asp:Content>
