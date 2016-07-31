using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoginModule;

namespace UAMShop
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            IDictionary<string, string> usuarioDatos = LoginModule.Login.Autenticar(correo.Text, password.Text);
            Session["usuario_id"] = usuarioDatos["usuario_id"];
            Session["usuario_nombre"] = usuarioDatos["usuario_nombre"];
            Session["usuario_apellido1"] = usuarioDatos["usuario_apellido1"];
            Session["usuario_apellido2"] = usuarioDatos["usuario_apellido2"];
            HttpCookie returnCookie = Request.Cookies["returnUrl"];
            Response.Redirect(returnCookie.Value);
        }
    }
}