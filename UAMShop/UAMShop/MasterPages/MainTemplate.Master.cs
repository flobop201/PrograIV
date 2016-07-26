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
                var menuDal = new MenuDal();
                ListMenuBe = menuDal.RetrieveMenu();              
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception,Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }

        }
    }
}