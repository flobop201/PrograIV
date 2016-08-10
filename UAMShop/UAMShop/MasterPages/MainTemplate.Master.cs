using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using MenuModule;

namespace UAMShop.MasterPages
{
    public partial class MainTemplate : System.Web.UI.MasterPage
    {
        public List<MenuBe> ListMenuBe;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var usuario = Session["usuario_id"];
                if (Page.ToString().Replace("ASP.", "").Replace("_", ".") != "login.aspx")
                {
                    Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
                }
                var menuDal = new MenuDal();
                ListMenuBe = menuDal.RetrieveMenu(Convert.ToInt32(usuario));
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }

        }

        public void logout_btn_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("usuario");
                Session.Remove("usuario_nombre");
                Session.Remove("usuario_correo");
                Session.Remove("usuario_id");
                Response.Redirect("~/login.aspx?logout=true",false);
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }

        }
    }
}