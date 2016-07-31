using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace UAMShop.mantenimiento
{
    public partial class mantproductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerProductos_Click(object sender, EventArgs e)
        {
            MultiViewProductos.ActiveViewIndex = 0;
            GridViewVerProductos.Visible = true;
            GridViewVerProductos.DataBind();
        }

        protected void btnModificarProductos_Click(object sender, EventArgs e)
        {
            MultiViewProductos.ActiveViewIndex = 2;
            GridViewModificarProductos.Visible = true;
            GridViewModificarProductos.DataBind();
        }

        protected void btnAgregarProductos_Click(object sender, EventArgs e)
        {
            MultiViewProductos.ActiveViewIndex = 1;
            lblProductos.Visible = true;
            FileUploadAgregarProducto.Visible = true;
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            
            if (FileUploadAgregarProducto.HasFile)
            {
                try
                {
                    if (FileUploadAgregarProducto.PostedFile.ContentType == "image/png")
                    {
                        SqlDataSourceProductos.InsertParameters.Add("Codigo", txtbAgregarCodigoProducto.Text);
                        SqlDataSourceProductos.InsertParameters.Add("Producto", txtbAgregarNombreProducto.Text);
                        SqlDataSourceProductos.InsertParameters.Add("Existencia", txtbAgregarExistenciaProducto.Text);
                        SqlDataSourceProductos.InsertParameters.Add("Precio", txtbAgregarPrecioProducto.Text);
                        SqlDataSourceProductos.InsertParameters.Add("IdCategoria", txtbAgregarCategoriaProducto.Text);
                        string filename = (txtbAgregarCodigoProducto.Text + ".png");
                        FileUploadAgregarProducto.SaveAs(Server.MapPath("../img/productos/") + filename);
                        SqlDataSourceProductos.InsertParameters.Add("Imagen", ("../img/productos/") + filename);
                        SqlDataSourceProductos.Insert();
                        lblResultadoAgregarProducto.Text = "Producto cargado satisfactoriamente!";
                        lblResultadoAgregarProducto.Visible = true;
                    }
                    else 
                    {
                        lblResultadoAgregarProducto.Text = "Error: Solo formato .png es permitido!";
                        lblResultadoAgregarProducto.Visible = true;
                    }  
                }
                catch (Exception ex)
                {
                    lblResultadoAgregarProducto.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else { lblResultadoAgregarProducto.Text = "Incluir una imagen es obligatorio"; }

            
        }






    }
}