using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using ProductModule;
using System.Web.Configuration;

namespace UAMShop.category
{
    public partial class category : System.Web.UI.Page
    {
        public List<ProductBE> ListProducts;
        public int IdCategoria;
        public string Busqueda;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IdCategoria= Convert.ToInt16(Request["id"]);
                Busqueda = Request["search"];
                var productDal = new ProductDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListProducts = productDal.RetrieveProducts(connection, IdCategoria, Busqueda);           
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }            
        }
    }
}