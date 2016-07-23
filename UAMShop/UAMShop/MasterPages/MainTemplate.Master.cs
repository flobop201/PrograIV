using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                Response.Redirect("~/informacion.aspx");
            }

        }
    }
}