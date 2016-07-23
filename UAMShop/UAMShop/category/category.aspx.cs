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
        public List<ProductBE> listProducts;
        public int idCategoria;
        public string busqueda;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                idCategoria= Convert.ToInt16(Request["id"]);
                busqueda = Request["search"];
                ProductDAL ProductDAL = new ProductDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                listProducts = ProductDAL.RetrieveProducts(connection, idCategoria, busqueda);           
            }
            catch (Exception)
            {                    
               Response.Redirect("~/informacion.aspx");
            }
            
        }
    }
}