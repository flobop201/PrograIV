using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProductModule;
using System.Web.Configuration;

namespace UAMShop.category
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductDAL ProductDAL = new ProductDAL();
            string connection = WebConfigurationManager.AppSettings["ConnectionString"];

            grvStudent.DataSource = ProductDAL.RetrieveProducts(connection);
            grvStudent.DataBind();
        }
    }
}