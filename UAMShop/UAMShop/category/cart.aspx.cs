﻿using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var carritoDal = new CarritoDal();
                string connection = WebConfigurationManager.AppSettings["ConnectionString"];
                ListCarrito = carritoDal.ObtenerCarrito(1, connection);
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
            var resultado = carritoDal.EliminarItem(connection, id);
            string mensaje = string.Empty;
            switch (resultado)
            {
                case true:
                    mensaje = string.Format("Producto eliminado al carrito de compras.");
                    break;
                case false:
                    mensaje = string.Format("El producto no ha sido eliminado del carrito de compras.");
                    break;
            }
            return mensaje;
        }

        [WebMethod]
        public static string ActualizarCantidad(Int32 id, Int32 cantidad)
        {
            var carritoDal = new CarritoDal();
            string connection = WebConfigurationManager.AppSettings["ConnectionString"];
            carritoDal.ActualizarItem(connection, id, cantidad);
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
                resultado = facturaDal.GenerarFactura(1, tarjeta, titular, correo, titular, connection);
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