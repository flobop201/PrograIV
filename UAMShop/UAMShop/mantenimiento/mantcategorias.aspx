<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MainTemplate.Master" CodeBehind="mantcategorias.aspx.cs" Inherits="UAMShop.Mantenimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
    <!DOCTYPE html>

    <head>
        <title></title>
        <link href="../css/generalStyle.css" rel="stylesheet" />
        <link href="../css/navBarStyle.css" rel="stylesheet" />
        <link href="../css/font-awesome.css" rel="stylesheet" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" />
        <link href="../css/gridStyle.css" rel="stylesheet" />
        <link href="../css/datagrid.css" rel="stylesheet" />
    </head>

            <div>
                <h3 class="nav-menu">Bienvenido al modulo de mantenimiento de categorias </h3>
            </div>
            <asp:Label ID="LblMantenimiento" runat="server" Text="Seleccionar la modificacion a realizar: "></asp:Label>
            <br />
            <br />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<% $AppSettings:ConnectionString %> "
                SelectCommandType="StoredProcedure"
                SelectCommand="usp_categoriasSelect"
                UpdateCommandType="StoredProcedure"
                UpdateCommand="usp_categoriasUpdate"
                DeleteCommandType="StoredProcedure"
                DeleteCommand="usp_categoriasDelete"
                InsertCommandType="StoredProcedure"
                InsertCommand="usp_categoriasInsert">
                <DeleteParameters>
                    <asp:Parameter Name="Id" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id" />
                    <asp:Parameter Name="Categoria" />
                </UpdateParameters>

            </asp:SqlDataSource>

            <asp:Button class="btn blue" ID="btnVerCategoria" runat="server" Text="Ver categorias existentes" OnClick="btnVerCategoria_Click" />
            <asp:Button class="btn blue" ID="btnagregarcategoria" runat="server" Text="Agregar nueva categoria" OnClick="btnagregarcategoria_Click" />
            <asp:Button class="btn blue" ID="btnActualizarCategoria" runat="server" Text="Actualizar registro existente" OnClick="btnActualizarCategoria_Click" />

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                <asp:View ID="View1" runat="server">
                    <br />
                    <br />
                    <asp:GridView ID="GridViewEditarCategorias" runat="server" AutoGenerateEditButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1" Visible="False" CssClass="tablestyle" OnSelectedIndexChanged="GridViewEditarCategorias_SelectedIndexChanged" Width="500px">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); "></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <AlternatingRowStyle CssClass="altrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <RowStyle CssClass="rowstyle" />
                    </asp:GridView>

                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <br />
                    <br />
                    <asp:Label align="left" ID="lblCategoria" runat="server" Text="Digitar nombre de la categoria:" Visible="False"></asp:Label>
                    &nbsp;<br />

                    <div class="grid col-3 nav-padding">
                        <asp:TextBox class="form-control" ID="txtbCategoria" MaxLength="30" runat="server" Visible="False" placeholder="Nombre Categoria"></asp:TextBox>
                        <asp:Button class="btn blue" ID="btnAgregarCat" runat="server" Text="Adicionar" Visible="False" OnClick="btnAgregarCat_Click" />
                        <br />
                        <br />
                        <asp:Label ID="lblAgregarCategoriaExitosa" runat="server" Text="" Visible="False"></asp:Label>
                    </div>

                </asp:View>

                <asp:View ID="View3" runat="server">

                    <br />
                    <br />

                    <asp:GridView ID="GridViewVerCategorias" runat="server" DataSourceID="SqlDataSource1" Visible="False" CssClass="tablestyle" Width="500px">
                        <AlternatingRowStyle CssClass="altrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <RowStyle CssClass="rowstyle" />
                    </asp:GridView>
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
