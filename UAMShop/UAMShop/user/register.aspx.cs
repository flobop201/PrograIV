using System.Text.RegularExpressions;
using NotificationModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace UAMShop.user
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRelizarCompra_Click(object sender, EventArgs e)
        {
            lblResultadoCrearUsuario.Text = "";
            lblErrorNombre.Text = "";
            lblErrorCorreo.Text = "";
            lblErrorContrasena.Text = "";
            lblErrorRepetirContrasena.Text = "";
            try
            {
                if (!ComprobarFormatoEmail(txtbcorreo.Text))
                {
                    lblErrorCorreo.ForeColor = System.Drawing.Color.Red;
                    lblErrorCorreo.Text = "Ingrese un correo valido!";
                    return;
                }
                if (!string.IsNullOrWhiteSpace(txtbnombre.Text) && !string.IsNullOrWhiteSpace(txtbcorreo.Text) && !string.IsNullOrWhiteSpace(txtbcontrasena.Text) && !string.IsNullOrWhiteSpace(txtbrepetircontrasena.Text) && (txtbcontrasena.Text == txtbrepetircontrasena.Text))
                {
                    SqlDataSourceCrearCuenta.InsertParameters.Add("Usuario", txtbcorreo.Text);
                    SqlDataSourceCrearCuenta.InsertParameters.Add("Nombre", txtbnombre.Text);
                    SqlDataSourceCrearCuenta.InsertParameters.Add("Contrasena", txtbcontrasena.Text);
                    SqlDataSourceCrearCuenta.InsertParameters.Add("IdRol", "2");
                    SqlDataSourceCrearCuenta.InsertParameters.Add("Estado", "1");
                    SqlDataSourceCrearCuenta.Insert();
                    lblResultadoCrearUsuario.Text = "Usuario cargado satisfactoriamente!";
                    SendMail.SendUserNotification(txtbnombre.Text, txtbcorreo.Text);
                    Page.Response.Redirect("~/login.aspx", false);
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(txtbnombre.Text))
                    {
                        lblErrorNombre.ForeColor = System.Drawing.Color.Red;
                        lblErrorNombre.Text = "Dato Requerido!";

                    }
                    if (string.IsNullOrWhiteSpace(txtbcorreo.Text))
                    {
                        lblErrorCorreo.ForeColor = System.Drawing.Color.Red;
                        lblErrorCorreo.Text = "Dato Requerido!";

                    }
                    if (string.IsNullOrWhiteSpace(txtbcontrasena.Text))
                    {
                        lblErrorContrasena.ForeColor = System.Drawing.Color.Red;
                        lblErrorContrasena.Text = "Dato Requerido!";
                    }
                    if (string.IsNullOrWhiteSpace(txtbcontrasena.Text))
                    {
                        lblErrorRepetirContrasena.ForeColor = System.Drawing.Color.Red;
                        lblErrorRepetirContrasena.Text = "Dato Requerido!";

                    }
                    if (txtbcontrasena.Text != txtbrepetircontrasena.Text)
                    {
                        lblErrorContrasena.ForeColor = System.Drawing.Color.Red;
                        lblErrorContrasena.Text = "Contrasenas no coinciden!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblResultadoCrearUsuario.ForeColor = System.Drawing.Color.Red;
                lblResultadoCrearUsuario.Text = "Ha sucedido un error: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
        }

        public static bool ComprobarFormatoEmail(string sEmailAComprobar)
        {
            String sFormato;
            sFormato = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(sEmailAComprobar, sFormato))
            {
                if (Regex.Replace(sEmailAComprobar, sFormato, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

    }
}