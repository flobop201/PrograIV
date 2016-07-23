using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UAMShop.products
{
    public partial class productdetail : System.Web.UI.Page
    {
        public string CodigoProducto;
        protected void Page_Load(object sender, EventArgs e)
        {
            CodigoProducto= Convert.ToString(Request["id"]);
           
        }
    }
}