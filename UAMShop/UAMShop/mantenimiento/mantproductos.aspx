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
    
        <h3 class="nav-menu"> Bienvenido al modulo de mantenimiento de productos </h3>
            
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
                <asp:GridView ID="GridViewVerProductos" runat="server" CssClass="tablestyle" DataSourceID="SqlDataSourceProductos" Visible="False" AllowSorting="True" AutoGenerateColumns="False">
                
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
                <asp:ImageField DataImageUrlField = "Imagen"
                 DataImageUrlFormatString="~/Photos/{0}"
                 ControlStyle-Width = "100" ControlStyle-Height = "100"
                 HeaderText = "Imagen previa"
                 runat="server"/>
                </Columns>
                <AlternatingRowStyle CssClass="altrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <RowStyle CssClass="rowstyle" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <br />
                <br />
                <asp:Label ID="lblProductos" runat="server" align="left" Text="Favor ingresar los valores requeridos:" Visible="False"></asp:Label>
                &nbsp;<br />
                <br />
                <asp:Label align="left" display="inline-block" width= "200px" ID="lblAgregarCodigoProducto" runat="server" Text="Codigo del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarCodigoProducto" runat="server" placeholder="Codigo del producto" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorCodigo" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarNombreProducto" width= "200px" runat="server" Text="Nombre del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarNombreProducto" runat="server" placeholder="Nombre del producto" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorNombre" runat="server" Text="" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarExistenciaProducto" width= "200px" runat="server" Text="Cantidad de existencias: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarExistenciaProducto" runat="server" placeholder="Cantidad de existencias" Width="245px"></asp:TextBox>
                <asp:Label ID="lblErrorExistencia" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblAgregarPrecioProducto" width= "200px" runat="server" Text="Precio del producto: "></asp:Label>
                <asp:TextBox class="form-control" ID="txtbAgregarPrecioProducto" runat="server" placeholder="Precio del producto" Width="245px"></asp:TextBox>
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
                             <asp:FileUpload ID="FileUpload1" runat="server" />
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("Imagen","~/Images/{0}") %>'
                                ControlStyle-Width = "100" ControlStyle-Height = "100"
                                HeaderText = "Imagen previa"/>
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
