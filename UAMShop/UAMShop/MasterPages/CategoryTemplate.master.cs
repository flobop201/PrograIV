using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using CategoryModule;

namespace UAMShop.MasterPages
{
    public partial class CategoryTemplate : System.Web.UI.MasterPage
    {
        
        public List<CategoryBE> listCategory;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CategoryDAL CategoryDAL = new CategoryDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                listCategory = CategoryDAL.RetrieveCategory(connection);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}