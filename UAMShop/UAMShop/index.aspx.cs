using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using ProductModule;

namespace UAMShop
{
    public partial class index : System.Web.UI.Page
    {
        public List<ProductBE> ListProducts;
        public int IdCategoria;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {                
                var productDal = new ProductDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListProducts = productDal.RetrieveProductsTop(connection);                               
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception,Log4Net.LogType.Error);
                Response.Redirect("informacion.aspx");                
            }

        }
    }
}