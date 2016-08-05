using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UAMShop.mantenimiento
{
    public partial class mantusuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerUsuario_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 0;
            GridViewVerUsuarios.DataBind();
            GridViewVerUsuarios.Visible = true;
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 1;
            GridViewModificarUsuarios.Visible = true;
            GridViewModificarUsuarios.DataBind();
        }

        protected void btnModificarUsuario_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 2;
            GridViewModificarUsuarios.Visible = true;
            GridViewModificarUsuarios.DataBind();

        }

        protected void btnAgregarUsuario_Click1(object sender, EventArgs e)
        {
            lblErrorUsuario.Visible = false;
            lblErrorNombre.Visible = false;
            lblErrorContrasena.Visible = false;

            if (!string.IsNullOrWhiteSpace(txtbAgregarUsuario.Text) && !string.IsNullOrWhiteSpace(txtbAgregarNombreUsuario.Text) && !string.IsNullOrWhiteSpace(txtbAgregarContrasenaUsuario.Text))
            {
                SqlDataSourceUsuarios.InsertParameters.Add("Usuario", txtbAgregarUsuario.Text);
                SqlDataSourceUsuarios.InsertParameters.Add("Nombre", txtbAgregarNombreUsuario.Text);
                SqlDataSourceUsuarios.InsertParameters.Add("Contrasena", txtbAgregarContrasenaUsuario.Text);
                SqlDataSourceUsuarios.InsertParameters.Add("IdRol", DropDownListRol.SelectedItem.Value);
                SqlDataSourceUsuarios.Insert();
                lblResultadoAgregarUsuario.Text = "Usuario cargado satisfactoriamente!";
                lblResultadoAgregarUsuario.Visible = true;
            }
            else 
            {
                if (string.IsNullOrWhiteSpace(txtbAgregarUsuario.Text))
                { 
                    lblErrorUsuario.ForeColor = System.Drawing.Color.Red;
                    lblErrorUsuario.Text = "Dato Requerido!";
                    lblErrorUsuario.Visible = true;
                }
                if (string.IsNullOrWhiteSpace(txtbAgregarNombreUsuario.Text))
                {
                    lblErrorNombre.ForeColor = System.Drawing.Color.Red;
                    lblErrorNombre.Text = "Dato Requerido!";
                    lblErrorNombre.Visible = true;
                }
                if (string.IsNullOrWhiteSpace(txtbAgregarContrasenaUsuario.Text))
                {
                    lblErrorContrasena.ForeColor = System.Drawing.Color.Red;
                    lblErrorContrasena.Text = "Dato Requerido!";
                    lblErrorContrasena.Visible = true;
                }
            }
        }

        protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.EditItem)
            {
                DropDownList dropDownList1 = (DropDownList)e.Item.FindControl("Dropdownlist1");
                DataRowView dataItem1 = (DataRowView)e.Item.DataItem;
                dropDownList1.SelectedValue = (string)dataItem1.Row["IdRol"];

            }
        }

        
    }
}