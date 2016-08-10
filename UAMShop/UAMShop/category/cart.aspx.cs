using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web.Services;
using Log4NetModule;
using SaleModule;

namespace UAMShop.category
{
    public partial class cart : System.Web.UI.Page
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

        [WebMethod]
        public static string Eliminar(Int32 id)
        {
            string mensaje = string.Empty;
            try
            {
                var carritoDal = new CarritoDal();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                var resultado = carritoDal.EliminarItem(connection, id);

                switch (resultado)
                {
                    case true:
                        mensaje = string.Format("Producto eliminado del carrito de compras.");
                        break;
                    case false:
                        mensaje = string.Format("El producto no ha sido eliminado del carrito de compras.");
                        break;
                }
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }

            return mensaje;
        }

        [WebMethod]
        public static string ActualizarCantidad(Int32 id, Int32 cantidad)
        {
            try
            {
                var carritoDal = new CarritoDal();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                carritoDal.ActualizarItem(connection, id, cantidad);

            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
            }
            return "Cantidad Actualizada";
        }


        [WebMethod]
        public static string RealizarCompra(String correo, String titular, String tarjeta)
        {
            string resultado = string.Empty;
            try
            {
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                var facturaDal = new FacturaDal();
                resultado = facturaDal.GenerarFactura(Convert.ToInt32(_idUsuario), tarjeta, titular, correo, Convert.ToString(_nombreUsuario), connection);
                return resultado;
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception, Log4Net.LogType.Error);
                return resultado;
            }
        }
    }
}