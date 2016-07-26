using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using CategoryModule;
using Log4NetModule;

namespace UAMShop.MasterPages
{
    public partial class CategoryTemplate : System.Web.UI.MasterPage
    {
        
        public List<CategoryBE> ListCategory;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var categoryDal = new CategoryDAL();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListCategory = categoryDal.RetrieveCategory(connection);
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);                
                Response.Redirect("~/informacion.aspx");
            }
        }
    }
}