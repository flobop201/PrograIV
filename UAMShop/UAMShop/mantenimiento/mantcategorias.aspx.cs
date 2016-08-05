using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UAMShop
{
    public partial class Mantenimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnActualizarCategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridViewEditarCategorias.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

      

        protected void btnagregarcategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            lblCategoria.Visible = true;
            txtbCategoria.Visible = true;
            btnAgregarCat.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

        protected void btnVerCategoria_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            GridViewVerCategorias.Visible = true;
            GridViewEditarCategorias.DataBind();
            GridViewVerCategorias.DataBind();
        }

        protected void btnAgregarCat_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtbCategoria.Text))
            {
                SqlDataSource1.InsertParameters.Add("Categoria", Convert.ToString(txtbCategoria.Text));
                SqlDataSource1.Insert();
                GridViewEditarCategorias.DataBind();
                GridViewVerCategorias.DataBind();
                lblAgregarCategoriaExitosa.Text = "Categoria cargada satisfactoriamente!";
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Black;
                lblAgregarCategoriaExitosa.Visible = true;
            }
            else 
            {
                lblAgregarCategoriaExitosa.Text = "Categoria es requerida!";
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Red;
                lblAgregarCategoriaExitosa.Visible = true;
            }
            
        }

        protected void GridViewEditarCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}