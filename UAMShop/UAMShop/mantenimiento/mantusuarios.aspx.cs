using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MenuModule;

namespace UAMShop.mantenimiento
{
    public partial class mantusuarios : System.Web.UI.Page
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

        protected void btnVerUsuario_Click(object sender, EventArgs e)
        {

            lblErrorVerUsuarios.Text = "";
            lblResultadoAgregarUsuario.Text = "";
            lblErrorModificarUsuario.Text = "";

            try
            {
                MultiViewUsuarios.ActiveViewIndex = 0;
                GridViewVerUsuarios.DataBind();
                GridViewVerUsuarios.Visible = true;
            }
            catch (Exception ex)
            {
                lblErrorVerUsuarios.ForeColor = System.Drawing.Color.Red;
                lblErrorVerUsuarios.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {

            lblErrorVerUsuarios.Text = "";
            lblResultadoAgregarUsuario.Text = "";
            lblErrorModificarUsuario.Text = "";

            try
            {
                MultiViewUsuarios.ActiveViewIndex = 1;
                GridViewModificarUsuarios.Visible = true;
                GridViewModificarUsuarios.DataBind();
            }
            catch (Exception ex)
            {
                lblResultadoAgregarUsuario.ForeColor = System.Drawing.Color.Red;
                lblResultadoAgregarUsuario.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
        }

        protected void btnModificarUsuario_Click(object sender, EventArgs e)
        {

            lblErrorVerUsuarios.Text = "";
            lblResultadoAgregarUsuario.Text = "";
            lblErrorModificarUsuario.Text = "";

            try
            {
                MultiViewUsuarios.ActiveViewIndex = 2;
                GridViewModificarUsuarios.Visible = true;
                GridViewModificarUsuarios.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorModificarUsuario.ForeColor = System.Drawing.Color.Red;
                lblErrorModificarUsuario.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
           

        }

        protected void btnAgregarUsuario_Click1(object sender, EventArgs e)
        {

            lblErrorVerUsuarios.Text = "";
            lblResultadoAgregarUsuario.Text = "";
            lblErrorModificarUsuario.Text = "";
            lblErrorUsuario.Visible = false;
            lblErrorNombre.Visible = false;
            lblErrorContrasena.Visible = false;
            try
            {
                if (!string.IsNullOrWhiteSpace(txtbAgregarUsuario.Text) && !string.IsNullOrWhiteSpace(txtbAgregarNombreUsuario.Text) && !string.IsNullOrWhiteSpace(txtbAgregarContrasenaUsuario.Text))
                {
                    SqlDataSourceUsuarios.InsertParameters.Add("Usuario", txtbAgregarUsuario.Text);
                    SqlDataSourceUsuarios.InsertParameters.Add("Nombre", txtbAgregarNombreUsuario.Text);
                    SqlDataSourceUsuarios.InsertParameters.Add("Contrasena", txtbAgregarContrasenaUsuario.Text);
                    SqlDataSourceUsuarios.InsertParameters.Add("IdRol", DropDownListRol.SelectedItem.Value);
                    SqlDataSourceUsuarios.InsertParameters.Add("Estado", "1");
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
            catch (Exception ex)
            {
                lblResultadoAgregarUsuario.ForeColor = System.Drawing.Color.Red;
                lblResultadoAgregarUsuario.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
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