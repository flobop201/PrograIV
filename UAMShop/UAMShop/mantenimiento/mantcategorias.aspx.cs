using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MenuModule;

namespace UAMShop
{
    public partial class Mantenimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Validar acceso a la pagina
            try
            {
                //Se obtiene el usuario si esta logueado
                var usuario = Session["usuario_id"];
                //Se obtiene la pagina que esta intentando ingresar el usuario
                string pagina = Path.GetFileName(Request.Path);
                //Instanciamos el dal para acceder el metodo
                var menuDal = new MenuDal();
                //Accedemos el metodo de validar si se tiene acceso a la pagina
                if (!menuDal.AccessToPage(Convert.ToInt32(usuario), pagina))
                {
                    Page.Response.Redirect("~/login.aspx?logout=true", false);  
                }
            }
            catch (Exception exception)
            {
                Log4NetModule.Log4Net.WriteLog(exception, Log4NetModule.Log4Net.LogType.Error);
            }
            #endregion
        }


        protected void btnActualizarCategoria_Click(object sender, EventArgs e)
        {
            lblAgregarCategoriaExitosa.Text = "";
            try
            {
                MultiView1.ActiveViewIndex = 0;
                GridViewEditarCategorias.Visible = true;
                GridViewEditarCategorias.DataBind();
                GridViewVerCategorias.DataBind();
            }
            catch (Exception ex)
            {
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Red;
                lblAgregarCategoriaExitosa.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
        }



        protected void btnagregarcategoria_Click(object sender, EventArgs e)
        {
            lblAgregarCategoriaExitosa.Text = "";
            try
            {
                MultiView1.ActiveViewIndex = 1;
                lblCategoria.Visible = true;
                txtbCategoria.Visible = true;
                btnAgregarCat.Visible = true;
                GridViewEditarCategorias.DataBind();
                GridViewVerCategorias.DataBind();
            }
            catch (Exception ex)
            {
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Red;
                lblAgregarCategoriaExitosa.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }

        }

        protected void btnVerCategoria_Click(object sender, EventArgs e)
        {
            lblAgregarCategoriaExitosa.Text = "";
            try
            {
                MultiView1.ActiveViewIndex = 2;
                GridViewVerCategorias.Visible = true;
                GridViewEditarCategorias.DataBind();
                GridViewVerCategorias.DataBind();
            }
            catch (Exception ex)
            {
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Red;
                lblAgregarCategoriaExitosa.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }

        }

        protected void btnAgregarCat_Click(object sender, EventArgs e)
        {
            lblAgregarCategoriaExitosa.Text = "";

            try
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
            catch (Exception ex)
            {
                lblAgregarCategoriaExitosa.ForeColor = System.Drawing.Color.Red;
                lblAgregarCategoriaExitosa.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
        }

        protected void GridViewEditarCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}