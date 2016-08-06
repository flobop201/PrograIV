using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using SaleModule;

namespace UAMShop.user
{

    public partial class history : System.Web.UI.Page
    {
        public List<CarritoBe> ListCarrito;
        private static Object _idUsuario;
        private static Object _nombreUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ListCarrito = new List<CarritoBe>();
                _idUsuario = Session["usuario_id"];
                _nombreUsuario = Session["usuario_nombre"];
                if (_idUsuario != null)
                {
                    var carritoDal = new CarritoDal();
                    string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                    ListCarrito = carritoDal.ObtenerCarrito(Convert.ToInt32(_idUsuario), connection);
                }
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }
        }
    }
}