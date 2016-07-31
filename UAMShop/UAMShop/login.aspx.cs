using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LoginModule;
using UserModule;

namespace UAMShop
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            UserBE usuario = LoginModule.Login.Autenticar(correo.Text, password.Text);
            if (usuario.IdUsuario != null)
            {
                Session["usuario"] = usuario;
                Session["usuario_nombre"] = usuario.Nombre;
                Session["usuario_correo"] = usuario.Usuario;
                Session["usuario_id"] = usuario.IdUsuario;
                HttpCookie returnCookie = Request.Cookies["returnUrl"];
                Response.Redirect(returnCookie.Value);
            }
        }
    }
}