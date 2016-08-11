using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NotificationModule;

namespace UAMShop
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_correo"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
        }

        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(txtbPass.Text) && (!string.IsNullOrWhiteSpace(txtbPassConfirmation.Text)) && txtbPass.Text.ToString() == txtbPassConfirmation.Text.ToString())
                {
                    SqlDataSource1.UpdateParameters.Add("Password", txtbPass.Text);
                    SqlDataSource1.UpdateParameters.Add("Usuario", Session["usuario"].ToString());

                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Black;
                    lblResultadoCambiarContrasena.Text = "Contraseñas cambiada satisfactoriamente";
                    SqlDataSource1.Update();
                    SendMail.SendUserPasswordNotification(Session["usuario"].ToString(),
                        Session["usuario_correo"].ToString());
                }
                else
                {
                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Red;
                    lblResultadoCambiarContrasena.Text = "Contraseñas no coinciden";
                }

                if (string.IsNullOrWhiteSpace(txtbPass.Text))
                {
                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Red;
                    lblResultadoCambiarContrasena.Text = "Password es requerido";
                    return;
                }
                if (string.IsNullOrWhiteSpace(txtbPassConfirmation.Text))
                {
                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Red;
                    lblResultadoCambiarContrasena.Text = "Confirmación Password es requerido";
                    return;
                }

            }
            catch (Exception ex)
            {
                lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Red;
                lblResultadoCambiarContrasena.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }

        }

    }
}
