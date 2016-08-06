using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UAMShop
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_correo"] ==null )
            {
                Response.Redirect("~/index.aspx");                
            }
        }

        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            try 
            {
                if (txtbPass.Text.ToString() == txtbPassConfirmation.Text.ToString())
                {
                    SqlDataSource1.UpdateParameters.Add("Password", txtbPass.Text);
                    SqlDataSource1.UpdateParameters.Add("Usuario", Session["usuario"].ToString());
                    
                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Black;
                    lblResultadoCambiarContrasena.Text = "Contrasenas cambiada satisfactoriamente";
                    SqlDataSource1.Update();
                }
                else
                {
                    lblResultadoCambiarContrasena.ForeColor = System.Drawing.Color.Red;
                    lblResultadoCambiarContrasena.Text = "Contrasenas no coinciden";
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
