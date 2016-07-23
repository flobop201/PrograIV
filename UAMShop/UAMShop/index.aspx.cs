using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProductModule;

namespace UAMShop
{
    public partial class index : System.Web.UI.Page
    {
        public List<ProductBE> listProducts;
        public int idCategoria;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {                
                ProductDAL ProductDAL = new ProductDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                listProducts = ProductDAL.RetrieveProductsTop(connection);               
                
            }
            catch (Exception)
            {
                Response.Redirect("informacion.aspx");
                
            }

        }
    }
}