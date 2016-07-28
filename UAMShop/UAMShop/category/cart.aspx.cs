using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Log4NetModule;
using SaleModule;

namespace UAMShop.category
{
    public partial class cart : System.Web.UI.Page
    {
        public List<CarritoBe> ListCarrito;
                
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {             
                var carritoDal = new CarritoDal();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListCarrito = carritoDal.ObtenerCarrito(1,connection);
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                Response.Redirect("~/informacion.aspx");
            }
        }

        [WebMethod]
        public static string Eliminar(Int32 id)
        {

            var carritoDal = new CarritoDal();
            string connection = WebConfigurationManager.AppSettings["ConnectionString"];
            carritoDal.EliminarItem(connection,id);            
            return "";
        }

        [WebMethod]
        public static string ActualizarCantidad(Int32 id, Int32 cantidad)
        {

            var carritoDal = new CarritoDal();
            string connection = WebConfigurationManager.AppSettings["ConnectionString"];
            carritoDal.ActualizarItem(connection, id, cantidad);
            return "";
        }


        [WebMethod]
        public static string RealizarCompra()
        {
            string resultado = string.Empty;
            string connection = WebConfigurationManager.AppSettings["ConnectionString"];
            var facturaDal = new FacturaDal();
            facturaDal.GenerarFactura(1, "3770 XXXX XX78", "FRANCISCO LOBO P", "loboporras@gmail.com", "Francisco Lobo P", connection);
            return resultado;
        }
    }
}