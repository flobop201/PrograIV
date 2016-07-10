<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CategoryTemplate.master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="UAMShop.category.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CategoryNameContentPlaceHolder" runat="server">
    Compras
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ItemContentPlaceHolder" runat="server">
    <div class="grid col-12">
        <div>
            <table class="cart" cellspacing="0">
                <tr>
                    <th colspan="2">Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th></th>
                </tr>
                <tr>
                    <td><img src="img/banner_03.png" width="45" height="45"></td>
                    <td>Producto 1</td>
                    <td>$80.00</td>
                    <td><input type="number" step="1" min="0" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="1" title="Qty" class="input-text qty text" size="4"></td>
                    <td>$80</td>
                    <td><a class="btn red wide" href="#" role="button"><i class="fa fa-times"></i></a></td>
                </tr>
                <tr>
                    <td><img src="img/banner_02.png" width="45" height="45"></td>
                    <td>Producto 2</td>
                    <td>$80.00</td>
                    <td><input type="number" step="1" min="0" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="2" title="Qty" class="input-text qty text" size="4"></td>
                    <td>$80</td>
                    <td><a class="btn red wide" href="#" role="button"><i class="fa fa-times"></i></a></td>
                </tr>
                <tr>
                    <td><img src="img/banner_04.png" width="45" height="45"></td>
                    <td>Producto 3</td>
                    <td>$80.00</td>
                    <td><input type="number" step="1" min="0" name="cart[b139e104214a08ae3f2ebcce149cdf6e][qty]" value="1" title="Qty" class="input-text qty text" size="4"></td>
                    <td>$80</td>
                    <td><a class="btn red wide" href="#" role="button"><i class="fa fa-times"></i></a></td>
                </tr>
            </table>
        </div>
        <div class="division"></div>
        <div><a class="btn blue wide" href="#" role="button">Proceder con la compra <i class="fa fa-chevron-right"></i></a></div>
        <div class="division"></div>
    </div>

    <div class="division"></div>
</asp:Content>
